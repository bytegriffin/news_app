import 'package:flutter/material.dart';
import '../components/profile_clipper.dart';
import '../components/custom_sliver.dart';

//我的页面
class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSliverList(_buildProfileBody())
    );
  }

  //构建profile页面内容
  Widget _buildProfileBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipPath(
              clipper: ProfileClipper(),
              child: Container(
                color: Colors.red,
                height: 200,
              ),
            ),
            Column(
              children: <Widget>[
                CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/avatar.jpg')
                ),
                Text('点击更换头像'),
              ],
            )
          ],
        ),

        Card(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('姓名：test'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('邮箱：test@test.com'),
              ),
            ],
          ),
        ),
        Card(
          color: Colors.green,
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
        Card(
          color: Colors.teal,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.near_me),
                title: Text('我的附近'),
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('联系方式'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
