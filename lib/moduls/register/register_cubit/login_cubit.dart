import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/data/repo/repo.dart';
import 'package:shop_app/models/login_model.dart';

part 'login_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  IconData suffix = Icons.visibility_off;
  bool isPassword = true;

  void changePasswordVisiablity(){
    isPassword = !isPassword;
    if(isPassword){
      suffix = Icons.visibility_off;
    }else
    suffix = Icons.visibility_outlined;
    emit(RegisterChangePasswordState());
  }

  Repo repo = Repo();

  static RegisterCubit get(context)=>BlocProvider.of<RegisterCubit>(context);

  void register(String email,String password,String name,String phone)async{
    emit(RegisterLoadingState());
    repo.register(email, password,name,phone).then((value) {

      emit(RegisterSuccessState(LoginModel.fromJson(value.data)));
    }).catchError((value){
      emit(RegisterErrorState(value.toString()));
    });
  }

}
