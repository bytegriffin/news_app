import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/news.dart';

class NewsDetailPage extends StatelessWidget {

  final News news;

  NewsDetailPage({@required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(news.title),
        ),
        body:WebView(
          initialUrl: news.url,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}
