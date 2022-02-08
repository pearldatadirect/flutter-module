import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:optimus/bill/bill_view.dart';
import 'package:optimus/home/home_view.dart';
import 'package:optimus/values/routes.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  log('Route Name => ${settings.name}');
  log('Route Arguments  => ${settings.arguments}');

  var arguments = settings.arguments;
  if (arguments is Map) {
    Map data = settings.arguments as Map<String, dynamic>;
  }

  switch (settings.name) {
    case routes.homeRoute:
      return MaterialPageRoute(builder: (context) => const Home());
    case routes.billRoute:
      return MaterialPageRoute(builder: (context) => const BillHome());
    default:
      return errorPageRoute(settings);
  }
}

MaterialPageRoute<dynamic> errorPageRoute(RouteSettings settings) {
  if (kReleaseMode) {
    return MaterialPageRoute(builder: (context) => const Home());
  } else {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}