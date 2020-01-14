import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/news.dart';
import 'dart:convert';
import 'news_detail.dart';
import '../util/image_util.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';

//新闻视频页面
class NewsVideoListPage extends StatefulWidget {
  @override
  _NewsVideoListPageState createState() => _NewsVideoListPageState();
}

class _NewsVideoListPageState extends State<NewsVideoListPage> with AutomaticKeepAliveClientMixin{
  ScrollController _scrollController = ScrollController();
  NewsList videolist;
  int size = 0;

  @override
  bool get wantKeepAlive => true;

  _getMoreData(){
    HttpClient.request(NEWS_VIDEO_URL).then((res){
      Map<String,dynamic> subjects  = json.decode(res.data) as Map;
      setState(() {
        this.videolist = NewsList.fromJson(subjects);
        this.size = videolist.result.length;
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
    super.build(context);
    return Scaffold(
      body: EasyRefresh(
        header: BallPulseHeader(),
        footer: BallPulseFooter(),
        onRefresh: _onRefresh,
        onLoad: _onRefresh,
        child: new ListView.separated(
          padding: EdgeInsets.only(top:5),
          itemCount: size,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return buildItem(index);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );

    //return buildGridView();
  }


  Widget buildItem(int index){
   return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => new NewsDetailPage(news:videolist.result[index])
        )
        );
      },
      child: Card(
        margin: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: getCachedImage(videolist.result[index].image,width: 500,height: 200),
                  ),
                  Text(videolist.result[index].title,
                    style: TextStyle(fontSize:20,color: Colors.white,shadows:[
                      BoxShadow(color: Colors.black54,offset: Offset(0.1,0.1), blurRadius: 5.0)
                    ])),
                ],
              )
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 10.0,
                        backgroundImage: NetworkImage(getAvatarPath(videolist.result[index].source))
                    ),
                    Text(' ',style: TextStyle(fontSize:18),),
                    Text(videolist.result[index].authorName,
                      style: TextStyle(fontSize:18),),
                  ],
                ),
                Text('',style: TextStyle(fontSize:18),),
                Text("${videolist.result[index].playCount}次播放",
                  style: TextStyle(fontSize:18),),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),

//                  Icon(Icons.people),
//                  Text(newslist.result[index].authorName,
//                    overflow: TextOverflow.ellipsis,
//                    style: TextStyle(fontSize:18),)
          ],
        ),
      ),
    );
  }

}

