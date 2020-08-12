import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_sliver_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_tab_bar.dart';

class CustomSliverTabBarScreen extends StatefulWidget {
  CustomSliverTabBarScreen({
    Key key,
    this.appBar,
    this.headerChild,
    this.tabItems,
    this.tabBarElevated = true,
    this.tabLabelColor,
    this.tabUnselectedLabelColor,
    this.tabIsScrollable = false,
    this.tabBarViewItems,
  }) : super(key: key);

  final Widget appBar;
  final Widget headerChild;
  final List<TabBarItemData> tabItems;
  final bool tabBarElevated;
  final Color tabLabelColor;
  final Color tabUnselectedLabelColor;
  final bool tabIsScrollable;
  final List<Widget> tabBarViewItems;

  @override
  _CustomSliverTabBarScreenState createState() =>
      _CustomSliverTabBarScreenState();
}

class _CustomSliverTabBarScreenState extends State<CustomSliverTabBarScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller =
        new TabController(length: widget.tabItems?.length ?? 0, vsync: this);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              sliver: widget.appBar ??
                  CustomSliverAppBar(
                    pinned: true,
                  ),
            ),
          ),
          if (widget.headerChild != null) ...[
            SliverToBoxAdapter(
              child: widget.headerChild,
            ),
          ],
        ],
        body: Column(
          children: <Widget>[
            CustomTabBar(
              controller: controller,
              elevated: widget.tabBarElevated,
              labelColor: widget.tabLabelColor,
              unselectedLabelColor: widget.tabUnselectedLabelColor,
              isScrollable: widget.tabIsScrollable,
              tabItems: widget.tabItems,
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: widget.tabBarViewItems ?? [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
