import 'package:flutter/cupertino.dart';
import 'package:ideashare/common_widgets/platform_alert_dialog.dart';
import 'package:flutter/services.dart';
import 'package:ideashare/constants/error_keys.dart';
import 'package:ideashare/generated/l10n.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required this.context,
    String title,
    PlatformException exception,
  }) : super(
          title: title,
          defaultActionText: S.of(context).ok,
        ) {
    this.content = message(exception);
  }

  final BuildContext context;

  String message(PlatformException exception) {
    if (exception.message == 'FIRFirestoreErrorDomain') {
      if (exception.code == 'Code 7') {
        // This happens when we get a "Missing or insufficient permissions" error
        return S.of(context).errorDefault;
      }
      return exception.details;
    }
    return errors(exception.code) ?? exception.message;
  }

  // NOTE: The full list of FirebaseAuth errors is stored here:
  // https://github.com/firebase/firebase-ios-sdk/blob/2e77efd786e4895d50c3788371ec15980c729053/Firebase/Auth/Source/FIRAuthErrorUtils.m
  // These are just the most relevant for email & password sign in:
  String errors(String code) {
    switch (code) {
      case ErrorKeys.errorWeakPassword:
        return S.of(context).errorWeakPassword;
      case ErrorKeys.errorInvalidCredential:
        return S.of(context).errorInvalidCredential;
      case ErrorKeys.errorEmailAlreadyInUse:
        return S.of(context).errorEmailAlreadyInUse;
      case ErrorKeys.errorInvalidEmail:
        return S.of(context).errorInvalidEmail;
      case ErrorKeys.errorWrongPassword:
        return S.of(context).errorWrongPassword;
      case ErrorKeys.errorUserNotFound:
        return S.of(context).errorUserNotFound;
      case ErrorKeys.errorTooManyRequests:
        return S.of(context).errorTooManyRequests;
      case ErrorKeys.errorOperationNotAllowed:
        return S.of(context).errorOperationNotAllowed;
      case ErrorKeys.errorMissingGoogleAuthToken:
        return S.of(context).errorMissingGoogleAuthToken;
      case ErrorKeys.errorAbortedByUser:
        return S.of(context).errorAbortedByUser;
      case ErrorKeys.errorAccountExistsWithDifferentCredential:
        return S.of(context).errorAccountExistsWithDifferentCredential;
      default:
        return null;
    }
  }
}
