import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optimus/bill/bill_view.dart';
import 'package:optimus/home/home_view.dart';
import 'package:optimus/service/navigation_service.dart';
import 'package:optimus/utility/router.dart' as router;
import 'package:optimus/values/routes.dart' as routes;
import 'package:optimus/utility/locator.dart';

const channel = "com.luluone.lite";
const platformChannel = MethodChannel(channel);

const SHOPPING = "SH";
const BILL_PAYMENTS = "PB";

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
    super.initState();
    log("Initialized main");
    //platformChannel.setMethodCallHandler(_triggerFromNative);
  }

  Future<void> _triggerFromNative(MethodCall call) async {
    switch (call.arguments) {
      case SHOPPING:
        setState(() {
          _initialRoute = routes.homeRoute;
        });
        break;
      case BILL_PAYMENTS:
        setState(() {
          _initialRoute = routes.billRoute;
        });
        break;
      default:
        setState(() {
          _initialRoute = routes.billRoute;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
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
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MaterialApp Theme'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {


  Widget currentScreen = const Home();
  String title = "Default Page";

  @override
  void initState() {
    super.initState();
    platformChannel.setMethodCallHandler(_triggerFromNative);
  }

  Future<void> _triggerFromNative(MethodCall call) async {
    if (call.method == "notifyNavToFlutter") {
      print("duyduy _triggerFromNative notifyNavToFlutter");
      // Set transparent status bar
      // Not place in build method because it won't work from the second times navigate to Flutter
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));
      switch (call.arguments) {
        case SHOPPING:
          setState(() {
            title = "Home Page";
            currentScreen = Home();
          });
          break;
        case BILL_PAYMENTS:
          setState(() {
            title = "Detail Page";
            currentScreen = BillHome();
          });
          break;
        default :
          setState(() {
            title = "Default Page";
            currentScreen = Home();
          });
          break;
      }
    } else {
      print("Another call method");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("duyduy build RootPage");
    return currentScreen;
  }
}
