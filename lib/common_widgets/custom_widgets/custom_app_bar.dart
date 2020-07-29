import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key key,
    this.automaticallyImplyLeading = true,
    this.title,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.actions,
    this.elevation = 0,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  final bool automaticallyImplyLeading;
  final String title;
  final double titleSpacing;
  final Color backgroundColor;
  final List<Widget> actions;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      titleSpacing: titleSpacing,
      elevation: elevation,
      title: title != null ? Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ) : null,
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
