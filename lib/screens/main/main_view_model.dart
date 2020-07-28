import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/home/home_screen.dart';
import 'package:ideashare/screens/main/tab_item_data.dart';
import 'package:ideashare/screens/notifications/notifications_screen.dart';
import 'package:ideashare/screens/post/add_post/add_post_start_screen.dart';
import 'package:ideashare/screens/profile/profile_screen.dart';
import 'package:ideashare/screens/search/search_screen.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

enum TabItem {
  home,
  search,
  addPost,
  notifications,
  profile,
}

class MainViewModel with ChangeNotifier {
  MainViewModel({@required this.pageController});

  PageController pageController;
  TabItem currentTab = TabItem.home;

  final List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    AddPostStartScreen(),
    NotificationsScreen(),
    ProfileScreen()
  ];

  List<TabItemData> tabItemData() => [
        TabItemData(
          tabItem: TabItem.home,
          title: S.current.tabTitleHome,
          icon: currentTab == TabItem.home ? Icons.home : OMIcons.home,
        ),
        TabItemData(
          tabItem: TabItem.search,
          title: S.current.tabTitleSearch,
          icon: Icons.search,
        ),
        TabItemData(
          tabItem: TabItem.addPost,
          title: S.current.tabTitleAddPost,
          icon: currentTab == TabItem.addPost
              ? Icons.add_circle
              : Icons.add_circle_outline,
        ),
        TabItemData(
          tabItem: TabItem.notifications,
          title: S.current.tabTitleNotifications,
          icon: currentTab == TabItem.notifications
              ? Icons.notifications
              : Icons.notifications_none,
        ),
        TabItemData(
          tabItem: TabItem.profile,
          title: S.current.tabTitleProfile,
          icon: currentTab == TabItem.profile
              ? Icons.person
              : Icons.person_outline,
        ),
      ];

  void updateWith({
    TabItem currentTab,
  }) {
    this.currentTab = currentTab ?? this.currentTab;
    notifyListeners();
  }

  void selectTab(TabItem tabItem) {
    updateWith(currentTab: tabItem);
    pageController.jumpToPage(tabItem.index);
  }

  void onPageChanged(TabItem tabItem) {
    updateWith(currentTab: tabItem);
  }

  Future<bool> onWillPop() async {
    if (currentTab == TabItem.home) {
      return true;
    }
    selectTab(TabItem.home);
    return false;
  }
}
