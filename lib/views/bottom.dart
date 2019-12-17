import 'package:flutter/material.dart';
import 'video_list.dart';
import 'home.dart';
import 'other.dart';
import 'profile.dart';
import 'drawer.dart';


class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        actions: <Widget>[
//          IconButton(
//            icon:Icon(Icons.search),
//            tooltip: "搜索",
//          ),
//        ],
        elevation: 0.0,
      ),
      body: IndexedStack( // 页面切换
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          VideoListPage(),
          OtherPage(),
          ProfilePage(),
        ],
      ),
      drawer:DrawerPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              title:Text('首页'),
              icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              title:Text('视频'),
              icon: Icon(Icons.play_circle_outline)
          ),
          BottomNavigationBarItem(
              title:Text('书影音'),
              icon: Icon(Icons.book)
          ),
          BottomNavigationBarItem(
              title:Text('我的'),
              icon: Icon(Icons.account_box)
          ),
        ],
      ),
    );
  }
}