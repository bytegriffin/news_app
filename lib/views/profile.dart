import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('assets/profile.jpg',fit: BoxFit.cover,),
              Column(
                children: <Widget>[
                  CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/avatar.jpg')
                  ),
                  Text('点击更换头像'),
                ],
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('阅读历史'),
          ),
          Divider(
            height: 10,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('我的收藏'),
          ),
          Divider(
            height: 10,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('联系我'),
          ),
          Divider(
            height: 10,
            color: Colors.grey,
          )
        ],
      )
    );
  }
}
