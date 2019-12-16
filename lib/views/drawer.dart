import 'package:flutter/material.dart';

// 左侧抽屉栏
class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer( // 左侧抽屉
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('张三', style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text('zhangsan@abc.com'),
            currentAccountPicture: CircleAvatar( // 个人头像
              radius: 36,
              backgroundImage: AssetImage('assets/avatar.jpg')
            ),
//                decoration: BoxDecoration( //背景图
//                    color:Colors.red[400],
//                    image: DecorationImage(
//                        image: NetworkImage('https://img.zcool.cn/community/03881fe588de672a8012060c8ffb823.gif'),
//                        fit: BoxFit.cover,
//                        colorFilter: ColorFilter.mode( //背景图加颜色滤镜
//                            Colors.yellow[400].withOpacity(0.6),
//                            BlendMode.hardLight
//                        )
//                    )
//                ),
          ),
          ListTile(
            title: Text('message', textAlign: TextAlign.right,),
            trailing: Icon(Icons.message, color:Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('message', textAlign: TextAlign.right,),
            trailing: Icon(Icons.favorite, color:Colors.black12, size: 22.0,),
          ),
          ListTile(
            title: Text('settings', textAlign: TextAlign.right,),
            trailing: Icon(Icons.settings, color:Colors.black12, size: 22.0,),
          ),
        ],
      ),
    );
  }
}
