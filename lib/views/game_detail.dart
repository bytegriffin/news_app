import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GameDetailPage extends StatefulWidget {
  final String url;
  GameDetailPage(this.url);
  @override
  _GameDetailPageState createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {

  WebViewController _controller;

  String js = "document.querySelector('#app > div > div > div').style.display='none';window.ads = false;";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("78"),
        leading:GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: WebView(
        //userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3970.5 Safari/537.36",
        initialUrl: widget.url,
        //JS执行模式 是否允许JS执行
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.contains('vv.3304399.net') || request.url.contains('pingtcss.qq.com')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          _controller
              ?.evaluateJavascript(js)
              ?.then((result) {
          });
        },
        onPageFinished: (String url) {
          _controller
              ?.evaluateJavascript(js)
              ?.then((result) {
          });
        }
      ),
    );
  }
}
