import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_connection_clean_architecture/features/connection/controller/connection_cubit/connection_cubit.dart';
import 'package:flutter_connection_clean_architecture/features/connection/data/repositories/connection_repository_impl.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/repositories/connection_repository.dart';
import 'package:flutter_connection_clean_architecture/features/connection/domain/usecases/check_connection_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // External packages
  sl.registerLazySingleton(() => Connectivity());

  // Repositories
  sl.registerLazySingleton<ConnectionRepository>(
    () => ConnectionRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => CheckConnectionUseCase(sl()));

  // Bloc/Cubit
  sl.registerFactory(() => ConnectionCubit(sl()));
}
