import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  CustomSliverAppBar({
    Key key,
    this.automaticallyImplyLeading = true,
    this.title,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.backgroundColor = Colors.white,
    this.actions,
    this.bottom,
    this.flexibleSpace,
    this.elevation = 0,
    this.floating = true,
    this.forceElevated = true,
    this.primary = true,
    this.snap = false,
    this.pinned = false,
  }) : super(key: key);

  final bool automaticallyImplyLeading;
  final String title;
  final double titleSpacing;
  final Color backgroundColor;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final double elevation;
  final bool floating;
  final bool forceElevated;
  final bool primary;
  final bool snap;
  final bool pinned;
  final Widget flexibleSpace;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      titleSpacing: titleSpacing,
      elevation: elevation,
      title: title != null
          ? Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            )
          : null,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      actionsIconTheme: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      actions: actions,
      bottom: bottom,
      flexibleSpace: flexibleSpace,
      floating: floating,
      forceElevated: forceElevated,
      primary: primary,
      snap: snap,
      pinned: pinned,
    );
  }
}
