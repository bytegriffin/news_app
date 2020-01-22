import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/free_movie.dart';
import '../net/http_config.dart';
import '../util/image_util.dart';
import '../util/color_util.dart';
import '../components/expandable_text.dart';
import '../components/single_photo_view.dart';

class FreeMovieDetailPage extends StatefulWidget {
  final FreeMovie movie;
  FreeMovieDetailPage(this.movie);
  @override
  _FreeMovieDetailPageState createState() => _FreeMovieDetailPageState();
}

class _FreeMovieDetailPageState extends State<FreeMovieDetailPage> {

  String summary = "";

  @override
  void initState(){
    super.initState();
    summary = widget.movie.desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.name),
      ),
      body:CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: WebView(
                userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3970.5 Safari/537.36",
                initialUrl: FREE_MOVIE_PARSE_URL + widget.movie.playUrl,
                //JS执行模式 是否允许JS执行
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: getSummary(),
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ' 导演  · · · · · · ',
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
                    ),
                  ],
                )
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 3.0,
              childAspectRatio: 8 / 13,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                var column = Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: getCachedImage(widget.movie?.directors[index].image??defaultCastImage, width: 110, height: 100)
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SinglePhotoView(
                              imageProvider:NetworkImage(widget.movie?.directors[index].image??defaultCastImage),
                              heroTag: 'simple',
                            )
                        ));
                      },
                    ),
                    Text(widget?.movie?.directors[index].name??"",overflow: TextOverflow.ellipsis,maxLines: 2),
                  ],
                );
                return Container(
                    margin: EdgeInsets.all(2),
                    child: column
                );
              },
              childCount: widget?.movie?.directors?.length??0,
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
                    Text(
                      ' 主演  · · · · · · ',
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
                    ),
                  ],
                )
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 3.0,
              childAspectRatio: 8 / 13,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                var column = Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: getCachedImage(widget.movie?.actors[index].image??defaultCastImage, width: 110, height: 100)
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SinglePhotoView(
                              imageProvider:NetworkImage(widget.movie?.actors[index].image??defaultCastImage),
                              heroTag: 'simple',
                            )
                        ));
                      },
                    ),

                    Text(widget?.movie?.actors[index].name??"",overflow: TextOverflow.ellipsis,maxLines: 2)
                  ],
                );
                return Container(
                    margin: EdgeInsets.all(2),
                    child: column
                );
              },
              childCount: widget?.movie?.actors?.length??0,
            ),
          ),
        ],

      )
    );
  }


  // 获取影片概要
  Widget getSummary() {
    if(summary == ""){
      return Container(height:0.0,width:0.0);
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ' 注意：本资源只作为参考和学习，如果遇到不能正常播放的情况，可以重新进入此页试一下。',
          style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.redAccent),
        ),
        Container(height: 10,),
        Text(" 影片简介  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: summary,
          maxLines: 5,
          style: TextStyle(fontSize: 16,),
        ),
        Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(4.0),
        child: column
    );
  }

}
