import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/news.dart';

class NewsDetailPage extends StatefulWidget {

  final News news;
  NewsDetailPage({@required this.news});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.news.title),
        ),
        body:WebView(
          initialUrl: widget.news.url,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}

