import 'package:flutter/material.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/search/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.searchScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewModel>(
      create: (_) => SearchViewModel(),
      child: Consumer<SearchViewModel>(
        builder: (_, viewModel, __) => SearchContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class SearchContent extends StatefulWidget {
  const SearchContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final SearchViewModel viewModel;

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  SearchViewModel get viewModel => this.widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SEARCH"),
      ),
    );
  }
}
