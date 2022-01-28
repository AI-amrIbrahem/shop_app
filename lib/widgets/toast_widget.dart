import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

myToast({required String msg , color = Colors.grey , position = ToastGravity.BOTTOM,time = 5}){
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: time==5 ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: position,
      timeInSecForIosWeb: time,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}