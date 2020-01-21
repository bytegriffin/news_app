import 'package:flutter/material.dart';
import '../models/search_movie.dart';
import '../components/star_rating.dart';
import '../util/image_util.dart';
import 'movie_detail.dart';
import '../net/httpclient.dart';
import '../util/color_util.dart';

class TopMovieListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final String url;
  TopMovieListPage(this.title, this.backgroundImage,this.url);

  @override
  _TopMovieListPageState createState() => _TopMovieListPageState();
}

class _TopMovieListPageState extends State<TopMovieListPage>{

  int size = 0;
  List<SearchMovie> movieList;
  List<SearchMovie> usboxList; //北美票房榜和好评榜json格式比较特殊，因此需要单独出来

  _getBooks(){
    //Top250 / 口碑榜 。。。
    HttpClient.get(widget?.url, (result){
      if(mounted){
        setState(() {
          if(widget.title.contains("北美") || widget.title.contains("好评榜")){
            this.movieList = UsBoxMovieList.fromJson(result).subjects;
          } else {
            this.movieList = SearchMovieList.fromJson(result).subjects;
          }
          this.size = movieList?.length??0;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    super.initState();
    _getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getTopListBGColor(context),
      //height: 400,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
            ],
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget?.title),
              background: Image.asset(widget.backgroundImage, fit:BoxFit.cover,),
            ),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                return GestureDetector(
                  child: getItem(movieList[index]),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MovieDetailPage(movieList[index].id)
                    ));
                  },
                );
              },
              childCount: size
            ),
            itemExtent: 160.0,
          )
        ],
      ),
    );
  }

  // 如果类别是即将上映，那么将隐藏豆瓣评分
  Widget _displayRate(SearchMovie movie){
    var content;
    if(widget.title=="即将上映"){
      content = Text(
        "原名：${movie?.originalTitle??""} ",
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else {
      content = getRatingWidget(movie.rating,getStarBGColor(context),getTextColor(context));
    }
    return content;
  }

  Widget getItem(SearchMovie movie) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: getCachedImage(movie?.image),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                height: 150.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie?.title??"",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                    ),
                    _displayRate(movie),
                    Text(
                      "类型：${movie?.type??""} ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      "上映日期：${movie?.pubDates??""}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      '时长：${movie?.durations??""}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
    return Card(
      child: row,
    );
  }

}
