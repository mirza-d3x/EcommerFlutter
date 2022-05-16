part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpuserEvent extends SignUpEvent {
  final String uname;
  final String uemail;
  final String upass;

  SignUpuserEvent(this.uname, this.uemail, this.upass);
}
