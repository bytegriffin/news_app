import 'package:flutter/material.dart';
import '../models/search_movie.dart';
import '../util/image_util.dart';
import '../components/star_rating.dart';
import '../components/text_tag.dart';
import '../net/httpclient.dart';
import '../net/http_router.dart';
import 'cast_detail.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';

class MovieDetailPage extends StatefulWidget {
  final String id;
  MovieDetailPage(this.id);
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>{
  SearchMovie movie;
  String summary = "";

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
    return Scaffold(
        appBar: AppBar(
          //title: Text(movie?.title??""),
          backgroundColor: detailPageBGColor,
          elevation:0,
          actions: <Widget>[
            buildHomeNavButton(context)
          ],
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
              childAspectRatio: 2.5 / 5,
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
                    Text(movie?.directors[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 2),
                  ],
                );
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(2),
                    child: column,
                  ),
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
              childAspectRatio: 2.5  / 5,
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
                    Text(movie?.casts[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 2)
                  ],
                );
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(2),
                    child: column,
                  ),
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
              childAspectRatio: 2.5 / 5,
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
                    Text(movie?.writers[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 2)
                  ],
                );
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(2),
                    child: column,
                  ),
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
      return Container(
        width: 230,
        child: Text(
          "片长：${movie?.durations??""}",
          style: TextStyle(
            fontSize: 16,
              color: detailPagePropTextColor
          ),
         overflow: TextOverflow.ellipsis,maxLines: 2
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

  Widget _displayYear() {
    if (movie !=null && movie.year.isNotEmpty) {
      //如果数据不为空，则显示Text
      return Text(
        " (${movie?.year??""})",
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 200,
              child: Text(
                movie?.title??"",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: detailPagePropTextColor
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ),
//            Container(
//              width: 200,
//              child: Text(
//                "原名：${movie?.originalTitle??""}",
//                style: TextStyle(
//                  fontSize: 16,
//                    color: detailPagePropTextColor
//                ),
//                overflow: TextOverflow.ellipsis,
//                maxLines: 1,
//              ),
//            ),
            Container(
              child: getRatingWidget(movie?.rating??"0.0",detailPageBGColor,ratingTextColor),
              width: 230,
            ),
            _displayType(),
            _displayDuration(),
            Container(
              width: 240,
              child: Text(
                "制片国家：${movie?.country??""}",
                style: TextStyle(
                  fontSize: 16,
                    color: detailPagePropTextColor
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Container(
              width: 200,
              child: Text(
                "语言：${movie?.language??""}",
                style: TextStyle(
                  fontSize: 16,
                    color: detailPagePropTextColor
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                getCachedImage(movie?.image??defaultCastImage, width: 110, height: 160),
                _displayYear()
              ],
            )
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
