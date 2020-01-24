import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dynamic_theme/dynamic_theme.dart';

const detailPageBGColor = Colors.teal;

// 详情页面属性文字颜色
const detailPageTitleTextColor =  Colors.teal;

// 详情页面属性文字颜色
const detailPagePropTextColor = Colors.white;

// 收起文字颜色
const expanedTextColor = Colors.blueAccent;

// 评分文字颜色
const ratingTextColor = Colors.white;

// 评分分数颜色
const ratingCountColor = Colors.deepOrange;

// tag文字颜色
const tagTextColor = Colors.teal;

// 歌手名字颜色
const artistTextColor = Colors.deepPurple;

getRandomColor(){
  return Color.fromARGB(255, Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255));
}

// 切换为暗黑模式
void switchDarkTheme(BuildContext context) {
  DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
}

initDartThemeSwitchValue(BuildContext context){
  return Theme.of(context).brightness == Brightness.dark? true: false;
}

// 获取Top排名列表背景颜色
getTopListBGColor(BuildContext context){
  return Theme.of(context).brightness == Brightness.dark? Color(0xFF2E2E2E): Colors.white;
}

// 获取star文字颜色
getTextColor(BuildContext context){
  return Theme.of(context).brightness == Brightness.dark? Colors.white: Colors.black;
}

// 获取star背景颜色
getStarBGColor(BuildContext context){
  return Theme.of(context).brightness == Brightness.dark? Color(0xFF424242): Colors.white;
}

// 获取tab颜色
getTabColor(BuildContext context){
  return Theme.of(context).brightness == Brightness.dark? Colors.tealAccent: Colors.red;
}

// 获取未选中的tab颜色
getUnselectedLabelColor(){
  return Color(0xff666666);
}

void changeColor(BuildContext context) {
  DynamicTheme.of(context).setThemeData(new ThemeData(
      primaryColor: Theme.of(context).primaryColor == Colors.indigo? Colors.red: Colors.indigo
  ));
}

