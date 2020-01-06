import 'package:flutter/material.dart';
import '../util/color_util.dart';

// 获得详情页评分
Widget getRatingWidget(String score, Color bgColor, Color textColor){
  if(score == ""){
    score = "0.0";
  }
  return Row(
    children: <Widget>[
      Text('豆瓣评分：',
      style: TextStyle(
        fontSize: 16,
        color: textColor
      ),),
      Text('$score   ',style: TextStyle(color: ratingCountColor),),
      StarRating(
        rating: double.parse(score),
        size:24,
        selectedColor:Colors.orange,
        unselectedColor: Colors.grey,
        backgroundColor: bgColor,
      ),
    ],
  );
}

Widget getMovieRatingWidget(String score){
  if(score == ""){
    score = "0.0";
  }
  return Row(
    children: <Widget>[
      Text('$score ',style: TextStyle(color: Colors.orange),),
      StarRating(
        rating: double.parse(score),
        size:14,
        selectedColor:Colors.orange,
        unselectedColor: Colors.grey,
      ),
    ],
  );
}

class StarRating extends StatefulWidget {
  final double rating; // 当前评分
  final double maxRating; // 最高评分
  final Widget unselectedImage; // 未选中的图片
  final Widget selectedImage; // 选中的图片
  final int count; // 个数
  final double size; // 大小
  final Color unselectedColor; // 默认icon时，未选中图标的颜色
  final Color selectedColor; // 默认icon时，选中图标的颜色
  final Color backgroundColor; //背景颜色

  StarRating({@required this.rating, this.maxRating=10, Widget unselectedImage,
    Widget selectedImage,this.count=5, this.size=30, this.unselectedColor = const Color(0xff0000ff),
    this.selectedColor= const Color(0xffff0000),this.backgroundColor=Colors.white}): unselectedImage = unselectedImage ??
      Icon(Icons.star, size: size,color: unselectedColor),selectedImage = selectedImage ??
      Icon(Icons.star, size: size,color: selectedColor);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Stack(
        children: <Widget>[
          getUnselectedStar(),
          getSelectedStar()
        ],
      ),
    );
  }

  Widget getUnselectedStar(){
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.count, (int index){
          return widget.unselectedImage;
        })
    );
  }
  // 获取选中的star
  Widget getSelectedStar(){
    // 计算完整的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    // 剩余的一个star显示的比例
    double leftValue = (widget.rating - entireCount * oneValue);
    double ratioLeft = leftValue / oneValue;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entireCount + 1, (int index){
        if(index < entireCount){
          return widget.selectedImage;
        }
        return ClipRect(
            clipper: MyRectClipper(width:widget.size * ratioLeft),
            child: widget.selectedImage
        );
      }),
    );
  }
}

class MyRectClipper extends CustomClipper<Rect>{
  double width;

  MyRectClipper({this.width});

  @override
  Rect getClip(Size size){
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper){
    return width != oldClipper.width;
  }
}