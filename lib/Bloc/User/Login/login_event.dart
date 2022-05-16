part of 'login_bloc.dart';


abstract class LoginEvent {}

class UserLoginEvent extends LoginEvent{
  final String uname;
  final String uemail;
  final String upass;

  UserLoginEvent(this.uname, this.uemail, this.upass);
}
