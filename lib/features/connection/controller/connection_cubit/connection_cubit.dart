import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/entities/connection_status.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/usecases/check_connection_usecase.dart';

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

class ConnectionCubit extends Cubit<AppConnectionState> {
  final CheckConnectionUseCase checkConnectionUseCase;

  ConnectionCubit(this.checkConnectionUseCase)
    : super(
        const AppConnectionState(
          currentStatus: ConnectionStatus.connected,
          isFirstStatusCheck: true,
        ),
      ) {
    _startMonitoring();
  }

  Future<void> _startMonitoring() async {
    // الفحص الأولي - لا نرسل أي تغيير هنا
    final initialStatus = await checkConnectionUseCase();

    // نبدأ الاستماع للتغييرات
    Connectivity().onConnectivityChanged.listen((_) async {
      final newStatus = await checkConnectionUseCase();
      emit(
        AppConnectionState(
          previousStatus: state.currentStatus,
          currentStatus: newStatus,
          isFirstStatusCheck: false,
        ),
      );
    });
  }
}
