import 'package:flutter/material.dart';
import 'package:ideashare/resources/app_config.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

