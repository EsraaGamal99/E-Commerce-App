import 'package:shop_app/models/login_model.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegistersSuccessState extends RegisterStates
{
  final LoginModel loginModel;

  RegistersSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates
{
  final String error;

  RegisterErrorState(this.error);

}
class ChangePasswordState extends RegisterStates{}