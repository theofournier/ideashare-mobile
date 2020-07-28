import 'package:flutter/services.dart';
import 'package:ideashare/common_widgets/alert_dialogs/platform_alert_dialog.dart';
import 'package:ideashare/constants/error_keys.dart';
import 'package:ideashare/generated/l10n.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    String title,
    PlatformException exception,
  }) : super(
          title: title,
          defaultActionText: S.current.ok,
        ) {
    this.content = message(exception);
  }

  String message(PlatformException exception) {
    if (exception.message == 'FIRFirestoreErrorDomain') {
      if (exception.code == 'Code 7') {
        // This happens when we get a "Missing or insufficient permissions" error
        return S.current.errorDefault;
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
        return S.current.errorWeakPassword;
      case ErrorKeys.errorInvalidCredential:
        return S.current.errorInvalidCredential;
      case ErrorKeys.errorEmailAlreadyInUse:
        return S.current.errorEmailAlreadyInUse;
      case ErrorKeys.errorInvalidEmail:
        return S.current.errorInvalidEmail;
      case ErrorKeys.errorWrongPassword:
        return S.current.errorWrongPassword;
      case ErrorKeys.errorUserNotFound:
        return S.current.errorUserNotFound;
      case ErrorKeys.errorTooManyRequests:
        return S.current.errorTooManyRequests;
      case ErrorKeys.errorOperationNotAllowed:
        return S.current.errorOperationNotAllowed;
      case ErrorKeys.errorMissingGoogleAuthToken:
        return S.current.errorMissingGoogleAuthToken;
      case ErrorKeys.errorAbortedByUser:
        return S.current.errorAbortedByUser;
      case ErrorKeys.errorAccountExistsWithDifferentCredential:
        return S.current.errorAccountExistsWithDifferentCredential;
      default:
        return null;
    }
  }
}
