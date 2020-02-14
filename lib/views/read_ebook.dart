import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../net/http_config.dart';

class ReadEBookPage extends StatefulWidget {
  final String eBookId;
  final String title;
  ReadEBookPage(this.eBookId,this.title);

  @override
  _ReadEBookPageState createState() => _ReadEBookPageState();
}

class _ReadEBookPageState extends State<ReadEBookPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          title: Text(widget.title,overflow: TextOverflow.ellipsis,
              maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,)),
        ),
        body:WebView(
          userAgent: "api-client/1 com.douban.frodo/6.22.0(166) Android/29 product/tiffany vendor/Xiaomi model/MI 9  rom/miui10  network/wifi  platform/mobile",
          initialUrl: EBOOK_URL + widget.eBookId.toString(),
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}

