import 'package:flutter_connection_clean_architecture/features/connection/domain/entities/connection_status.dart';

abstract class ConnectionRepository {
  Future<ConnectionStatus> checkConnection();
}
