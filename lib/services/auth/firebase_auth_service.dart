import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/constants/error_keys.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserAuth _userAuthFromFirebaseUser(FirebaseUser firebaseUser) {
    if (firebaseUser == null) {
      return null;
    }
    return UserAuth(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoUrl,
    );
  }

  @override
  Stream<UserAuth> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userAuthFromFirebaseUser);
  }

  @override
  Future<UserAuth> signInWithEmailAndPassword(
      String email, String password) async {
    final AuthResult authResult = await _firebaseAuth
        .signInWithCredential(EmailAuthProvider.getCredential(
      email: email,
      password: password,
    ));
    return _userAuthFromFirebaseUser(authResult.user);
  }

  @override
  Future<UserAuth> createUserWithEmailAndPassword(
      String email, String password) async {
    final AuthResult authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return _userAuthFromFirebaseUser(authResult.user);
  }

  @override
  Future<UserAuth> updateInfo({
    String displayName,
    String photoUrl,
  }) async {
    FirebaseUser user = await _firebaseAuth.currentUser();

    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = displayName ?? user.displayName;
    updateInfo.photoUrl = photoUrl ?? user.photoUrl;

    await user.updateProfile(updateInfo);
    await user.reload();

    return _userAuthFromFirebaseUser(user);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserAuth> currentUser() async {
    final FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    return _userAuthFromFirebaseUser(firebaseUser);
  }

  @override
  Future<UserAuth> signInWithFacebook() async {
    final FacebookLogin facebookLogin = FacebookLogin();
    final FacebookLoginResult result =
        await facebookLogin.logIn(<String>['public_profile']);
    if (result.accessToken != null) {
      final AuthResult authResult = await _firebaseAuth.signInWithCredential(
        FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token),
      );
      return _userAuthFromFirebaseUser(authResult.user);
    } else {
      throw PlatformException(
          code: ErrorKeys.errorAbortedByUser,
          message: 'Sign in aborted by user');
    }
  }

  @override
  Future<UserAuth> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final AuthResult authResult = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return _userAuthFromFirebaseUser(authResult.user);
      } else {
        throw PlatformException(
            code: ErrorKeys.errorMissingGoogleAuthToken,
            message: 'Missing Google Auth Token');
      }
    } else {
      throw PlatformException(
          code: ErrorKeys.errorAbortedByUser,
          message: 'Sign in aborted by user');
    }
  }

  @override
  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final FacebookLogin facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    return _firebaseAuth.signOut();
  }
}
