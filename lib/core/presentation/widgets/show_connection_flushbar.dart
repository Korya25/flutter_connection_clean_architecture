import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_connection_clean_architecture/main.dart';

class ConnectionNotifier {
  // إعدادات متغيرة حسب المنصة
  static Duration get _animationDuration {
    return kIsWeb ? Duration(milliseconds: 200) : Duration(milliseconds: 350);
  }

  static EdgeInsets get _margin {
    return kIsWeb
        ? EdgeInsets.symmetric(horizontal: 24, vertical: 12)
        : EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  }

  static EdgeInsets get _padding {
    return kIsWeb
        ? EdgeInsets.symmetric(horizontal: 24, vertical: 20)
        : EdgeInsets.symmetric(horizontal: 20, vertical: 16);
  }

  static double get _iconSize {
    return kIsWeb ? 28.0 : 24.0;
  }

  // إعدادات ثابتة مشتركة
  static const Curve _enterCurve = Curves.fastOutSlowIn;
  static const Curve _exitCurve = Curves.easeIn;
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

    // تحديد الموضع حسب المنصة
    final position = kIsWeb ? FlushbarPosition.BOTTOM : FlushbarPosition.TOP;

    Flushbar(
      messageText: Text(
        message,
        style: _textStyle.copyWith(fontSize: kIsWeb ? 16.0 : 15.0),
      ),
      icon:
          icon != null
              ? Icon(
                icon,
                size: _iconSize,
                color: Colors.white.withOpacity(0.9),
              )
              : null,
      backgroundColor: color.withOpacity(kIsWeb ? 0.9 : 0.95),
      duration: duration,
      borderRadius: _borderRadius,
      margin: _margin,
      padding: _padding,
      boxShadows: _shadows,
      animationDuration: _animationDuration,
      forwardAnimationCurve: _enterCurve,
      reverseAnimationCurve: _exitCurve,
      flushbarPosition: position,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: isDismissible,
      shouldIconPulse: false,
      barBlur: kIsWeb ? 2.0 : 4.0,
      routeBlur: kIsWeb ? 0.2 : 0.5,
      maxWidth: kIsWeb ? 400.0 : double.infinity,
    ).show(context);
  }

  static void showConnected() {
    show(
      message: 'Internet connection restored',
      color: Colors.green.shade700,
      icon: Icons.wifi_rounded,
      duration: const Duration(seconds: kIsWeb ? 3 : 2),
    );
  }

  static void showDisconnected() {
    show(
      message: 'No internet connection',
      color: Colors.red.shade700,
      icon: Icons.wifi_off_rounded,
      duration: const Duration(seconds: kIsWeb ? 5 : 4),
    );
  }
}
