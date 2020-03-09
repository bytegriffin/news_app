import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:news_app/util/image_util.dart';
import '../models/free_movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../net/httpclient.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import '../components/expandable_text.dart';
import '../util/color_util.dart';

//电影视频详情页面
class CustomFreeMovieDetailPage extends StatefulWidget {
  final FreeMovie freeMovie;
  CustomFreeMovieDetailPage(this.freeMovie);

  @override
  _CustomFreeMovieDetailPageState createState() => _CustomFreeMovieDetailPageState();
}

class _CustomFreeMovieDetailPageState extends State<CustomFreeMovieDetailPage>{
  IjkMediaController _controller = IjkMediaController();
  String props = "";
  String summary = "";

  @override
  void initState(){
    super.initState();
    String url = "https://movie.douban.com/subject/"+widget.freeMovie.id;
    if(widget.freeMovie.pageType == PageType.Music){
      url = "https://music.douban.com/subject/"+widget.freeMovie.id;
    }
    HttpClient.get(url, (result){
      if(mounted){
        setState(() {
          dom.Document doc = parse(result.toString());
          props = doc.querySelector("#info").text.trim();
          if(widget.freeMovie.pageType == PageType.Music){
            props = props.replaceAll("\n    ", " ").replaceAll("                         ", "").replaceAll("表演者:               ", "      表演者:").replaceAll("流派:", "\n       流派:").replaceAll("    条形码", "条形码");
          }
          if(props.contains("IMDb链接")){
            props = props.split("IMDb链接")[0];
          }
          summary = doc.querySelector("#link-report > span").text.replaceAll("\n       ", "");
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    String playUrl = widget.freeMovie.playUrl;
    if(!playUrl.contains("://")){
      HttpClient.get("https://ios.xiaoxiaoapps.com/vod/reqplay/"+playUrl+"?playindex=1", (result){
        setState(() {
          playUrl = result['data']['httpurl'];
          print(playUrl);
          print("------");
          _controller.setNetworkDataSource(playUrl,autoPlay: true);
        });
      },errorCallBack: (error){
        print(error);
      });
    }else {
      _controller.setNetworkDataSource(playUrl,autoPlay: true);
    }

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
            child:  Text(
              ' 注意：本资源只作为学习和参考，请勿相信视频中出现的任何广告。',
              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.redAccent),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(widget.freeMovie.name,
                  style: TextStyle(fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold,),
                )
              )
          ),
          SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(widget.freeMovie.image?? defaultMusicImage,fit: BoxFit.cover,height: ScreenUtil().setHeight(400),),
                      Expanded(child: Text("        "+props.trim(),))
                    ],
                  )
              )
          ),
          SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: getSummary()
              )
          ),
        ],
      ),
    );
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

  // 获取电影内容概要
  Widget getSummary() {
    if(this.summary.isEmpty){
      return Container(height:0.0,width:0.0);
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("摘要  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: summary.trim(),
          maxLines: 5,
          style: TextStyle(fontSize: 16,),
        ),
        // Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(4.0),
        child: column
    );
  }

}

