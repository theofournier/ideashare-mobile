import 'package:ideashare/main_common.dart' as Main;
import 'package:ideashare/resources/app_config.dart';
import 'package:flutter/material.dart';

void main() {
  var configuredApp = AppConfig(
    appTitle: "IdeaShare Prod",
    buildFlavor: "prod",
    child: Main.MyApp(),
  );
  Main.main_common();
  runApp(configuredApp);
}
