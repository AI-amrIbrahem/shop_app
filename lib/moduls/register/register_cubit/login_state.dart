part of 'login_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {
  LoginModel loginModel;
  RegisterSuccessState( this.loginModel);
}
class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangePasswordState extends RegisterState {}
