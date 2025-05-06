import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connection_clean_architecture/core/presentation/widgets/show_connection_flushbar.dart';
import 'package:flutter_connection_clean_architecture/main.dart';
import 'features/connection/controller/connection_cubit/connection_cubit.dart';
import 'features/connection/domain/entities/connection_status.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // أضف هذا السطر
      builder: (context, child) {
        return BlocListener<ConnectionCubit, AppConnectionState>(
          listener: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (state.status == ConnectionStatus.disconnected) {
                showConnectionFlushbar("لا يوجد اتصال بالإنترنت", Colors.red);
              } else {
                showConnectionFlushbar("تم استعادة الاتصال", Colors.green);
              }
            });
          },
          child: child!,
        );
      },
      home: const Scaffold(body: Center(child: Text("Home Page"))),
    );
  }
}
