import 'package:flutter/material.dart';
import 'package:news_app/components/custom_card.dart';
import '../models/search_movie.dart';
import '../util/image_util.dart';
import '../components/star_rating.dart';
import '../components/text_tag.dart';
import '../net/httpclient.dart';
import '../net/http_router.dart';
import 'cast_detail.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';

class MovieDetailPage extends StatefulWidget {
  final String id;
  MovieDetailPage(this.id);
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> with AutomaticKeepAliveClientMixin{
  SearchMovie movie;
  String summary = "";

  @override
  bool get wantKeepAlive => true;

  List<String> tags=List<String>.generate(1, (index){
    return "标签";
  });

  _getMovies(){
    HttpClient.get(getMovieUrl+widget.id, (result){
      if(mounted){
        setState(() {
          this.movie = SearchMovie.fromJson(result);
          this.tags = movie.tags;
          this.summary = movie.summary;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    _getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          //title: Text(movie?.title??""),
            backgroundColor: detailPageBGColor,
            elevation:0
        ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){
                if(index == 0){
                  return Column(
                    children: <Widget>[
                      getItem(),
                      getTags(),
                      Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
                      getSummary(),
                    ],
                  );
                }
                return null;
              }
            )
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child:  _displayDirector(" 导演  · · · · · ·"),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 90.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 3 / 5,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                var column = Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: getCachedImage(movie?.directors[index]?.avatar??defaultCastImage, width: 110, height: 100)
                    ),
                    Text(movie?.directors[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 1),
                  ],
                );
                return GestureDetector(
                  child: getBoxCard(column),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CastDetailPage(movie?.directors[index]?.id??"")
                    ));
                  },
                );
              },
              childCount: movie?.directors?.length??0,
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _displayCast(" 主演  · · · · · ·"),
                ],
              )
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 90.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 3 / 5,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                var column = Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: getCachedImage(movie?.casts[index]?.avatar??defaultCastImage, width: 110, height: 100)
                    ),
                    Text(movie?.casts[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 1)
                  ],
                );
                return GestureDetector(
                  child: getBoxCard(column),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CastDetailPage(movie?.casts[index]?.id??"")
                    ));
                  },
                );
              },
              childCount: movie?.casts?.length??0,
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
                  _displayWriter(" 编剧  · · · · · ·"),
                ],
              )
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 90.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 3 / 5,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                var column = Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: getCachedImage(movie?.writers[index]?.avatar??defaultCastImage, width: 110, height: 100)
                    ),
                    Text(movie?.writers[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 1)
                  ],
                );
                return GestureDetector(
                  child: getBoxCard(column),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CastDetailPage(movie?.writers[index]?.id??"")
                    ));
                  },
                );
              },
              childCount: movie?.writers?.length??0,
            ),
          ),
        ],
      ),
    );
  }

  // 是否显示演员
  Widget _displayCast(String name) {
    if (movie !=null && movie.casts.isNotEmpty) {
      var text = Text(
        name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
      );
      if (movie.directors.isNotEmpty) {
        var column = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
            text
          ],
        );
        return column;
      }
      return text;
    }
    return  Container(height:0.0,width:0.0);
  }

  // 是否显示导演
  Widget _displayDirector(String name) {
    if (movie !=null && movie.directors.isNotEmpty) {
      return Text(
        name,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
      );
    }
    return  Container(height:0.0,width:0.0);
  }

  // 是否显示编剧
  Widget _displayWriter(String name) {
    if (movie !=null && movie.writers.isNotEmpty) {
      return Text(
        name,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
      );
    }
    return  Container(height:0.0,width:0.0);
  }

  //是否显示影片时长
  Widget _displayDuration() {
    if (movie !=null && movie.durations.isNotEmpty) {
      return Text(
        "片长：${movie?.durations??""}",
        style: TextStyle(
          fontSize: 16,
            color: detailPagePropTextColor
        ),
      );
    }
    return new Container(height:0.0,width:0.0);
  }

  //是否显示影片类型
  Widget _displayType() {
    if (movie !=null && movie.type.isNotEmpty) {
      //如果数据不为空，则显示Text
       return Text(
        "类型：${movie?.type??""} ",
        style: TextStyle(
          fontSize: 16,
            color: detailPagePropTextColor
        ),
      );
    }
    return Container(height:0.0,width:0.0);
  }

  // 获取影片简介
  Widget getItem() {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movie?.originalTitle??"",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                  color: detailPagePropTextColor
              ),
            ),
            Text(
              "电影名称：${movie?.title??""}",
              style: TextStyle(
                fontSize: 16,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            getRatingWidget(movie?.rating??"0.0",detailPageBGColor,ratingTextColor),
            _displayType(),
            _displayDuration(),
            Text(
              "制片国家/地区：${movie?.country??""}",
              style: TextStyle(
                fontSize: 16,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "语言：${movie?.language??""}",
              style: TextStyle(
                fontSize: 16,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: getCachedImage(movie?.image??defaultCastImage, width: 110, height: 160)
        ),
      ],
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      color: detailPageBGColor,
      height: 200,
      margin: EdgeInsets.all(0.0),
      child: row,
    );
  }

  // 获取影片标签
  Widget getTags() {
    if(this.tags.isEmpty){
      return Container(height:0.0,width:0.0);
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" 标签  · · · · · ·",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        TextTags(list:this.tags),
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(4.0),
        child: column
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
            text: summary,
            maxLines: 5,
            style: TextStyle(fontSize: 16, color: Colors.black),
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
