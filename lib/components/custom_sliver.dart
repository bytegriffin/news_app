import 'package:flutter/material.dart';

// 构建一个SliverList
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
