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
import 'package:flutter_progress_button/flutter_progress_button.dart';

//剧集视频详情页面
class CustomFreeTVDetailPage extends StatefulWidget {
  final FreeTV freeTV;
  CustomFreeTVDetailPage(this.freeTV);

  @override
  _CustomFreeTVDetailPageState createState() => _CustomFreeTVDetailPageState();
}

class _CustomFreeTVDetailPageState extends State<CustomFreeTVDetailPage>{
  IjkMediaController _controller = IjkMediaController();
  String props = "";
  String summary = "";

  @override
  void initState(){
    super.initState();
    String url = "https://movie.douban.com/subject/"+widget.freeTV.id;
    HttpClient.get(url, (result){
      if(mounted){
        setState(() {
          dom.Document doc = parse(result.toString());
          props = doc.querySelector("#info").text.trim();
          if(props.contains("IMDb链接")){
            props = props.split("IMDb链接")[0];
          }
          summary = doc.querySelector("#link-report > span").text.replaceAll("\n       ", "").replaceAll("(展开全部)", "");
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //_controller.setNetworkDataSource(widget.freeTV.playUrls[0], autoPlay: false);
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
            flexibleSpace: _buildIjkPlayer(),
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
                  child: Text(widget.freeTV.name,
                    style: TextStyle(fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold,),
                  )
              )
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 11/4
            ),
            delegate:  SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return  _buildButton((index+1).toString(),widget.freeTV.playUrls[index]);
              },
              childCount: widget.freeTV.playUrls.length,
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(widget.freeTV.image?? defaultMusicImage,fit: BoxFit.cover,height: ScreenUtil().setHeight(400),),
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

  Widget _buildButton(String name, String url){
    var pb = ProgressButton(
      defaultWidget: Text(name, style: TextStyle(color: Colors.blue)),
      progressWidget: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
      height: 10,
      color: Colors.blueAccent,
      borderRadius: 5,
      animate: false,
      width: double.infinity,
      type: ProgressButtonType.Outline,
      onPressed: () async {
        await _controller.setNetworkDataSource(url, autoPlay: true);
        await Future.delayed(Duration(milliseconds: 3000), () => 42);
      },
    );
    return pb;
  }

  Widget _buildIjkPlayer() {
    return Card(
        margin: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 5),
        child: IjkPlayer(mediaController: _controller,)
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

