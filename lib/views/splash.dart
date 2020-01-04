import 'package:flutter/material.dart';
import 'bottom.dart';

//闪屏页
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync:this,
      duration: Duration(milliseconds: 1000)
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((state){
      if(state == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=>BottomNavigator()),
            (route) => route == null);
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child:
      Image.asset('assets/splash.jpg', scale: 2.0,fit: BoxFit.cover),
    );
  }
}

