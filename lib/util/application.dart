import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static GlobalKey<NavigatorState> key = GlobalKey();
  static SharedPreferences sp;
  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;
  static double bottomBarHeight;

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }


}