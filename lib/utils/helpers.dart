import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  static void launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Flushbar(
        borderRadius: 8,
        message: S.of(context).invalidUrl,
        margin: const EdgeInsets.all(8),
        icon: Icon(Icons.error_outline, color: Colors.white,),
        backgroundColor: Theme.of(context).errorColor,
        duration: Duration(seconds: 3),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        shouldIconPulse: false,
      ).show(context);
    }
  }
}
