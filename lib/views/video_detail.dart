import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import '../models/haokan_video.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//视频详情页面
class VideoDetailPage extends StatefulWidget {

  final HaoKanVideo haoKanVideo;
  VideoDetailPage(this.haoKanVideo);

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  IjkMediaController _controller = IjkMediaController();
  TabController tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();
    _controller.setNetworkDataSource(widget.haoKanVideo.videoSrc, autoPlay: true);
    tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                child: Text(widget.haoKanVideo.title,
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

  Widget _buildInfo(){
    var avatar = Row(
      children: <Widget>[
        CircleAvatar(
            radius: 10.0,
            backgroundImage: NetworkImage(widget.haoKanVideo.avator)
        ),
        Text(widget.haoKanVideo.author,
          style: TextStyle(fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.normal,),
          maxLines: 2,overflow: TextOverflow.ellipsis,
        )
      ],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        avatar,
        Text("发布时间：${widget.haoKanVideo.publishTime}",
          style: TextStyle(fontSize: ScreenUtil().setSp(32), fontWeight: FontWeight.w500,),
          maxLines: 2,overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

}

