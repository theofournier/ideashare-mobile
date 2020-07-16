import 'package:flutter/material.dart';
import 'package:ideashare/screens/main/custom_bottom_navigation_bar.dart';
import 'package:ideashare/screens/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: TabItem.home.index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(
        pageController: pageController,
      ),
      child: Consumer<MainViewModel>(
        builder: (_, viewModel, __) => MainContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final MainViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: viewModel.pages,
        controller: viewModel.pageController,
        onPageChanged: (index) => viewModel.onPageChanged(TabItem.values[index]),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: viewModel.currentTab.index,
        onTap: (index) => viewModel.selectTab(TabItem.values[index]),
        tabItemData: viewModel.tabItemData(context),
      ),
    );
  }
}
