import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/data/repo/repo.dart';
import 'package:shop_app/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  IconData suffix = Icons.visibility_off;
  bool isPassword = true;

  void changePasswordVisiablity(){
    isPassword = !isPassword;
    if(isPassword){
      suffix = Icons.visibility_off;
    }else
    suffix = Icons.visibility_outlined;
    emit(LoginChangePasswordState());
  }

  Repo repo = Repo();

  static LoginCubit get(context)=>BlocProvider.of<LoginCubit>(context);

  void Login(String email,String password)async{
    emit(LoginLoadingState());
    repo.login(email, password).then((value) {

      emit(LoginSuccessState(LoginModel.fromJson(value.data)));
    }).catchError((value){
      emit(LoginErrorState(value.toString()));
    });
  }

}
