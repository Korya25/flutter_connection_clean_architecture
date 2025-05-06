import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connection_clean_architecture/features/connection/controller/connection_cubit/connection_cubit.dart';
import 'package:flutter_connection_clean_architecture/my_app.dart';
import 'features/connection/data/repositories/connection_repository_impl.dart';
import 'features/connection/domain/usecases/check_connection_usecase.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  final connectivity = Connectivity();
  final connectionRepo = ConnectionRepositoryImpl(connectivity);
  final checkConnectionUseCase = CheckConnectionUseCase(connectionRepo);

  runApp(
    BlocProvider(
      create: (_) => ConnectionCubit(checkConnectionUseCase),
      child: const MyApp(),
    ),
  );
}
