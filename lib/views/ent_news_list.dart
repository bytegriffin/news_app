import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/news.dart';
import 'news_list_item.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

// 娱乐新闻列表
class EntNewsListPage extends StatefulWidget {
  @override
  _EntNewsListPageState createState() => _EntNewsListPageState();
}

class _EntNewsListPageState extends State<EntNewsListPage> {
  NewsList newslist;
  int size = 0;
  int page = 0;//默认值是显示第一页

  _getMoreData(){
    HttpClient.request(ENT_NEWS_API+"&page=${this.page}").then((res){
      Map<String,dynamic> subjects  = json.decode(res.data) as Map;
      if(mounted){
        setState(() {
          this.newslist = NewsList.fromJson(subjects);
          this.size = newslist.result.length;
        });
      }
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1)).then((e){
      setState(() {
        this.page += 1;
        _getMoreData();
      });
    });
  }

  Future<void> _onLoad() async {
    await Future.delayed(Duration(seconds: 1)).then((e){
      setState(() {
        if(this.page > 1){
          this.page -= 1;
        }
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          child: new ListView.separated(
            itemCount: size,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
              return NewsListItemPage(newslist.result[index]);
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
          onRefresh: _onRefresh,
          onLoad: _onLoad
      ),
    );

  }

}


