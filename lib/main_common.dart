import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/app_config.dart';
import 'package:ideashare/resources/theme.dart' as Theme;
import 'package:ideashare/screens/landing/landing_screen.dart';
import 'package:ideashare/screens/landing/landing_wiget_builder.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/auth/firebase_auth_service.dart';
import 'package:ideashare/resources/router.dart';
import 'package:provider/provider.dart';

void main_common() {
  // Background init code
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
    this.authServiceBuilder,
  }) : super(key: key);

  final FirebaseAuthService Function(BuildContext context) authServiceBuilder;

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return _buildApp(config.appTitle);
  }

  Widget _buildApp(String appName) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: authServiceBuilder,
        ),
      ],
      child: LandingWidgetBuilder(
        builder: (BuildContext context, AsyncSnapshot<UserAuth> userSnapshot) {
          return MaterialApp(
            theme: Theme.themeData,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: Router.onGenerateRoute,
            home: LandingScreen(
              userSnapshot: userSnapshot,
            ),
          );
        },
      ),
    );
  }
}
