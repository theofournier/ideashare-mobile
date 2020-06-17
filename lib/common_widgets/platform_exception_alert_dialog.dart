import 'package:flutter/cupertino.dart';
import 'package:ideashare/common_widgets/platform_alert_dialog.dart';
import 'package:flutter/services.dart';
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
      case 'ERROR_WEAK_PASSWORD':
        return S.of(context).errorWeakPassword;
      case 'ERROR_INVALID_CREDENTIAL':
        return S.of(context).errorInvalidCredential;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return S.of(context).errorEmailAlreadyInUse;
      case 'ERROR_INVALID_EMAIL':
        return S.of(context).errorInvalidEmail;
      case 'ERROR_WRONG_PASSWORD':
        return S.of(context).errorWrongPassword;
      case 'ERROR_USER_NOT_FOUND':
        return S.of(context).errorUserNotFound;
      case 'ERROR_TOO_MANY_REQUESTS':
        return S.of(context).errorTooManyRequests;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return S.of(context).errorOperationNotAllowed;
      default:
        return null;
    }
  }
}
