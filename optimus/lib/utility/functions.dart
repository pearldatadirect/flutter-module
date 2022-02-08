import 'dart:developer';

import 'package:flutter/material.dart';

double getAspectRatio(BuildContext context, {double? matchValue}) {
  if (matchValue != null) {
    return MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height -
            (MediaQuery.of(context).padding.top + matchValue));
  } else {
    return MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height -
            (MediaQuery.of(context).padding.top));
  }
}

String formatString(String source) {
  String _string = source.trim().toLowerCase().replaceAll(' ', '');
  return _string[0].toUpperCase() + _string.substring(1);
}

void logError(String code, String message) =>
    log('Error: $code\nError Message: $message');

Widget getVideoAction(
    {required String title,
      required IconData icon,
      required bool isShare,
      Color? color}) {
  return Container(
    margin: const EdgeInsets.only(top: 15.0),
    width: 60,
    height: 50,
    child: Column(children: [
      Icon(icon, size: 25.0, color: color ?? Colors.white),
      Padding(
        padding: const EdgeInsets.only(top: 3.5),
        child: Text(title,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )),
      )
    ]),
  );
}

String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();


Color? hexToColor(String? code) {
  if (code != null) {
    return Color(int.parse(code.replaceAll('#', '0xFF')));
  } else {
    return null;
  }
}