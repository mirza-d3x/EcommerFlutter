import 'package:ecommerceapi/UI/Designs/ContainerBlue.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomPaint(
        foregroundPainter: ContainerBlue(),
      ),
    );
  }
}
