import 'package:ideashare/main_common.dart' as Main;
import 'package:ideashare/resources/app_config.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/firebase_auth_service.dart';

void main() {
  var configuredApp = AppConfig(
    appTitle: "IdeaShare Prod",
    buildFlavor: "prod",
    child: Main.MyApp(
      authServiceBuilder: (_) => FirebaseAuthService(),
    ),
  );
  Main.main_common();
  runApp(configuredApp);
}
