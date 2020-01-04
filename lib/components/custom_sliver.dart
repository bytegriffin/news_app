import 'package:flutter/material.dart';

// 构建一个SliverList,防止产生overflow超出屏幕异常
Widget buildSliverList(Widget wrap){
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
