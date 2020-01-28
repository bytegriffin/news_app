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
          title: Text(widget.title,overflow: TextOverflow.ellipsis,
              maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,)),
        ),
        body:WebView(
          //userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0",
          initialUrl: EBOOK_URL + widget.eBookId,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}

