import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({
    @required this.title,
    this.onPressed,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      color: Color(0xFF4285F4),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              child: Image.asset(
                ImageName.googleLogo,
                height: 18,
                width: 18,
              ),
            ),
          ),
          if (title.isNotEmpty) ...[
            SizedBox(
              width: 14,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 8,
            ),
          ]
        ],
      ),
    );
  }
}

class FacebookButton extends StatelessWidget {
  FacebookButton({
    this.onPressed,
    this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: RaisedButton(
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: onPressed,
        color: Color(0xFF1877F2),
        child: Row(
          children: <Widget>[
            Image.asset(
              ImageName.facebookLogo,
            ),
            if (title.isNotEmpty) ...[
              SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 8,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
