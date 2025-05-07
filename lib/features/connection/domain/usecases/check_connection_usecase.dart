import 'package:flutter_connection_clean_architecture/features/connection/domain/entities/connection_status.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/repositories/connection_repository.dart';

class CheckConnectionUseCase {
  final ConnectionRepository repository;

  CheckConnectionUseCase(this.repository);

  Future<ConnectionStatus> call() async {
    return await repository.checkConnection();
  }
}
