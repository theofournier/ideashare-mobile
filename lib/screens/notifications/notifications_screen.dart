import 'package:flutter/material.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/notifications/notifications_view_model.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.notificationsScreen,
    );
  }

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<NotificationsViewModel>(
      create: (_) => NotificationsViewModel(),
      child: Consumer<NotificationsViewModel>(
        builder: (_, viewModel, __) => NotificationsContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class NotificationsContent extends StatelessWidget {
  const NotificationsContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final NotificationsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("NOTIFICATIONS"),
      ),
    );
  }
}
