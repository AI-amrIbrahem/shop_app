import 'package:flutter/material.dart';
import 'package:shop_app/resoruces/app_colors.dart';
import 'package:shop_app/resoruces/strings.dart';
import 'package:shop_app/widgets/button_widget.dart';
import 'package:shop_app/widgets/input_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passowrdController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.loginText.toUpperCase(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: AppColors.primary
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.loginSub,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                getTextFormField(prefIcon: Icons.email,labelText: AppStrings.emailAddress, myKeyboardtype: TextInputType.emailAddress, controller: emailController, validFun: (value){
                  if (value!.isEmpty){
                    return AppStrings.notValidEmail;
                  }
                  return null;
                }),
                SizedBox(
                  height: 20,
                ),
                getTextFormField(sufxIcon: Icons.visibility_outlined,prefIcon: Icons.lock,isPassword: true ,labelText: AppStrings.password, myKeyboardtype: TextInputType.visiblePassword, controller: passowrdController, validFun: (value){
                  if (value!.isEmpty){
                    return AppStrings.notValidPassword;
                  }
                  return null;
                }),
                SizedBox(
                  height: 20,
                ),
                getButton(onPressedFun: (){}, text: AppStrings.loginText),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        AppStrings.DontHaveAccount
                    ),
                    getTextButton(onPressedFun: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    }, text: AppStrings.register)
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
