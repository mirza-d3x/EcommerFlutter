import 'package:ecommerceapi/Api/User/UserApi.dart';
import 'package:ecommerceapi/Bloc/obscureText/obscure_bloc.dart';
import 'package:ecommerceapi/UI/SplashScreeen/ScreenSplash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Api/Product/productApi.dart';
import 'Bloc/Login/login_bloc.dart';
import 'Bloc/Products/get_products_bloc.dart';
import 'Bloc/signUp/sign_up_bloc.dart';

void main() {
  UserApi userApi = UserApi();
  ProductApi productApi = ProductApi();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ObscureBloc(),
      ),
      BlocProvider(
        create: (context) => SignUpBloc(userApi),
      ),
      BlocProvider(
        create: (context) => LoginBloc(userApi),
      ),
      BlocProvider(
        create: (context) => GetProductsBloc(productApi),
      ),
    ],
    child: const MyApp(),
  ));
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
        appBarTheme: const AppBarTheme(
          elevation: 10,
        ),
        primarySwatch: Colors.blue,
      ),
      home: ScreenSplash(),
    );
  }
}
