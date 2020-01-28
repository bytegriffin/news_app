import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/news.dart';
import 'news_list_item.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

// 历史新闻列表
class HistoryNewsListPage extends StatefulWidget {
  @override
  _HistoryNewsListPageState createState() => _HistoryNewsListPageState();
}

class _HistoryNewsListPageState extends State<HistoryNewsListPage>  with AutomaticKeepAliveClientMixin{
  NewsList newslist;
  int size = 0;

  @override
  bool get wantKeepAlive => true;

  _getMoreData(){
    HttpClient.request(HISTORY_NEWS_API).then((res){
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          onLoad: _onRefresh
      ),
    );

  }

}


