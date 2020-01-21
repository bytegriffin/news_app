import 'package:flutter/material.dart';
import './views/splash.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:dynamic_theme/dynamic_theme.dart';


void main() {
  runApp(MyApp());
  // 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，
  // 如果写在渲染之前MaterialApp组件会覆盖掉它。
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
          primarySwatch: Colors.red,
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '新闻App',
            theme: theme,
            home: SplashPage(),
          );
        }
    );

//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: '新闻App',
//      theme: ThemeData(
//          primarySwatch: Colors.red,
//          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
//          splashColor: Colors.white //水波纹
//      ),
//      home: SplashPage(),
//    );
  }
}


