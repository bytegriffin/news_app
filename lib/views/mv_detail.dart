import 'package:flutter/material.dart';
import '../models/mv.dart';
import '../util/image_util.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//MV详情页
class MVDetailPage extends StatefulWidget {
  final String id;
  MVDetailPage(this.id);
  @override
  _MVDetailPageState createState() => _MVDetailPageState();
}

class _MVDetailPageState extends State<MVDetailPage>{
  MV mv = MV("","",defaultMusicImage,"");
  IjkMediaController _controller = IjkMediaController();

  List<MV> similarMVs= List.generate(0, (index) {
    return MV("$index","",defaultMusicImage,"");
  });

  @override
  void initState(){
    if(_controller.isPlaying){
      _controller.dispose();
    }
    super.initState();
    HttpClient.get(MV_DETAIL_URL+widget.id, (result){
      if(mounted){
        setState(() {
          this.mv = MVDetail.fromJson(result).data;
          _controller.setNetworkDataSource(mv.mv240, autoPlay: true);
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    HttpClient.get(RELATED_MV_URL+widget.id, (result){
      if(mounted){
        setState(() {
          this.similarMVs = ArtistMV.fromJson(result).mvs;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  Widget buildIjkPlayer() {
    return Container(
      height: 280,
      child: IjkPlayer(
        mediaController: _controller,
      ),
    );
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
              buildHomeNavButton(context)
            ],
            backgroundColor: detailPageBGColor,
            expandedHeight: 200.0,
            flexibleSpace: buildIjkPlayer(),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.all(5),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    mv.name,
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  buildInfo(),
                  buildButton(),
                  Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
                  Text(
                    " 相关视频  · · · · · ·",
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                ],
              )
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(similarMVs.map((mv) {
              return getSimilarMV(mv);
            }).toList()),
            itemExtent: 70.0,
          ),
          SliverToBoxAdapter(
            child: getSummary()
          ),
        ],
      ),
    );
  }

  // 获取观看基础信息
  Widget buildInfo(){
    var row =  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "${mv?.playCount??0} 次观看",
          style: new TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
        ),
        Text(
          "${mv?.publishTime??0} 发布",
          style: new TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
        ),
      ],
    );
    return Padding(
      padding: EdgeInsets.all(10),
      child: row,
    );
  }

  // 获取按钮
  Widget buildButton(){
    var row =  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(IconData(0xe61c, fontFamily: 'iconfont'),size: 30,),
            Text("${mv?.likeCount??0}")
          ],
        ),
        Column(
          children: <Widget>[
            Icon(IconData(0xe61e, fontFamily: 'iconfont'),size: 30,),
            Text("${mv?.subCount??0}")
          ],
        ),
        Column(
          children: <Widget>[
            Icon(IconData(0xe64d, fontFamily: 'iconfont'),size: 30,),
            Text("${mv?.commentCount??0}")
          ],
        ),
        Column(
          children: <Widget>[
            Icon(IconData(0xe6a3, fontFamily: 'iconfont'),size: 30,),
            Text("${mv?.shareCount??0}")
          ],
        )
      ],
    );
    return Padding(
      padding: EdgeInsets.all(10),
      child: row,
    );
  }

  // 获取相关视频
  Widget getSimilarMV(MV mv){
    var row = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 10,bottom: 10),
              child: Stack(
                alignment:Alignment.center ,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: getCachedImage(mv?.cover??defaultMusicImage,width: 140,height: 80),
                  ),
                  Icon(Icons.play_circle_outline,color: Colors.white,),
                ],
              )
          ),
          Container(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(400),
                child: Text(mv?.name??"",overflow: TextOverflow.ellipsis, maxLines: 2,
                  style: TextStyle(fontSize:16),),
              ),
              Text( "${mv.artistName} - ${mv?.duration} ", overflow: TextOverflow.ellipsis, maxLines: 1,
                  style: TextStyle(fontSize: 16.0,color:Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none))
            ],
          ),
        ]
    );
    return GestureDetector(
      child: row,
      onTap: (){
        if(_controller.isPlaying){
          _controller.pause();
        }
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MVDetailPage(mv?.id)
        ));
      },
    );
  }

  // 获取MV概要
  Widget getSummary() {
    if(mv.desc == null || mv.desc == ""){
      return Container(height:0.0,width:0.0);
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
        Text(" 简介  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: mv?.desc??"",
          maxLines: 5,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 20,left: 4,right: 4,top: 4),
        child: column
    );
  }

}