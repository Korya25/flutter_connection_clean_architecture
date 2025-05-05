
import '../entities/connection_status.dart';

abstract class ConnectionRepository {
  Future<ConnectionStatus> checkConnection();
}
