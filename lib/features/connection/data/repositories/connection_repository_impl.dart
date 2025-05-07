import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/entities/connection_status.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/repositories/connection_repository.dart';
import 'package:http/http.dart' as http;

class ConnectionRepositoryImpl implements ConnectionRepository {
  final Connectivity connectivity;
  final http.Client client;

  // استخدام روابط مختلفة حسب المنصة
  static String get _testUrl =>
      kIsWeb
          ? 'https://httpbin.org/status/200' // أفضل للويب
          : 'https://www.gstatic.com/generate_204';

  static const Duration _timeoutDuration = Duration(seconds: 3);
  static const int _maxRetries = kIsWeb ? 3 : 2; // محاولات أكثر للويب

  ConnectionRepositoryImpl(this.connectivity, {http.Client? client})
    : client = client ?? http.Client();

  @override
  Future<ConnectionStatus> checkConnection() async {
    try {
      // 1. التحقق من اتصال الشبكة الأساسي
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return ConnectionStatus.disconnected;
      }

      // 2. التحقق من اتصال الإنترنت الفعلي
      for (int attempt = 0; attempt < _maxRetries; attempt++) {
        try {
          final response = await client
              .get(Uri.parse(_testUrl))
              .timeout(_timeoutDuration);

          if (response.statusCode == 200 ||
              (response.statusCode == 204 && !kIsWeb)) {
            return ConnectionStatus.connected;
          }
        } on SocketException {
          return ConnectionStatus.disconnected;
        } on TimeoutException {
          if (attempt == _maxRetries - 1) return ConnectionStatus.disconnected;
        } catch (_) {
          if (attempt == _maxRetries - 1) return ConnectionStatus.disconnected;
        }

        await Future.delayed(const Duration(milliseconds: 500));
      }

      return ConnectionStatus.disconnected;
    } catch (e) {
      return ConnectionStatus.disconnected;
    }
  }

  @override
  void dispose() {
    client.close();
  }
}
