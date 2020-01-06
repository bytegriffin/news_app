import 'package:flutter/material.dart';
import 'dart:math';

const detailPageBGColor = Colors.brown;

// 详情页面属性文字颜色
const detailPageTitleTextColor =  Colors.brown;

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


getRandomColor(){
  return Color.fromARGB(255, Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255));
}


