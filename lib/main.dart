import 'package:flutter/material.dart';
import 'package:shop_app/moduls/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/resoruces/themes.dart';

void main() {
  runApp(const MyApp());
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
      home:  onBoardingScreen(),
    );
  }
}
