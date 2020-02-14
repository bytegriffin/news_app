import 'package:flutter/material.dart';
import '../models/search_movie.dart';
import '../components/star_rating.dart';
import '../util/image_util.dart';
import 'movie_detail.dart';
import '../net/httpclient.dart';
import '../util/color_util.dart';
import '../components/over_scroll_behavior.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

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
  List<SearchMovie> movieList = List<SearchMovie>();
  List<SearchMovie> usboxList; //北美票房榜和好评榜json格式比较特殊，因此需要单独出来

  searchMovieDetail(SearchMovie movie){
    HttpClient.get("https://movie.douban.com/subject/"+movie.id, (result){
      if(mounted){
        setState(() {
          dom.Document doc = parse(result.toString());
          movie.title = doc.querySelector("#content > h1 > span:nth-child(1)").text;
          movie.year = doc.querySelector("#content > h1 > span.year").text;
          movie.image = doc.querySelector("#mainpic > a > img").attributes['src'];
          movie.rating = doc.querySelector("#interest_sectl > div.rating_wrap.clearbox > div.rating_self.clearfix > strong").text;
          movie.summary = doc.querySelector("#link-report > span").text.trim();
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  _getMovies(){
    //Top250 / 口碑榜 。。。
    HttpClient.get(widget?.url, (result){
      setState(() {
//        if(widget.title.contains("口碑榜")){
//          dom.Document doc = parse(result.toString());
//          List<dom.Element> ulList= doc.querySelector("#listCont2").children;
//          for(dom.Element e in ulList){
//            dom.Element ele = e.querySelector("div.name > a");
//            String title = ele.text.trim();
//            String src = ele.attributes["href"];
//            String id = src.split("/")[4];
//            SearchMovie searchMovie = SearchMovie(id, title, defaultCastImage);
//            searchMovieDetail(searchMovie);
//            movieList.add(searchMovie);
//          }
//        }else if(widget.title.contains("北美")){
//          dom.Document doc = parse(result.toString());
//          List<dom.Element> ulList= doc.querySelector("#listCont1").children;
//          for(dom.Element e in ulList){
//            dom.Element ele = e.querySelector("div.box_chart > a");
//            String title = ele.text.trim();
//            String src = ele.attributes["href"];
//            String id = src.split("/")[4];
//            SearchMovie searchMovie = SearchMovie(id, title, defaultCastImage);
//            searchMovieDetail(searchMovie);
//            movieList.add(searchMovie);
//          }
        if(widget.title.contains("口碑榜") || widget.title.contains("北美")){
          this.movieList = UsBoxMovieList.fromJson(result).subjects;
        } else if(widget.title.contains("即将上映")){
          dom.Document doc = parse(result.toString());
          List<dom.Element> ulList= doc.querySelector("#upcoming > div.mod-bd > ul").children;
          for(dom.Element e in ulList){
            String id = e.attributes["id"];
            String title = e.attributes["data-title"];
            String src = e.querySelector("ul > li.poster > a > img").attributes["src"];
            SearchMovie searchMovie = SearchMovie(id, title, src);
            searchMovie.pubDate = e.querySelector("ul > li.release-date").text.trim();
            searchMovie.durations = e.attributes["data-duration"];
            searchMovie.country = e.attributes["data-region"];
            searchMovie.directorNames = e.attributes["data-director"];
            searchMovie.castNames = e.attributes["data-actors"];
            movieList.add(searchMovie);
          }
          // this.movieList = SearchMovieList.fromJson(result).subjects;
        } else if(widget.title.contains("正在热映")){
          dom.Document doc = parse(result.toString());
          List<dom.Element> ulList= doc.querySelector("#nowplaying > div.mod-bd > ul").children;
          for(dom.Element e in ulList){
            String id = e.attributes["id"];
            String title = e.attributes["data-title"];
            String src = e.querySelector("ul > li.poster > a > img").attributes["src"];
            SearchMovie searchMovie = SearchMovie(id, title, src);
            searchMovie.durations = e.attributes["data-duration"];
            searchMovie.country = e.attributes["data-region"];
            searchMovie.directorNames = e.attributes["data-director"];
            searchMovie.castNames = e.attributes["data-actors"];
            searchMovie.year = e.attributes["data-release"];
            searchMovie.rating = e.attributes["data-score"];
            movieList.add(searchMovie);
          }
        } else if(widget.title.contains("新片榜")){
          dom.Document doc = parse(result.toString());
          List<dom.Element> ulList= doc.querySelector("#content > div > div.article > div > div").children;
          for(dom.Element e in ulList){
            if(e.localName != "table"){
              continue;
            }
            dom.Element td1 = e.querySelector("tr").children[0];
            dom.Element td2 = e.querySelector("tr").children[1];
            dom.Element a1 = td1.querySelector("a");
            String id = a1.attributes['href'].split("/")[4];
            String title = a1.attributes["title"];
            String src = a1.querySelector("img").attributes["src"];
            SearchMovie searchMovie = SearchMovie(id, title, src);
            searchMovie.info = td2.querySelector("div > p").text;
            searchMovie.rating = td2.querySelector("div > div > span.rating_nums").text;
            movieList.add(searchMovie);
          }
        } else if(widget.title.contains("经典影片")){
          dom.Document doc = parse(result.toString());
          List<dom.Element> ulList= doc.querySelector("#content > div > div.article > ol").children;
          for(dom.Element e in ulList){
            dom.Element div1 = e.querySelector("li > div > div.pic");
            dom.Element div2 = e.querySelector("li > div > div.info").children[1];
            dom.Element a1 = div1.querySelector("a");
            String id = a1.attributes['href'].split("/")[4];
            String title = a1.querySelector("img").attributes["alt"];
            String src = a1.querySelector("img").attributes["src"];
            SearchMovie searchMovie = SearchMovie(id, title, src);
            searchMovie.info =div2.querySelector("p").text.trim().replaceAll("                            ", "");
            searchMovie.rating = div2.querySelector("div.star > span.rating_num").text;
            movieList.add(searchMovie);
          }
        }
        this.size = movieList.length??0;
      });

    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    super.initState();
    _getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getTopListBGColor(context),
      //height: 400,
      child: ScrollConfiguration(
        behavior: OverScrollBehavior(),
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
                    child: getItem(movieList[index], index + 1),
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
      ),
    );
  }

  // 如果类别是即将上映，那么将隐藏豆瓣评分
  Widget _displayRate(SearchMovie movie){
    var content;
    if(widget.title=="即将上映"){
      content = Container();
    } else {
      content = getRatingWidget(movie.rating,getStarBGColor(context),getTextColor(context));
    }
    return content;
  }
  
  Widget _displayCurrentRank(int index){
    if(widget.title.contains("榜") || widget.title.contains("经典影片")){
      return Container(
        width: 40,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Icon(Icons.bookmark,color: rankIconColor,size: 40,),
            Text(
              index.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: rankTextColor
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget _displayPubDate(SearchMovie movie){
    Widget pubDate;
    if(movie?.pubDate != null){
      pubDate = Text(
        "上映日期：${movie?.pubDate??""}",
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
    } else {
      pubDate = Container();
    }
    return pubDate;
  }

  Widget _displayDirector(SearchMovie movie){
    Widget directorNames;
    if(movie?.directorNames != null){
      directorNames = Text(
        "导演：${movie?.directorNames??""} ",
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else {
      directorNames = Container();
    }
    return directorNames;
  }

  Widget _displayActors(SearchMovie movie){
    Widget castNames;
    if(movie?.castNames != null){
      castNames = Text(
        "演员：${movie?.castNames??""} ",
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else {
      castNames = Container();
    }
    return castNames;
  }

  Widget _displayType(SearchMovie movie){
    Widget type;
    if(movie?.type != null){
      type = Text(
        "类型：${movie?.type??""} ",
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else {
      type = Container();
    }
    return type;
  }

  Widget _displayDuration(SearchMovie movie){
    Widget duration;
    if(movie?.durations != null){
      duration = Text(
        '片长：${movie?.durations??""}',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else {
      duration = Container();
    }
    return duration;
  }

  Widget _displayInfo(SearchMovie movie){
    Widget duration;
    if(movie?.info != null){
      duration = Text(
        '${movie?.info??""}',
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      );
    } else {
      duration = Container();
    }
    return duration;
  }

  Widget _displaySummary(SearchMovie movie){
    if(movie.summary != null && movie.summary != "null"){
     return Text(
        '${movie?.summary??""}',
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      );
    }
    return Container();
  }

  Widget getItem(SearchMovie movie, int index) {
    var row = Container(
      padding: EdgeInsets.all(2.0),
      child: Row(
        children: <Widget>[
          _displayCurrentRank(index),
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
                    _displayInfo(movie),
                    _displayType(movie),
                    _displayDirector(movie),
                    _displayActors(movie),
                    _displayPubDate(movie),
                    _displayDuration(movie),
                    _displaySummary(movie)
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
