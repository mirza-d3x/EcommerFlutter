import 'dart:io';
import 'package:ecommerceapi/Bloc/obscureText/obscure_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerceapi/Consatants/colors.dart';
import 'package:ecommerceapi/Consatants/Sizes.dart';
import '../../CustomDesigns/CustomShapeLogin.dart';
import '../LoginScreen/LoginScreen.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  File? images;

  Future pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final selectedImage = File(image.path);

    setState(() {
      images = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //To avoid widget resize on keyboard appeares
        resizeToAvoidBottomInset: false,
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
                    'Sign up',
                    style: GoogleFonts.oswald(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Create new account',
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
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () =>
                                                pickImage(ImageSource.camera),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: const [
                                                Icon(Icons.camera_alt_outlined),
                                                Text('Photo from Camera')
                                              ],
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () =>
                                                pickImage(ImageSource.gallery),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: const [
                                                Icon(Icons.photo),
                                                Text('Photo from Gallery'),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.height * .06,
                          backgroundColor: Colors.blue,
                          child: images != null
                              ? ClipOval(
                                  child: Image.file(
                                    images!,
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *
                                        .15,
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                  ),
                                )
                              : Icon(
                                  Icons.person_add_alt,
                                  color: Colors.black,
                                  size: 60,
                                ),
                        ),
                      ),
                      TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Full Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSubmitted: (value) {}),
                      kHeight20,
                      TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onSubmitted: (value) {}),
                      kHeight20,
                      BlocBuilder<ObscureBloc, ObscureState>(
                        builder: (context, state) {
                          return TextField(
                            obscureText: state.obscurePass,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  BlocProvider.of<ObscureBloc>(context)
                                      .add(obScureTrueFalse());
                                },
                                icon: state.obscurePass
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(
                                        FontAwesomeIcons.eyeSlash,
                                        size: 20,
                                      ),
                              ),
                              hintText: 'Create Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onSubmitted: (value) {},
                          );
                        },
                      ),
                      kHeight20,
                      BlocBuilder<ObscureBloc, ObscureState>(
                        builder: (context, state) {
                          return TextField(
                            obscureText: state.obscurePass,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  BlocProvider.of<ObscureBloc>(context)
                                      .add(obScureTrueFalse());
                                },
                                icon: state.obscurePass
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(
                                        FontAwesomeIcons.eyeSlash,
                                        size: 20,
                                      ),
                              ),
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onSubmitted: (value) {},
                          );
                        },
                      ),
                      kHeight20,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .65,
                        height: MediaQuery.of(context).size.height * .06,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Log In'),
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
                children: [
                  const Text('Already have an account'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ScreenLogin(),
                        ),
                      );
                    },
                    child: const Text('Log in'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
