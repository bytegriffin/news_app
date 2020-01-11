import 'package:flutter/material.dart';
import '../views/bottom.dart';

Widget buildHomeNavButton(BuildContext context){
  return IconButton(
    icon: Icon(Icons.home),
    tooltip: "书影音",
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => BottomNavigator(2)
      ));
    },
  );
}

