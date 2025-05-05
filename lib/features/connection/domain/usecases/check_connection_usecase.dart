
import '../repositories/connection_repository.dart';
import '../entities/connection_status.dart';

class CheckConnectionUseCase {
  final ConnectionRepository repository;

  CheckConnectionUseCase(this.repository);

  Future<ConnectionStatus> call() async {
    return await repository.checkConnection();
  }
}
