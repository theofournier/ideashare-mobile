import 'package:flutter/material.dart';
import 'package:ideashare/resources/app_config.dart';
import 'package:ideashare/resources/theme.dart' as Theme;

void main_common() {
  // Background init code
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return _buildApp(config.appTitle);
  }
  Widget _buildApp(String appName){
    return MaterialApp(
      title: appName,
      theme: Theme.themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return Center(
      child: Text(config.appTitle),
    );
  }
}

