import 'package:flutter/material.dart';
import 'video_index.dart';
import 'home.dart';
import 'other.dart';
import 'profile.dart';
import 'drawer.dart';
// import 'search_bar.dart';

class BottomNavigator extends StatefulWidget {
  final int index;
  BottomNavigator(this.index);
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  var _currentIndex = 0;

  @override
  void initState(){
    super.initState();
    if(widget.index > 0){
      _currentIndex = widget.index;
    }
  }

  Widget buildAppbar2() {
    return new PreferredSize(
      child: new Container(
        padding: new EdgeInsets.only(
            top: MediaQuery.of(context).padding.top
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Colors.red,
              Colors.teal,
              Colors.blue
            ]
          ),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey[500],
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]
        ),
      ),
      preferredSize: new Size(
        MediaQuery.of(context).size.width,
        0.0
      ),
    );
  }

  Widget _buildAppbar(){
    var appBar = AppBar(
      //backgroundColor: Colors.red,
      leading: Builder(builder: (context){
        return IconButton(
          icon: Icon(Icons.dehaze,color: Colors.white,),
          onPressed: (){//打开Drawer抽屉菜单
            Scaffold.of(context).openDrawer();
          },
        );
      }),
//      actions: <Widget>[
//        IconButton(
//            icon: Icon(Icons.search,color: Colors.black,),
//            onPressed:(){showSearch(context: context, delegate: SearchBarDelegate());}
//        ),
//        IconButton(
//          icon: Icon(Icons.home),
//          tooltip: "Home",
//          onPressed: () {
//            print("Home");
//          },
//        ),
//        PopupMenuButton(//弹出下拉框
//          itemBuilder: (BuildContext context) =>
//          <PopupMenuItem<String>>[
//            PopupMenuItem<String>(child: Text("热度",style: TextStyle(color: Colors.red),), value: "hot",),
//            PopupMenuItem<String>(child: Text("最新"), value: "new",),
//          ],
//          onSelected: (String action) {
//            switch (action) {
//              case "hot":
//                print("hot");
//                break;
//              case "new":
//                print("new");
//                break;
//            }
//          },
//          onCanceled: () {
//            print("onCanceled");
//          },
//        )
//      ],
      elevation: 0.0,
    );
    return appBar;
//    return PreferredSize(
//      child: appBar,
//      preferredSize: Size.fromHeight(30)
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: IndexedStack( // 页面切换
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          VideoIndexPage(),
          OtherPage(),
          ProfilePage(),
        ],
      ),
      //抽屉也可以使用AppBar中的leading属性来实现
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
              title:Text('新闻'),
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