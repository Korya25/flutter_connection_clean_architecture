import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_connection_clean_architecture/main.dart';

class ConnectionNotifier {
  static const Duration _animationDuration = Duration(milliseconds: 150);
  static const Curve _enterCurve = Curves.fastOutSlowIn;
  static const Curve _exitCurve = Curves.easeIn;

  static const EdgeInsets _margin = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 16,
  );
  static const BorderRadius _borderRadius = BorderRadius.all(
    Radius.circular(12),
  );
  static const List<BoxShadow> _shadows = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8.0,
      spreadRadius: 1.0,
      offset: Offset(0, 2),
    ),
  ];

  static const TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static void show({
    required String message,
    required Color color,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
    bool isDismissible = true,
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    Flushbar(
      messageText: Text(message, style: _textStyle),
      icon: icon != null ? Icon(icon, size: 24.0, color: Colors.white) : null,
      backgroundColor: color.withAlpha(200),
      duration: duration,
      borderRadius: _borderRadius,
      margin: _margin,
      padding: _padding,
      boxShadows: _shadows,
      animationDuration: _animationDuration,
      forwardAnimationCurve: _enterCurve,
      reverseAnimationCurve: _exitCurve,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: isDismissible,
      shouldIconPulse: false,
      barBlur: 4.0,
      routeBlur: 0.5,
    ).show(context);
  }

  static void showConnected() {
    show(
      message: 'Internet connection restored',
      color: Colors.green.shade700,
      icon: Icons.wifi_rounded,
      duration: const Duration(seconds: 2),
    );
  }

  static void showDisconnected() {
    show(
      message: 'No internet connection',
      color: Colors.red.shade700,
      icon: Icons.wifi_off_rounded,
      duration: const Duration(seconds: 4),
      isDismissible: false,
    );
  }
}
