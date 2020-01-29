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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text(widget.news.title),
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
        )
    );
  }
}

