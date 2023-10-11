import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:players_task/core/resources/colors_manager.dart';
import 'package:players_task/core/resources/values_manager.dart';

class Methods {

  static void showToast(String message, {Color toastColor = ColorsManager.darkRed}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: toastColor,
      fontSize: SizeManager.s18,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}