import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/social_buttons.dart';
import 'package:ideashare/generated/l10n.dart';

class SocialFooter extends StatelessWidget {
  SocialFooter({
    this.enabled = true,
    this.signInWithGoogle,
    this.signInWithFacebook,
  });

  final bool enabled;
  final VoidCallback signInWithGoogle;
  final VoidCallback signInWithFacebook;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            line(context),
            Text(
              S.of(context).socialFooterOr.toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            line(context),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FacebookButton(
              title: S.of(context).socialFooterFacebook,
              onPressed: enabled ? signInWithFacebook : null,
            ),
            GoogleButton(
              title: S.of(context).socialFooterGoogle,
              onPressed: enabled ? signInWithGoogle : null,
            ),
          ],
        ),
      ],
    );
  }

  Widget line(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 1.3,
          color: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
