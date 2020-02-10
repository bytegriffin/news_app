import 'package:flutter/material.dart';
import '../components/over_scroll_behavior.dart';

// 构建一个SliverList,防止产生overflow超出屏幕异常
Widget buildSliverList(Widget wrap){
  var csv =  CustomScrollView(
    slivers: <Widget>[
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index){
            if(index == 0){
              return wrap;
            }
            return null;
          }
        )
      )
    ],
  );
  return ScrollConfiguration(
    behavior: OverScrollBehavior(),
    child: csv,
  );
}

Widget buildMovieSliverList(Widget wrap){
  return CustomScrollView(
    slivers: <Widget>[
      SliverList(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                if(index == 0){
                  return wrap;
                }
                return null;
              }
          )
      )
    ],
  );
}
