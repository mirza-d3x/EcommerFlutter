// ignore_for_file: must_be_immutable
import 'package:ecommerceapi/Bloc/User/signUp/sign_up_bloc.dart';
import 'package:ecommerceapi/Bloc/obscureText/obscure_bloc.dart';
import 'package:ecommerceapi/UI/HomeScreen/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapi/Consatants/colors.dart';
import 'package:ecommerceapi/Consatants/Sizes.dart';
import '../../CustomDesigns/CustomShapeLogin.dart';
import '../LoginScreen/LoginScreen.dart';
import '../Widgets/validation.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({Key? key}) : super(key: key);

  final formKeySignup = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            );
          }
          if (state is SignUpLoaded) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const ScreenHome(),
                ),
                ModalRoute.withName('/'));
          }
          if (state is SignUpError) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Center(
                    child: Text('Something went wrong'),
                  ),
                );
              },
            );
          }
        },
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
                    height: MediaQuery.of(context).size.height * .60,
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
                    child: Form(
                      key: formKeySignup,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Full Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              return validateName(value!);
                            },
                          ),
                          kHeight20,
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              return validateEmail(value!);
                            },
                          ),
                          kHeight20,
                          BlocBuilder<ObscureBloc, ObscureState>(
                            builder: (context, state) {
                              return TextFormField(
                                obscureText: state.obscurePass,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.key),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<ObscureBloc>(context)
                                          .add(obScureTrueFalse());
                                    },
                                    icon: state.obscurePass
                                        ? const Icon(
                                            Icons.remove_red_eye_outlined)
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
                                validator: (value) {
                                  return validatePassword(value!);
                                },
                              );
                            },
                          ),
                          kHeight20,
                          BlocBuilder<ObscureBloc, ObscureState>(
                            builder: (context, state) {
                              return TextFormField(
                                controller: passwordController,
                                obscureText: state.obscurePass,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.key),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<ObscureBloc>(context)
                                          .add(obScureTrueFalse());
                                    },
                                    icon: state.obscurePass
                                        ? const Icon(
                                            Icons.remove_red_eye_outlined)
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
                                validator: (value) {
                                  return validateCofirmPass(value!, cPass.text);
                                },
                              );
                            },
                          ),
                          kHeight20,
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .65,
                            height: MediaQuery.of(context).size.height * .06,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKeySignup.currentState!.validate()) {
                                  print("Validated");
                                  BlocProvider.of<SignUpBloc>(context).add(
                                    SignUpuserEvent(
                                        nameController.text,
                                        emailController.text,
                                        passwordController.text),
                                  );
                                } else {
                                  print("Not Validated");
                                }
                                return;
                              },
                              child: const Text('Sign Up'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account'),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ScreenLogin(),
                                    ),
                                  );
                                },
                                child: const Text('Log in'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
