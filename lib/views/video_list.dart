import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/news.dart';
import 'news_list.dart';
import 'dart:convert';
import 'news_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../util/imageutil.dart';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage>{
  ScrollController _scrollController = ScrollController();
  NewsList videolist;
  int size = 0;

  _getMoreData(){
    HttpClient.request(VIDEO_API).then((res){
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
    return Scaffold(
      body: new RefreshIndicator(
        onRefresh: _onRefresh,
        child: new ListView.separated(
          itemCount: size,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new NewsDetailPage(news:videolist.result[index])
                 )
                );
              },
              child: Card(
                margin: EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Image.network(videolist.result[index].image, fit: BoxFit.cover),
                          Text(videolist.result[index].title,
                            style: TextStyle(fontSize:18,color: Colors.white)),
                        ],
                      )
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              child: getAvatar(videolist.result[index].source),
                              maxRadius: 12.0,
                              minRadius:1.0,
                            ),
                            Text(videolist.result[index].authorName,
                              style: TextStyle(fontSize:18),),
                          ],
                        ),
                        Text("${videolist.result[index].playCount}次播放",
                          style: TextStyle(fontSize:18),),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),

//                  Icon(Icons.people),
//                  Text(newslist.result[index].authorName,
//                    overflow: TextOverflow.ellipsis,
//                    style: TextStyle(fontSize:18),)
                  ],
                ),
              ),


            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );

    //return buildGridView();
  }

  Widget buildGridView(){
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemCount: size,
      itemBuilder: (BuildContext context, int index) => Container(
          color: Colors.white,
          child: new Container(
            child: Image.network(videolist.result[index].image),
          )),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
    );
  }



}


