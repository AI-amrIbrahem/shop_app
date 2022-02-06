import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/prefrence/app_pref.dart';
import 'package:shop_app/layout/shop_layout/shop_layout.dart';
import 'package:shop_app/moduls/login/login_screen.dart';
import 'package:shop_app/moduls/register/register_cubit/login_cubit.dart';
import 'package:shop_app/resoruces/app_colors.dart';
import 'package:shop_app/resoruces/strings.dart';
import 'package:shop_app/widgets/button_widget.dart';
import 'package:shop_app/widgets/input_text_widget.dart';
import 'package:shop_app/widgets/toast_widget.dart';

class RegisterScreen extends StatelessWidget {
  var globalKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passowrdController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            if (state.loginModel.status){
              CashHelper.saveData(key: AppStrings.tokenKey, value: state.loginModel.data.token).then((value){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopLayout(),
                    ));
              });
              myToast(msg:state.loginModel.message, color: Colors.green);
            }else{
              myToast(msg:state.loginModel.message, color: Colors.red);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.registerText.toUpperCase(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: AppColors.primary),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppStrings.registerSub,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        getTextFormField(
                            prefIcon: Icons.email,
                            labelText: AppStrings.emailAddress,
                            myKeyboardtype: TextInputType.emailAddress,
                            controller: emailController,
                            validFun: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.notValidEmail;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        getTextFormField(
                            prefIcon: Icons.person,
                            labelText: AppStrings.name,
                            myKeyboardtype: TextInputType.name,
                            controller: nameController,
                            validFun: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.nameValidEmail;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        getTextFormField(
                            prefIcon: Icons.mobile_friendly,
                            labelText: AppStrings.phone,
                            myKeyboardtype: TextInputType.phone,
                            controller: phoneController,
                            validFun: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.phoneValidEmail;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        getTextFormField(
                            onsubmitted: (value) {
                              if (globalKey.currentState!.validate()) {
                                RegisterCubit.get(context).register(emailController.text.toString(),passowrdController.text.toString(),nameController.text.toString(),phoneController.text.toString());
                              }
                            },
                            suffixFun: () {
                              RegisterCubit.get(context).changePasswordVisiablity();
                            },
                            sufxIcon: RegisterCubit.get(context).suffix,
                            prefIcon: Icons.lock,
                            isPassword: RegisterCubit.get(context).isPassword,
                            labelText: AppStrings.password,
                            myKeyboardtype: TextInputType.visiblePassword,
                            controller: passowrdController,
                            validFun: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.notValidPassword;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        state is! RegisterLoadingState?
                        getButton(
                            onPressedFun: () {

                        if(globalKey.currentState!.validate()){
                          RegisterCubit.get(context).register(emailController.text.toString(),passowrdController.text.toString(),nameController.text.toString(),phoneController.text.toString());
                        }
                            }, text: AppStrings.registerText) :
                        Center(child: CircularProgressIndicator(),)
                        ,

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
