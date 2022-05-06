import 'package:bloc/bloc.dart';
import 'package:ecommerceapi/Api/SignUp/SignupUser.dart';
import 'package:ecommerceapi/Api/SignUp/SignupUserModel.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late SignupUserModel signupUserModel;
  SignupUserApi signupUserApi;

  SignUpBloc(this.signupUserApi) : super(SignUpInitial()) {
    on<SignUpuserEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        signupUserModel = await signupUserApi.createUser(
            event.uname, event.uemail, event.upass);
        emit(SignUpLoaded());
      } catch (e) {
        emit(SignUpError());
      }
      // TODO: implement event handler
    });
  }
}
