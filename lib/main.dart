import 'package:flutter/material.dart';
import 'package:store_flutter/application/usecases/login_usecases.dart';
import 'package:store_flutter/data/datasources/auth_remote_data_source.dart';
import 'package:store_flutter/infrastructure/repositories/auth_repository_impl.dart';
import 'package:store_flutter/presentation/auth/login_controller.dart';
import 'package:store_flutter/presentations/home_screens.dart';
import 'package:store_flutter/presentations/login_screens.dart';
import 'package:http/http.dart' as http;

void main() {
  final client = http.Client();
  final authRemoteDataSource = AuthRemoteDataSource(client);
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);
  final loginUsecase = LoginUsecase(authRepository);
  final loginController = LoginController(loginUsecase);

  runApp(MyApp(loginController: loginController));
}

class MyApp extends StatelessWidget {
  final LoginController loginController;

  const MyApp({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreens(loginController: loginController),
        '/home': (context) => HomeScreens(),
      },
    );
  }
}

