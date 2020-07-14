// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `IdeaShare`
  String get authScreenTitle {
    return Intl.message(
      'IdeaShare',
      name: 'authScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share your ideas with the world or keep them private`
  String get authScreenSubtitle {
    return Intl.message(
      'Share your ideas with the world or keep them private',
      name: 'authScreenSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get authScreenSignIn {
    return Intl.message(
      'Sign In',
      name: 'authScreenSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get authScreenSignUp {
    return Intl.message(
      'Sign Up',
      name: 'authScreenSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInScreenAppBarTitle {
    return Intl.message(
      'Sign In',
      name: 'signInScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get socialFooterOr {
    return Intl.message(
      'Or',
      name: 'socialFooterOr',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get socialFooterFacebook {
    return Intl.message(
      'Facebook',
      name: 'socialFooterFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get socialFooterGoogle {
    return Intl.message(
      'Google',
      name: 'socialFooterGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get signInScreenForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'signInScreenForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInScreenButton {
    return Intl.message(
      'Sign in',
      name: 'signInScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get signInScreenEmailAddress {
    return Intl.message(
      'Email address',
      name: 'signInScreenEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signInScreenPassword {
    return Intl.message(
      'Password',
      name: 'signInScreenPassword',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get errorRequired {
    return Intl.message(
      'Required',
      name: 'errorRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email address invalid`
  String get errorEmailnvalid {
    return Intl.message(
      'Email address invalid',
      name: 'errorEmailnvalid',
      desc: '',
      args: [],
    );
  }

  /// `Invalid: must have at least 6 characters`
  String get errorPasswordInvalid {
    return Intl.message(
      'Invalid: must have at least 6 characters',
      name: 'errorPasswordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get signUpScreenFirstName {
    return Intl.message(
      'First name',
      name: 'signUpScreenFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get signUpScreenLastName {
    return Intl.message(
      'Last name',
      name: 'signUpScreenLastName',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get signUpScreenEmailAddress {
    return Intl.message(
      'Email address',
      name: 'signUpScreenEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signUpScreenPassword {
    return Intl.message(
      'Password',
      name: 'signUpScreenPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpScreenButton {
    return Intl.message(
      'Sign up',
      name: 'signUpScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpScreenAppBarTitle {
    return Intl.message(
      'Sign Up',
      name: 'signUpScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordScreenAppBarTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get forgotPasswordScreenEmailAddress {
    return Intl.message(
      'Email address',
      name: 'forgotPasswordScreenEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get forgotPasswordScreenButton {
    return Intl.message(
      'Send',
      name: 'forgotPasswordScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `We'll send you an email to reset your password.`
  String get forgotPasswordScreenText {
    return Intl.message(
      'We\'ll send you an email to reset your password.',
      name: 'forgotPasswordScreenText',
      desc: '',
      args: [],
    );
  }

  /// `Picture`
  String get selectPictureScreenAppBarTitle {
    return Intl.message(
      'Picture',
      name: 'selectPictureScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get selectPictureScreenSaveButton {
    return Intl.message(
      'Save',
      name: 'selectPictureScreenSaveButton',
      desc: '',
      args: [],
    );
  }

  /// `Import picture`
  String get selectPictureScreenImportButton {
    return Intl.message(
      'Import picture',
      name: 'selectPictureScreenImportButton',
      desc: '',
      args: [],
    );
  }

  /// `Take picture`
  String get selectPictureScreenTakeButton {
    return Intl.message(
      'Take picture',
      name: 'selectPictureScreenTakeButton',
      desc: '',
      args: [],
    );
  }

  /// `Select from default`
  String get selectPictureScreenFromDefaultButton {
    return Intl.message(
      'Select from default',
      name: 'selectPictureScreenFromDefaultButton',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get selectPictureScreenSkip {
    return Intl.message(
      'Skip',
      name: 'selectPictureScreenSkip',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed`
  String get signInScreenFailed {
    return Intl.message(
      'Sign in failed',
      name: 'signInScreenFailed',
      desc: '',
      args: [],
    );
  }

  /// `The password must be 6 characters long or more.`
  String get errorWeakPassword {
    return Intl.message(
      'The password must be 6 characters long or more.',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The credentials are invalid.`
  String get errorInvalidCredential {
    return Intl.message(
      'The credentials are invalid.',
      name: 'errorInvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already registered.`
  String get errorEmailAlreadyInUse {
    return Intl.message(
      'The email address is already registered.',
      name: 'errorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The email address is invalid.`
  String get errorInvalidEmail {
    return Intl.message(
      'The email address is invalid.',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password is incorrect.`
  String get errorWrongPassword {
    return Intl.message(
      'The password is incorrect.',
      name: 'errorWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not registered.`
  String get errorUserNotFound {
    return Intl.message(
      'The email address is not registered.',
      name: 'errorUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `We have blocked all requests from this device due to unusual activity. Try again later.`
  String get errorTooManyRequests {
    return Intl.message(
      'We have blocked all requests from this device due to unusual activity. Try again later.',
      name: 'errorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `This sign in method is not allowed. Please contact support.`
  String get errorOperationNotAllowed {
    return Intl.message(
      'This sign in method is not allowed. Please contact support.',
      name: 'errorOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `This operation could not be completed due to a server error.`
  String get errorDefault {
    return Intl.message(
      'This operation could not be completed due to a server error.',
      name: 'errorDefault',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up failed`
  String get signUpScreenFailed {
    return Intl.message(
      'Sign Up failed',
      name: 'signUpScreenFailed',
      desc: '',
      args: [],
    );
  }

  /// `Send email failed`
  String get forgotPasswordScreenFailed {
    return Intl.message(
      'Send email failed',
      name: 'forgotPasswordScreenFailed',
      desc: '',
      args: [],
    );
  }

  /// `Email sent successfully`
  String get forgotPasswordScreenSuccessTitle {
    return Intl.message(
      'Email sent successfully',
      name: 'forgotPasswordScreenSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `An email has been sent. Follow the instruction to reset your password.`
  String get forgotPasswordScreenSuccessContent {
    return Intl.message(
      'An email has been sent. Follow the instruction to reset your password.',
      name: 'forgotPasswordScreenSuccessContent',
      desc: '',
      args: [],
    );
  }

  /// `Missing Google Auth Token`
  String get errorMissingGoogleAuthToken {
    return Intl.message(
      'Missing Google Auth Token',
      name: 'errorMissingGoogleAuthToken',
      desc: '',
      args: [],
    );
  }

  /// `Sign in aborted by user`
  String get errorAbortedByUser {
    return Intl.message(
      'Sign in aborted by user',
      name: 'errorAbortedByUser',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.`
  String get errorAccountExistsWithDifferentCredential {
    return Intl.message(
      'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
      name: 'errorAccountExistsWithDifferentCredential',
      desc: '',
      args: [],
    );
  }

  /// `Default Picture`
  String get defaultPictureScreenAppBarTitle {
    return Intl.message(
      'Default Picture',
      name: 'defaultPictureScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get defaultPictureScreenSave {
    return Intl.message(
      'OK',
      name: 'defaultPictureScreenSave',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get defaultPictureScreenNoImage {
    return Intl.message(
      'No image',
      name: 'defaultPictureScreenNoImage',
      desc: '',
      args: [],
    );
  }

  /// `Select a default picture`
  String get defaultPictureScreenErrorTitle {
    return Intl.message(
      'Select a default picture',
      name: 'defaultPictureScreenErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get noImage {
    return Intl.message(
      'No image',
      name: 'noImage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}