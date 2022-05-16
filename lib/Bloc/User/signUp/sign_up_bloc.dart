import 'package:bloc/bloc.dart';
import 'package:ecommerceapi/Api/User/UserApi.dart';
import 'package:ecommerceapi/Api/User/SignupUserModel.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late SignupUserModel signupUserModel;
  UserApi userApi;

  SignUpBloc(this.userApi) : super(SignUpInitial()) {
    on<SignUpuserEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        signupUserModel = await userApi.createUser(
            event.uname, event.uemail, event.upass);
        emit(SignUpLoaded());
      } catch (e) {
        print('SignUpBloc===========$e');
        emit(SignUpError());
      }

    });
  }
}
