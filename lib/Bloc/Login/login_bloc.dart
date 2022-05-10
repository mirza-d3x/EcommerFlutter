import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapi/Api/User/UserApi.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserApi userApi;
  late String LoginRes;

  // String LoginSuccess = "\"Login Successful!\"";
  String LoginFail = "Incorrect Email or password!";

  LoginBloc(this.userApi) : super(LoginInitial()) {
    on<UserLoginEvent>(
      (event, emit) async {
        emit(LoginLoading());

        try {
          LoginRes =
              await userApi.loginUser(event.uname, event.uemail, event.upass);
         // emit(LoginLoaded());
          if (LoginRes == "\"Login successful!\"") {
            print("=================$LoginRes");
            emit(LoginLoaded());
          } else if(LoginRes == "\"Unauthorized\"") {
            print(LoginFail);
            emit(LoginIncorrect());
          }
        } catch (e) {
          emit(LoginError());

          print('LoginBloc===========$e======================');
        }
      },
    );
  }
}
