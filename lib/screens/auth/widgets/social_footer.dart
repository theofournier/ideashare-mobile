import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/social_buttons.dart';
import 'package:ideashare/generated/l10n.dart';

class SocialFooter extends StatelessWidget {
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
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FacebookButton(
              title: S.of(context).socialFooterFacebook,
              onPressed: () {},
            ),
            GoogleButton(
              title: S.of(context).socialFooterGoogle,
              onPressed: () {},
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
