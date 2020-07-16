import 'package:flutter/material.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/screens/main/tab_item_data.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    this.currentIndex,
    this.onTap,
    this.tabItemData,
  });

  final int currentIndex;
  final Function(int index) onTap;
  final List<TabItemData> tabItemData;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: "Montserrat",
      ),
      unselectedItemColor: AppColors.greyDark,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.shifting,
      items: tabItemData
          .map((tabItem) => BottomNavigationBarItem(
                icon: Icon(tabItem.icon),
                title: Text(tabItem.title),
                backgroundColor: Colors.white,
              ))
          .toList(),
    );
  }
}
