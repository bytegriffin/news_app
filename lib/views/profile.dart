import 'package:flutter/material.dart';
import '../components/profile_clipper.dart';
import '../components/custom_sliver.dart';
import '../util/color_util.dart';
import '../util/cache_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'game_detail.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switchValue;
  String _cacheSizeStr;
  double _cardWidth = ScreenUtil().setWidth(700);

  void _setCacheSize() async {
    _cacheSizeStr = await loadCache();
  }

  void _clearAndGetCacheSize(){
    clearCache();
    _setCacheSize();
  }

  @override
  void initState(){
    setState(() {
      _setCacheSize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _switchValue = initDartThemeSwitchValue(context);
    return Scaffold(
      body: buildSliverList(_buildProfileBody())
    );
  }


  //构建profile页面内容
  Widget _buildProfileBody(){
    setState(() {
      _setCacheSize();
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipPath(
              clipper: ProfileClipper(),
              child: Container(
                color: getTabColor(context),
                height: 200,
              ),
            ),
            Column(
              children: <Widget>[
                GestureDetector(child: CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage('assets/avatar.jpg')
                ),onTap: (){

                }),
                Text("测试账户"),
                _myAction()
              ],
            )
          ],
        ),
        Card(
          color: Colors.blue,
          child: Container(
            width: _cardWidth,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.timelapse),
                  title: Text('夜晚模式'),
                  trailing: Switch(
                    activeColor: Colors.black,
                    onChanged: (bool value) {
                      setState(() {
                        this._switchValue = value;
                        switchDarkTheme(context);
                      });
                    },
                    value: this._switchValue,
                  ),
                ),
                InkWell(
                  child: ListTile(
                    leading: Icon(Icons.restore_from_trash),
                    title: Text('清除缓存'),
                    trailing: Text(_cacheSizeStr??"0K"),
                  ),
                  onTap: (){
                    setState(() {
                      _clearAndGetCacheSize();
                      _cacheSizeStr = "0K";
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.green,
          child: Container(
            width: _cardWidth,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('阅读历史'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('我的收藏'),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.teal,
          child: Container(
            width: _cardWidth,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.mail_outline),
                  title: InkWell(
                    child: Container(
                        height: 50.0,
                        alignment: Alignment.centerLeft,
                        child: Text("小游戏")
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => new GameDetailPage("http://sda.4399.com/4399swf/upload_swf/ftp31/liuxinyu/20200114/3/index.html")
                      ));
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('联系方式'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _myAction(){
    return Card(
      color: Colors.blue,
      child: Container(
        width: _cardWidth,
        height: 70,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.star,color: Colors.yellowAccent,),
                Text("关注",style:TextStyle(fontSize: 16)),
              ],
            ),
            Container(height: 40,width: 1, child: VerticalDivider(color: Colors.grey)),
            Column(
              children: <Widget>[
                Icon(Icons.pets,color: Colors.deepPurple,),
                Text("浏览",style:TextStyle(fontSize: 16)),
              ],
            ),
            Container(height: 40,width: 1, child: VerticalDivider(color: Colors.grey)),
            Column(
              children: <Widget>[
                Icon(Icons.chat,color: Colors.purpleAccent,),
                Text("消息",style:TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      )
    );
  }

}

