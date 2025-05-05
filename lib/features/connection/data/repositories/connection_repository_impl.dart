import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/connection_status.dart';
import '../../domain/repositories/connection_repository.dart';

class ConnectionRepositoryImpl implements ConnectionRepository {
  final Connectivity connectivity;

  ConnectionRepositoryImpl(this.connectivity);

  @override
  Future<ConnectionStatus> checkConnection() async {
    final result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return ConnectionStatus.disconnected;
    }

    try {
      final response = await http
          .get(Uri.parse("https://www.google.com"))
          .timeout(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        return ConnectionStatus.connected;
      }
    } catch (_) {}
    return ConnectionStatus.disconnected;
  }
}
