import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optimus/service/navigation_service.dart';
import 'package:optimus/utility/router.dart' as router;
import 'package:optimus/values/routes.dart' as routes;
import 'package:optimus/utility/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(chooseWidget(window.defaultRouteName));
}

Widget chooseWidget(String route) {
  log('route is printing here :: $route');
  switch (route) {
    case routes.billRoute:
      return const Land();
    default:
      return const Main();
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  String? _initialRoute;

  @override
  void initState() {
    _initialRoute = routes.homeRoute;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: _initialRoute,
      onGenerateRoute: router.generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
      title: 'Connectshop',
      /*navigatorObservers: <NavigatorObserver>[observer],*/
      debugShowCheckedModeBanner: kReleaseMode,
    );
  }
}

class Land extends StatefulWidget {
  const Land({Key? key}) : super(key: key);

  @override
  _LandState createState() => _LandState();
}

class _LandState extends State<Land> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MaterialApp Theme'),
        ),
      ),
    );
  }
}
