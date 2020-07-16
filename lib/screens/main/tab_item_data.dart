import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';

class TabItemData {
  const TabItemData(
      {@required this.tabItem, @required this.title, @required this.icon,});

  final TabItem tabItem;
  final String title;
  final IconData icon;
}
