import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_connection_clean_architecture/main.dart';

void showConnectionFlushbar(String message, Color color) {
  final context = navigatorKey.currentContext;
  if (context == null) return;

  Flushbar(
    message: message,
    backgroundColor: color,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.zero,
    borderRadius: BorderRadius.zero,
  ).show(context);
}
