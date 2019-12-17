import 'package:flutter/material.dart';

//构建一个贝塞尔曲线（先做四个点 然后将这四个点进行连接）
class ProfileClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   var path = Path();
   path.lineTo(0, 0);
   path.lineTo(0, size.height-50);
   var firstControlPoint = Offset(size.width/2, size.height/2);
   var firstEndPoint = Offset(size.width, size.height/2 - 50);
   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
       firstEndPoint.dx, firstEndPoint.dy);
   path.lineTo(size.width, size.height/2-50);
   path.lineTo(size.width, 0);
   return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}