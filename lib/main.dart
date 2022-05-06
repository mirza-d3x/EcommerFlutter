import 'dart:js';

import 'package:ecommerceapi/Api/SignUp/SignupUser.dart';
import 'package:ecommerceapi/Bloc/obscureText/obscure_bloc.dart';
import 'package:ecommerceapi/Bloc/signUp/sign_up_bloc.dart';
import 'package:ecommerceapi/UI/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SignupUserApi signupUserApi = SignupUserApi();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ObscureBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(signupUserApi),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 10,
        ),
        primarySwatch: Colors.blue,
      ),
      home: ScreenLogin(),
    );
  }
}
