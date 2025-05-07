import 'package:flutter_connection_clean_architecture/features/connection/domain/entities/connection_status.dart';

class AppConnectionState {
  final ConnectionStatus? previousStatus;
  final ConnectionStatus currentStatus;
  final bool isFirstStatusCheck;

  const AppConnectionState({
    this.previousStatus,
    required this.currentStatus,
    this.isFirstStatusCheck = true,
  });
}
