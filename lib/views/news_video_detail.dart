import 'package:flutter/material.dart';
import '../models/news.dart';
import '../net/httpclient.dart';
import 'package:html/parser.dart' show parse;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import '../util/image_util.dart';

// 新闻视频详情页
class NewsVideoDetailPage extends StatefulWidget {

  final News news;
  NewsVideoDetailPage({@required this.news});

  @override
  _NewsVideoDetailPageState createState() => _NewsVideoDetailPageState();
}

class _NewsVideoDetailPageState extends State<NewsVideoDetailPage> {
  IjkMediaController _controller = IjkMediaController();

  @override
  void initState(){
    super.initState();
    HttpClient.request(widget.news.url).then((res){
      String videoSrc = parse(res.toString()).querySelector("#video_play > mip-video > source").attributes['src'];
      _controller.setNetworkDataSource(videoSrc, autoPlay: true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading:GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
            ],
            backgroundColor: Colors.transparent,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildIjkPlayer(),
            ),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.news.title,
                  style: TextStyle(fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold,),
                ),
              )
          ),
          SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildInfo()
              )
          ),
        ],
      ),
    );
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(widget.news.title),
//          leading:GestureDetector(
//            child: Icon(Icons.arrow_back),
//            onTap: (){
//              Navigator.of(context).pop();
//            },
//          ),
//        ),
//        body:WebView(
//          userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3970.5 Safari/537.36",
//          initialUrl: widget.news.url,
//          //JS执行模式 是否允许JS执行
//          javascriptMode: JavascriptMode.unrestricted,
//        )
//    );
  }


  Widget _buildIjkPlayer() {
    return Card(
        margin: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 5),
        child: Container(
          height: 230,
          child: IjkPlayer(
            mediaController: _controller,
          ),
        )
    );
  }

  Widget _buildInfo(){
    var avatar = Row(
      children: <Widget>[
        CircleAvatar(
            radius: 10.0,
            backgroundImage: NetworkImage(getAvatarPath(widget.news.source))
        ),
        Text(widget.news.authorName,
          style: TextStyle(fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.normal,),
          maxLines: 2,overflow: TextOverflow.ellipsis,
        )
      ],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        avatar,
        Text("发布时间：${widget.news.time}",
          style: TextStyle(fontSize: ScreenUtil().setSp(32), fontWeight: FontWeight.w500,),
          maxLines: 2,overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }


}

