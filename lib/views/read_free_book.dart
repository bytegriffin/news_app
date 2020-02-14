import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../net/http_router.dart';

// 免费读书
class ReadFreeBookPage extends StatefulWidget {
  final String eBookId;
  final String title;
  ReadFreeBookPage(this.eBookId,this.title);

  @override
  _ReadFreeBookPageState createState() => _ReadFreeBookPageState();
}

class _ReadFreeBookPageState extends State<ReadFreeBookPage> {

  WebViewController _controller;

  String javaScript = "document.getElementById('app').style.zoom = 0.45;"
      "document.cookie="+freeBookCookie;

  @override
  void initState(){
    super.initState();
  }

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
          userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3970.5 Safari/537.36",
          initialUrl: "https://lib-nuanxin.wqxuetang.com/read/pdf/" + widget.eBookId ,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (String url) {
              _controller
                  ?.evaluateJavascript(javaScript)
                  ?.then((result) {
              });
            },
            onPageFinished: (String url) {
              _controller
                  ?.evaluateJavascript(javaScript)
                  ?.then((result) {
              });
            }
        )
    );
  }
}

