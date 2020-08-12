import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class TabBarItemData {
  TabBarItemData({
    this.text,
    this.icon,
  }) : assert(text != null || icon != null);

  final String text;
  final IconData icon;
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key key,
    this.controller,
    this.tabItems,
    this.elevated = true,
    this.labelColor,
    this.unselectedLabelColor,
    this.isScrollable = false,
  }) : super(key: key);

  final TabController controller;
  final List<TabBarItemData> tabItems;
  final bool elevated;
  final Color labelColor;
  final Color unselectedLabelColor;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: !elevated
            ? []
            : [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  offset: Offset(0, 3),
                  blurRadius: 2,
                )
              ],
      ),
      child: TabBar(
        controller: controller,
        labelColor: labelColor ?? Theme.of(context).accentColor,
        unselectedLabelColor: unselectedLabelColor ?? AppColors.greyDark,
        isScrollable: isScrollable,
        indicatorColor: labelColor ?? Theme.of(context).accentColor,
        labelStyle: Theme.of(context).textTheme.bodyText1.toSemiBold(),
        unselectedLabelStyle: Theme.of(context).textTheme.bodyText2.toMedium(),
        tabs: tabItems == null || tabItems.isEmpty
            ? []
            : tabItems
                .map((tabItem) => Tab(
                      text: tabItem.text,
                      icon: tabItem.icon == null ? null : Icon(tabItem.icon),
                    ))
                .toList(),
      ),
    );
  }
}
