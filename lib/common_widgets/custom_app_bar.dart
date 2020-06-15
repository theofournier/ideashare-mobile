import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key key,
    this.title,
    this.backgroundColor = const Color(0xFFFFFFFF),
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: BackButton(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  final Size preferredSize;
}
