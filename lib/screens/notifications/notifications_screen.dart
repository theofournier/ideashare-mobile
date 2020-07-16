import 'package:flutter/material.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/home/home_view_model.dart';
import 'package:ideashare/screens/notifications/notifications_view_model.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.notificationsScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
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

class NotificationsContent extends StatefulWidget {
  const NotificationsContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final NotificationsViewModel viewModel;

  @override
  _NotificationsContentState createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent> {
  NotificationsViewModel get viewModel => this.widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("NOTIFICATIONS"),
      ),
    );
  }
}
