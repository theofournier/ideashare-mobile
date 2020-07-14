import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key key,
    this.title,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.actions,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final Color backgroundColor;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      actionsIconTheme: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      actions: actions,
    );
    return appBar;
  }

  @override
  final Size preferredSize;
}
