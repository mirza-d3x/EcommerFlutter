part of 'obscure_bloc.dart';

class ObscureState {
   bool obscurePass;

  ObscureState({required this.obscurePass});
}

class InitialObscure extends ObscureState {
  InitialObscure() : super(obscurePass: true);
}
