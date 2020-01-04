import 'package:flutter/material.dart';
import './views/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '新闻App',
      theme: ThemeData(
          primarySwatch: Colors.red,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white //水波纹
      ),
      home: SplashPage(),
    );
  }
}


