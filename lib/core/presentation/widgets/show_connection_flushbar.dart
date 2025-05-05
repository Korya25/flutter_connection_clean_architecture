
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showConnectionFlushbar(BuildContext context, String message, Color color) {
  final overlayContext = Navigator.of(context, rootNavigator: true).overlay?.context;
  if (overlayContext != null) {
    Flushbar(
      message: message,
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
    ).show(overlayContext);
  }
}
