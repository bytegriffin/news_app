import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/news.dart';
import 'news_list.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';

// 体育新闻列表
class SportNewsListPage extends StatefulWidget {
  @override
  _SportNewsListPageState createState() => _SportNewsListPageState();
}

class _SportNewsListPageState extends State<SportNewsListPage> with AutomaticKeepAliveClientMixin{
  NewsList newslist;
  int size = 0;

  @override
  bool get wantKeepAlive => true;

  _getMoreData(){
    HttpClient.request(SPORT_NEWS_API).then((res){
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
          header: BallPulseHeader(),
          footer: BallPulseFooter(),
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


