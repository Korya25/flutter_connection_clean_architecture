import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_connection_clean_architecture/main.dart';

class ConnectionNotifier {
  static void show({
    required String message,
    required Color color,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    Flushbar(
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: icon != null ? Icon(icon, size: 28.0, color: Colors.white) : null,
      backgroundColor: color,
      duration: duration,
      borderRadius: BorderRadius.circular(8.0),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10.0,
          spreadRadius: 1.0,
          offset: const Offset(0, 2),
        ),
      ],
      animationDuration: const Duration(milliseconds: 300),
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.easeInCubic,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: false,
    ).show(context);
  }

  // Methods for specific connection states
  static void showConnected() {
    show(
      message: 'Internet connection restored',
      color: Colors.green.shade600,
      icon: Icons.wifi,
    );
  }

  static void showDisconnected() {
    show(
      message: 'No internet connection',
      color: Colors.red.shade600,
      icon: Icons.wifi_off,
    );
  }
}

// Custom Flushbar
void showConnectionFlushbar(String message, Color color) {
  ConnectionNotifier.show(message: message, color: color);
}
