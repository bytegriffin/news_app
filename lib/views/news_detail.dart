import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/news.dart';

// 新闻详情页
class NewsDetailPage extends StatefulWidget {

  final News news;
  NewsDetailPage({@required this.news});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  // 隐藏显示一些信息
  String javaScript = "document.getElementById('detail-page').childNodes[2].style.display='none'; "
      "document.getElementById('detail-page').childNodes[3].style.display='none';  "
      "document.getElementById('detail-page').childNodes[4].style.display='none'; "
      "document.getElementById('article-notice').style.display='none'; "
      "document.querySelector('#detail-page > div:nth-child(2) > article > footer').style.display='none'; ";

  @override
  void initState(){
    super.initState();
  }
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.news.title),
          leading:GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body:WebView(
          userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3970.5 Safari/537.36",
          initialUrl: widget.news.url,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
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

