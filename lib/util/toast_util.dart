import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

showToast(String content){
  Fluttertoast.showToast(
    msg: content,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 1,
//    backgroundColor: Colors.red,
//    textColor: Colors.white,
  );
}