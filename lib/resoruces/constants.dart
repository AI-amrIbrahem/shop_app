import 'package:flutter/material.dart';
import 'package:shop_app/data/prefrence/app_pref.dart';
import 'package:shop_app/moduls/login/login_screen.dart';
import 'package:shop_app/resoruces/strings.dart';

class Constants {
  static var baseUrl = "https://student.valuxapps.com/api/";

  static var loginUrl= "login";
  static var homeUrl= "home";
  static var categoryUrl= "categories";
  static var favouriteUrl= "favorites";



  static void LogOut(context){
    CashHelper.deletData(key: AppStrings.tokenKey).then((value){
      if (value){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      };
    });
  }

}
