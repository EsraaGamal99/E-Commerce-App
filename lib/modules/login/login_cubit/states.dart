import 'package:shop_app/models/login_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginsSuccessState extends LoginStates
{
  final LoginModel loginModel;

  LoginsSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);

}
class PasswordState extends LoginStates{}