import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/entities/connection_status.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/usecases/check_connection_usecase.dart';

class AppConnectionState {
  final ConnectionStatus status;
  const AppConnectionState(this.status);
}

class ConnectionCubit extends Cubit<AppConnectionState> {
  final CheckConnectionUseCase checkConnectionUseCase;

  ConnectionCubit(this.checkConnectionUseCase)
    : super(const AppConnectionState(ConnectionStatus.connected)) {
    _startMonitoring();
  }

  void _startMonitoring() {
    Connectivity().onConnectivityChanged.listen((_) async {
      final status = await checkConnectionUseCase();
      emit(AppConnectionState(status));
    });
  }
}
