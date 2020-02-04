import 'package:flutter/material.dart';
import '../models/search_movie.dart';
import '../net/httpclient.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

// 预告片视频详情页
class TrailerVideoDetailPage extends StatefulWidget {
  final Trailer trailer;
  TrailerVideoDetailPage(this.trailer);

  @override
  _TrailerVideoDetailPageState createState() => _TrailerVideoDetailPageState();
}

class _TrailerVideoDetailPageState extends State<TrailerVideoDetailPage> {
  IjkMediaController _controller = IjkMediaController();

  @override
  void initState(){
    super.initState();
    HttpClient.request(widget.trailer.url).then((res){
      dom.Element e = parse(res.toString()).querySelector("#player-html5-"+widget.trailer.id+" > source");
      if(e != null){
        String videoSrc = e.attributes['src'];
        _controller.setNetworkDataSource(videoSrc, autoPlay: true);
      }
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.trailer.name,
                      style: TextStyle(fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold,),
                    ),
                    Text(widget.trailer.duration,
                      style: TextStyle(fontSize: ScreenUtil().setSp(30), ),
                    ),
                  ],
                )
              )
          ),
        ],
      ),
    );
  }


  Widget _buildIjkPlayer() {
    return Card(
        margin: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
        child: Container(
          height: 230,
          child: IjkPlayer(
            mediaController: _controller,
          ),
        )
    );
  }



}

