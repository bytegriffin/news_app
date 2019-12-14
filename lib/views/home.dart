import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/news.dart';
import 'news_list.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  NewsList newslist;
  int size = 0;

  _getMoreData(){
    HttpClient.request(NEWS_API).then((res){
      Map<String,dynamic> subjects  = json.decode(res.data) as Map;
      setState(() {
        this.newslist = NewsList.fromJson(subjects);
        this.size = newslist.result.length;
      });
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1)).then((e){
      setState(() {
      //  newslist.result.clear();
        _getMoreData();
      });
    });
  }

  @override
  void initState(){
    super.initState();
    _getMoreData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new RefreshIndicator(
        onRefresh: _onRefresh,
        child: new ListView.separated(
          //_items.length + 1是为了给最后一行的加载loading留出位置
          itemCount: size,
           physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return NewsListPage(newslist.result[index]);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );

  }

}


