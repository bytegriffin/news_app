import 'package:flutter/material.dart';
import '../models/search_movie.dart';
import '../util/image_util.dart';
import '../components/star_rating.dart';
import '../components/text_tag.dart';
import '../net/httpclient.dart';
import 'cast_detail.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import '../components/single_photo_view.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import '../models/related_cast.dart';
import 'trailer_video_detail.dart';
import '../components/multi_photo_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailPage extends StatefulWidget {
  final String id;
  MovieDetailPage(this.id);
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>{
  SearchMovie movie;
  String summary = "";
  String props = "";
  int trailerSize = 0;
  int photoSize = 0;
  int directorSize = 0;
  int castSize=0;
  int writerSize=0;

  List<String> tags=List<String>.generate(0, (index){
    return "";
  });

  List<SearchMovie> relatedMovies=List<SearchMovie>.generate(0, (index){
    return SearchMovie("","",defaultCastImage);
  });

  _getMovies(){
//    HttpClient.get(getMovieUrl+widget.id, (result){
//      if(mounted){
//        setState(() {
//          this.movie = SearchMovie.fromJson(result);
//          this.tags = movie.tags;
//          this.summary = movie.summary;
//        });
//      }
//    },errorCallBack: (error){
//      print(error);
//    });
    movie = SearchMovie("","",defaultCastImage);
    HttpClient.get("https://movie.douban.com/subject/"+widget.id, (result){
      if(mounted){
        setState(() {
          movie.id = widget.id;
          dom.Document doc = parse(result.toString());
          movie.title = doc.querySelector("#content > h1 > span:nth-child(1)").text;
          movie.year = doc.querySelector("#content > h1 > span.year").text;
          movie.image = doc.querySelector("#mainpic > a > img").attributes['src'];
          movie.rating = doc.querySelector("#interest_sectl > div.rating_wrap.clearbox > div.rating_self.clearfix > strong").text;
          //movie.type = doc.querySelector("#info > span:nth-child(12)").text;
          //movie.pubDates = doc.querySelector("#info > span:nth-child(20)").text;
          //print(doc.querySelector("#info > span:nth-child(20)").text);
          props = doc.querySelector("#info").text;
          if(props.contains("IMDb链接")){
            props = props.split("IMDb链接")[0];
          }
          movie.summary = doc.querySelector("#link-report > span").text;
          summary = movie.summary;
          List<dom.Element> tagList= doc.querySelector("#content > div.grid-16-8.clearfix > div.aside > div.tags > div").children;
          for(dom.Element e in tagList){
            tags.add(e.text);
          }
          movie.tags =tags;
          //喜欢这部电影的人也喜欢的电影列表
          List<dom.Element> relateMovieList= doc.querySelector("#recommendations > div").children;
          for(int i=1; i<=relateMovieList.length; i++){
            dom.Element dl = relateMovieList[i-1].querySelector('dt > a');
            String id = dl.attributes['href'].split("/")[4];
            String image = dl.querySelector('img').attributes["src"];
            dom.Element dd = relateMovieList[i-1].querySelector('dd > a');
            String name = dd.text;
            relatedMovies.add(SearchMovie(id, name, image));
          }
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //剧照
    HttpClient.get("https://movie.douban.com/subject/"+widget.id+"/all_photos", (result){
      if(mounted){
        setState(() {
          dom.Document doc = parse(result.toString());
          dom.Element eee = doc.querySelector("#content > div > div.article > div:nth-child(1) > div.bd > ul");
          if(eee != null){
            List<String> photoList = List<String>();
            for(dom.Element ele in eee.children){
              String image = ele.querySelector("li> a > img").attributes['src'];
              photoList.add(image);
            }
            movie.photos = photoList.length > 36 ? photoList.sublist(0, 36): photoList;
            photoSize = movie.photos.length;
          }
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //预告片
    HttpClient.get("https://movie.douban.com/subject/"+widget.id+"/trailer", (result){
      if(mounted){
        setState(() {
          dom.Document doc = parse(result.toString());
          dom.Element eee = doc.querySelector("#content > div > div.article > div:nth-child(1) > ul");
          if(eee != null){
            List<Trailer> tl = List<Trailer>();
            for(dom.Element ele in eee.children){
              dom.Element a = ele.querySelector("a");
              String href = a.attributes['href'];
              String id = href.split("/")[4];
              String img = a.querySelector("img").attributes['src'];
              String duration = a.querySelector("strong > em").text;
              String name = ele.querySelector("p > a").text.trim();
              tl.add(Trailer(id, name, img,duration, href));
            }
            trailerSize = tl.length;
            movie.trailers = tl;
          }
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    // 演职员
    HttpClient.get("https://movie.douban.com/subject/"+widget.id+"/celebrities", (result){
      if(mounted){
        setState(() {
          movie.directors = _parseRelatedCasts(result.toString(), "#celebrities > div:nth-child(1) > ul");
          directorSize = movie.directors.length;
          movie.casts = _parseRelatedCasts(result.toString(), "#celebrities > div:nth-child(3) > ul");
          castSize = movie.casts.length;
          movie.writers = _parseRelatedCasts(result.toString(), "#celebrities > div:nth-child(5) > ul");
          writerSize = movie.writers.length;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

  }

  List<RelatedCast> _parseRelatedCasts(String result, String query){
    List<RelatedCast> rcList = List<RelatedCast>();
    dom.Element eee = parse(result).querySelector(query);
    if(eee == null || !eee.hasChildNodes()){
      return rcList;
    }
    List<dom.Element> list= eee.children;
    for(dom.Element e in list){
      dom.Element ele = e.querySelector("li > a");
      String href = ele.attributes['href'];
      String fullName = ele.attributes['title'];
      String cover = ele.querySelector("div").attributes['style'].replaceAll("background-image: url(", "").replaceAll(")", "");
      String id = href.split("/")[4];
      String name = fullName.split(" ")[0];
      String enName = fullName.replaceAll(name, "").trim();
      rcList.add(RelatedCast(id, cover, name, enName));
    }
    return rcList;
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
              child:  _displayTrailer(),
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: getTrailers(),
                  ),
                )
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: _displayPhoto(),
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: getPhotos(),
                  ),
                )
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: _displayRelatedMovies()
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: getRelatedMovies(),
                  ),
                )
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child:  _displayDirector(),
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: getDirectors(),
                  ),
                )
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _displayCast(),
                ],
              )
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: getCasts(),
                  ),
                )
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _displayWriter(),
                ],
              )
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: getWriters(),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getWriters(){
    List<Widget> list = List<Widget>();
    for(int index = 0; index < writerSize; index ++){
      var column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(movie?.writers[index]?.avatar??defaultCastImage,fit: BoxFit.cover,width: 100,height: 100,)
          ),
          Text(movie?.writers[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 2)
        ],
      );
      var click = GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: column,
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CastDetailPage(movie?.writers[index]?.id??"")
          ));
        },
      );
      list.add(click);
    }
    return list;
  }

  List<Widget> getCasts(){
    List<Widget> list = List<Widget>();
    for(int index = 0; index < castSize; index ++){
      var column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(movie?.casts[index]?.avatar??defaultCastImage,fit: BoxFit.cover,width: 100,height: 100,)
          ),
          Text(movie?.casts[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 2)
        ],
      );
      var click = GestureDetector(
        child: Container(
          width: ScreenUtil().setWidth(180),
          height: ScreenUtil().setHeight(280),
          margin: EdgeInsets.all(5),
          child: column,
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CastDetailPage(movie?.casts[index]?.id??"")
          ));
        },
      );
      list.add(click);
    }
    return list;
  }

  List<Widget> getDirectors(){
    List<Widget> list = List<Widget>();
    for(int index=0; index < directorSize; index ++){
      var column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(movie?.directors[index]?.avatar??defaultCastImage,fit: BoxFit.cover,width: 100,height: 100,)
          ),
          Text(movie?.directors[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 2),
        ],
      );
      var click = GestureDetector(
        child: Container(
          width: ScreenUtil().setWidth(180),
          height: ScreenUtil().setHeight(280),
          margin: EdgeInsets.all(5),
          child: column,
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CastDetailPage(movie?.directors[index]?.id??"")
          ));
        },
      );
      list.add(click);
    }
    return list;
  }

  List<Widget> getRelatedMovies(){
    List<Widget> list = List<Widget>();
    for(int index = 0; index < relatedMovies.length; index ++){
      var column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(relatedMovies[index]?.image??defaultCastImage,fit: BoxFit.cover, height: ScreenUtil().setHeight(260),width: ScreenUtil().setWidth(220),)
          ),
          Text(relatedMovies[index]?.title??"",overflow: TextOverflow.ellipsis,maxLines: 2),
        ],
      );
      var click = GestureDetector(
        child: Container(
          width: ScreenUtil().setWidth(220),
          height: ScreenUtil().setHeight(340),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: column,
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => MovieDetailPage(relatedMovies[index]?.id??"")
          ));
        },
      );
      list.add(click);
    }
    return list;
  }

  // 获取照片
  List<Widget> getPhotos(){
    List<Widget> list = List<Widget>();
    for(int index = 0; index < photoSize; index ++){
     var column = Container(
       padding: EdgeInsets.symmetric(horizontal: 5),
       child: ClipRRect(
           borderRadius: BorderRadius.circular(5.0),
           child: Image.network(movie?.photos[index]??defaultCastImage,fit: BoxFit.cover, width: 100, height: 100)
       ),
     );
     var click = GestureDetector(
       child: Container(
         width: ScreenUtil().setWidth(220),
         height: ScreenUtil().setHeight(260),
         margin: EdgeInsets.all(2),
         child: column,
       ),
       onTap: (){
         Navigator.push(context, MaterialPageRoute(
             builder: (context) => MultiPhotoView(
               images: movie?.photos,
               index: index,
               heroTag: index.toString(),
             )
         ));
       },
     );
     list.add(click);
    }
    return list;
  }

  // 横向预告片列表
  List<Widget> getTrailers(){
    List<Widget> list = List<Widget>();
    for(int index=0; index< trailerSize; index++){
      var column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.network(movie?.trailers[index]?.image??defaultCastImage,fit: BoxFit.cover),
                Icon(Icons.play_circle_outline, color: Colors.white,),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Text(movie?.trailers[index]?.duration, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: detailPagePropTextColor
                  )),
                )
              ],
            )
          ),
          Text(movie?.trailers[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 2),
        ],
      );
      var click = GestureDetector(
        child: Container(
          width: ScreenUtil().setWidth(240),
          height: ScreenUtil().setHeight(260),
          margin: EdgeInsets.all(2),
          child: column,
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => TrailerVideoDetailPage(movie?.trailers[index])
          ));
        },
      );
      list.add(click);
    }
    return list;
  }

  Widget _displayRelatedMovies(){
    if(relatedMovies != null && relatedMovies.length > 0){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
          Text(
            " 喜欢这部电影的人也喜欢  · · · · · ·",
            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
          ),
        ],
      );
    }
    return Container(height:0.0,width:0.0);
  }

  Widget _displayPhoto(){
    if (movie?.photos?.length != null && movie.photos.length > 0){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
          Text(
          ' 相关照片  · · · · · · ',
            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
          )
        ],
      );
    }
    return Container(height:0.0,width:0.0);
  }

  // 是否显示演员
  Widget _displayCast() {
    if (movie !=null && movie.casts != null && movie.casts.length > 0) {
      var text = Text(
        " 演员  · · · · · ·",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
      );
      if (movie.directors != null) {
        var column = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text
          ],
        );
        return column;
      }
      return text;
    }
    return  Container(height:0.0,width:0.0);
  }

  // 是否显示预告片
  Widget _displayTrailer() {
    if (movie !=null && movie.trailers != null && movie.trailers.length > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
          Text(
            " 预告片  · · · · · ·",
            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
          )
        ],
      );
    }
    return  Container(height:0.0,width:0.0);
  }

  // 是否显示导演
  Widget _displayDirector() {
    if (movie !=null && movie.directors != null && movie.directors.length > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
          Text(
            " 导演  · · · · · ·",
            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
          )
        ],
      );
    }
    return  Container(height:0.0,width:0.0);
  }

  // 是否显示编剧
  Widget _displayWriter() {
    if (movie !=null && movie.writers != null && movie.writers.length > 0) {
      return Text(
        " 编剧  · · · · · ·",
        style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
      );
    }
    return  Container(height:0.0,width:0.0);
  }

  //是否显示影片时长
  Widget _displayDuration() {
    if (movie !=null && movie.durations != null) {
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
    if (movie !=null && movie.type != null) {
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
                "${movie?.title??""}  ${movie?.year??""}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: detailPagePropTextColor
                ),
                // overflow: TextOverflow.ellipsis,
                // maxLines: 2,
              )
            ),
            Container(
              child: getRatingWidget(movie?.rating??"0.0",detailPageBGColor,ratingTextColor),
              width: 230,
            ),
            GestureDetector(
              child: Text("影片详情 >>",style: TextStyle(
                  fontSize: 15.0,
                  color: detailPagePropTextColor
              )),
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("影片详情",),
                            GestureDetector(
                              child: Icon(Icons.clear),
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                        //titlePadding: EdgeInsets.only(bottom: 30.0,),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(props),
                            ],
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                      );
                    }
                );
              },
            ),
            _displayType(),
            _displayDuration(),
//            Container(
//              width: 240,
//              child: Text(
//                "制片国家：${movie?.country??""}",
//                style: TextStyle(
//                  fontSize: 16,
//                    color: detailPagePropTextColor
//                ),
//                overflow: TextOverflow.ellipsis,
//                maxLines: 1,
//              ),
//            ),
          ],
        ),
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(movie?.image??defaultCastImage, width: 110, height: 160),),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => SinglePhotoView(
                imageProvider:NetworkImage(movie?.image??defaultBookImage),
                heroTag: 'simple',
              )
            ));
          },
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
