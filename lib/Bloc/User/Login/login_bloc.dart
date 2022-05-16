import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:ecommerceapi/Api/User/UserApi.dart';

part 'login_event.dart';

part 'login_state.dart';
late bool sharedValue;

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
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('LoginTF', true);

          } else{
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
