import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_app/layout/shop_layout/shop_layout.dart';
import 'package:shop_app/moduls/login/login_screen.dart';
import 'package:shop_app/moduls/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/resoruces/strings.dart';
import 'package:shop_app/resoruces/themes.dart';

import 'data/prefrence/app_pref.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await CashHelper.init();
   HttpOverrides.global= CustomHttpOverrides();
   runApp(const MyApp());
}

class CustomHttpOverrides extends HttpOverrides {

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: getDirect(),
    );
  }
 Widget getDirect(){
  if (CashHelper.getData(key: AppStrings.onBoardingKey) == null || CashHelper.getData(key: AppStrings.onBoardingKey) == false){
    return const onBoardingScreen();
  }else{
    if (CashHelper.getData(key: AppStrings.tokenKey)==null) {
      return LoginScreen();
    } else {
      return const ShopLayout();
    }
  }
  }
}