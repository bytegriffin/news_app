import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

// 左侧抽屉栏
class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  String barcode="";

  Future _scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        return this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this.barcode = '未授予APP相机权限!';
        });
      } else {
        setState(() {
          return this.barcode = '扫码错误: $e';
        });
      }
    } on FormatException {
      setState(() => this.barcode =
      '进入扫码页面后未扫码直接返回');
    } catch (e) {
      setState(() => this.barcode = '扫码错误: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer( // 左侧抽屉
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('测试账户', style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text('test@test.com'),
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
            title: Text('我的消息', textAlign: TextAlign.left,),
            leading: Icon(Icons.message, size: 22.0,),
            //onTap: () => switchDarkTheme(context),
          ),
          ListTile(
            title: Text('我的收藏', textAlign: TextAlign.left,),
            leading: Icon(Icons.favorite,  size: 22.0,),
          ),
          ListTile(
            title: Text('扫码', textAlign: TextAlign.left,),
            subtitle: Text("${barcode}"),
            leading: Icon(Icons.photo_camera,  size: 22.0,),
            onTap: _scan,
          ),
          ListTile(
            title: Text('设置', textAlign: TextAlign.left,),
            leading: Icon(Icons.settings, size: 22.0,),
          ),
        ],
      ),
    );
    return Container(
        color: Colors.brown,
        child: drawer
    );
  }

}


