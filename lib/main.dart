import 'package:ecommerceapi/UI/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'UI/SignUpScreen/ScreenSignUp.dart';

void main() {
  runApp(const MyApp());
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

        primarySwatch: Colors.blue,
      ),
      home: const ScreenSignup(),
    );
  }
}

