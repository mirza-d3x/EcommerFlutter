import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../LoginScreen/LoginScreen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    waitingSplash();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shopsy',
              style: GoogleFonts.caveat(
                fontSize: 100,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.shopping_bag_rounded,
              size: 50,
            )
          ],
        ),
      ),
    );
  }

  Future waitingSplash() async {
    await Future.delayed(Duration(seconds: 1));
    await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ScreenLogin(),
        ),
        ModalRoute.withName('/'));
  }
}
