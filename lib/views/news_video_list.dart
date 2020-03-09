import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/news.dart';
import 'dart:convert';
import 'news_video_detail.dart';
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
  NewsList videolist;
  int size = 0;
  int _pageNum = 0;
  var datas = [];

  @override
  bool get wantKeepAlive => true;

  _getMoreData(bool _ifAdd){
    HttpClient.request(NEWS_VIDEO_URL).then((res){
      Map<String,dynamic> subjects  = json.decode(res.data) as Map;
      setState(() {
        this.videolist = NewsList.fromJson(subjects);
        if (_ifAdd) {
          datas.addAll(videolist.result);
        } else {
          datas.clear();
          datas = videolist.result;
        }
        size = datas.length;
      });
    });
  }

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    setState(() {
      this._pageNum = 1;
      _getMoreData(false);
    });
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    setState(() {
      this._pageNum += 1;
      _getMoreData(true);
    });
  }

  @override
  void initState(){
    super.initState();
    _addMoreData();
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
        onRefresh: _refreshData,
        onLoad: _addMoreData,
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
  }

  Widget buildItem(int index){
   return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => NewsVideoDetailPage(news:datas[index])
        ));
      },
      child: SizedBox(
        height: ScreenUtil().setHeight(450),
        width: ScreenUtil.screenWidth,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                fit: StackFit.loose,
                 overflow: Overflow.visible,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(datas[index]?.image0??"",fit: BoxFit.fill,height: ScreenUtil().setHeight(400),width: ScreenUtil.screenWidth,),
                  ),
                  Container(
                    padding: EdgeInsets.all( 10),
                    child: Text(datas[index]?.title??"",
                        style: TextStyle(fontSize:20,fontWeight: FontWeight.w900 ,color: Colors.white,shadows:[
                          BoxShadow(color: Colors.black54,offset: Offset(0.1,0.1), blurRadius: 5.0)
                        ])),
                  ),
                ],
              ),
              Container(
                height: ScreenUtil().setHeight(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 10.0,
                          backgroundImage: NetworkImage(getAvatarPath(datas[index].source)),
                          backgroundColor: Color(0xffffffff),
                        ),
                        Text(' ',style: TextStyle(fontSize:18),),
                        Text(datas[index].authorName,
                          style: TextStyle(fontSize:18),),
                      ],
                    ),
                    Text('',style: TextStyle(fontSize:18),),
                    Text("${datas[index].playCount}次播放",
                      style: TextStyle(fontSize:18),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


