import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connection_clean_architecture/core/di/dependency_injection.dart';
import 'package:flutter_connection_clean_architecture/features/connection/controller/connection_cubit/connection_cubit.dart';
import 'package:flutter_connection_clean_architecture/my_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencyInjection();
  runApp(
    BlocProvider(create: (_) => sl<ConnectionCubit>(), child: const MyApp()),
  );
}
