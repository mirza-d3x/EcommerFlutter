

import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../../Core/Sizes.dart';
import '../../Core/colors.dart';
import '../../CustomDesigns/CustomShapeLogin.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x7D7D65EC), Colors.blue],
                  begin: FractionalOffset(0.5, 0.0),
                  end: FractionalOffset(0.0, 0.5),
                ),
              ),
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
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 3,
              top: MediaQuery.of(context).size.width / 7,
              child: Column(
                children: [
                  Text(
                    'Log In',
                    style: GoogleFonts.oswald(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Log    into   your   account',
                    style: GoogleFonts.bebasNeue(
                      color: white05,
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * .80,
                height: MediaQuery.of(context).size.height * .60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      spreadRadius: 4,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      cHeight30,
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.key),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password ?',
                          style: TextStyle(color: cGrey),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .65,
                        height: MediaQuery.of(context).size.height * .06,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Log In'),
                        ),
                      ),
                      cHeight30,
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: cGrey,
                              thickness: 1,
                            ),
                          ),
                          const Text('or'),
                          Expanded(
                            child: Divider(
                              color: cGrey,
                              thickness: 1,
                            ),
                          )
                        ],
                      ),
                      cHeight30,
                      Container(

                        width: MediaQuery.of(context).size.width * .65,
                        height: MediaQuery.of(context).size.height * .06,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(FontAwesomeIcons.google),
                              Text('LOGIN WITH GOOGLE'),
                            ],
                          ),

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),

                          ),
                        ),
                      ),
                      cHeight30,
                      Container(

                        width: MediaQuery.of(context).size.width * .65,
                        height: MediaQuery.of(context).size.height * .06,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.facebook),
                              Text('LOGIN WITH FACEBOOK'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 5,
              left: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [Text('Dont have an account'),TextButton(onPressed: (){},child: Text('Sign Up'),)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
