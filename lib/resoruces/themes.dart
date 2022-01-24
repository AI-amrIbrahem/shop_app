import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

ThemeData darkTheme = ThemeData(

  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    hoverColor: Colors.deepOrange,
    focusColor: Colors.deepOrange,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange
  ),
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
      ),
      iconTheme: IconThemeData(
          color: AppColors.white
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: false,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.darkBackgroundColor,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 20,
      selectedItemColor: AppColors.primary,
      backgroundColor: AppColors.darkBackgroundColor,
      unselectedItemColor: Colors.grey
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.white
      )
  ),

);

ThemeData get lightTheme => ThemeData(
  primaryColor: AppColors.primary,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backgroundColor: AppColors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        iconTheme: IconThemeData(
            color: AppColors.black
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.white,

        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      selectedItemColor: AppColors.primary,
      backgroundColor: AppColors.white,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.black
        )
    )

);