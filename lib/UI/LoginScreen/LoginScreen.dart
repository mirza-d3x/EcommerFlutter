import 'package:flutter/material.dart';
import '../../CustomDesigns/CustomShapeLogin.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0x7D7D65EC), Colors.blue],
                begin: FractionalOffset(0.5, 0.0),
                end: FractionalOffset(0.0, 0.5),
              )),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                  clipper: Customshape(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .70,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      "GeeksforGeeks",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
