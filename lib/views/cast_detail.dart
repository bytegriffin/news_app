import 'package:flutter/material.dart';
import 'package:news_app/components/custom_card.dart';
import '../models/cast.dart';
import '../util/image_util.dart';
import '../net/httpclient.dart';
import 'movie_detail.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/multi_photo_view.dart';
import '../components/nav_button.dart';
import '../components/single_photo_view.dart';
import '../components/over_scroll_behavior.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import '../models/cast_movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//影人详情页
class CastDetailPage extends StatefulWidget {
  final String id;
  CastDetailPage(this.id);
  @override
  _CastDetailPageState createState() => _CastDetailPageState();
}

class _CastDetailPageState extends State<CastDetailPage>{
  Cast cast;
  List<String> photoList;

  _getCasts(){
    HttpClient.get("https://movie.douban.com/celebrity/"+widget.id, (result){
      if(mounted){
        setState(() {
          dom.Document doc = parse(result.toString());
          cast = Cast();
          cast.id = widget.id;
          String info="";
          List<dom.Element> infoList = doc.querySelector("#headline > div.info > ul").children;
          for(dom.Element e in infoList){
            String line = e.text.trim();
            if(line == ""){
              continue;
            }
            var array = line.split(":");
            if(array.length == 3){
              info += array[0].trim() + ":" + array[1].trim() + ":" + array[2].trim()+ "\n";
            } else  {
              info += array[0].trim() + ":" + array[1].trim() + "\n";
            }
          }
          cast.info = info;
          cast.avatar = doc.querySelector("#headline > div.pic > a > img").attributes["src"];
          dom.Element hiddenText = doc.querySelector("#intro > div.bd > span.all.hidden");
          if(hiddenText != null){
            cast.summary =  hiddenText.text;
          } else {
            cast.summary =  doc.querySelector("#intro > div.bd").text;
          }
          dom.Element bestMovie = doc.querySelector("#best_movies > div.bd > ul");
          if(bestMovie != null){
            List<dom.Element> relateMovieList = bestMovie.children;
            cast.relatedMovieList = List<RelatedMovie>();
            for(dom.Element e in relateMovieList){
              dom.Element a = e.querySelector("div.pic > a");
              String id = a.attributes['href'].split("/")[4];
              dom.Element img = a.querySelector("a > img");
              String title = img.attributes["title"];
              String src = img.attributes["src"];
              String rate = e.querySelector("div.info > em").text;
              cast.relatedMovieList.add(RelatedMovie(id,title, rate, src));
            }
          }
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  _getPhotos(){
    HttpClient.get("https://movie.douban.com/celebrity/"+widget.id +"/photos/", (result){
      if(mounted){
        setState(() {
          dom.Document doc = parse(result.toString());
          List<dom.Element> pList = doc.querySelector("#content > div > div.article > ul").children;
          photoList = List<String>();
          for(dom.Element e in pList){
            String src = e.querySelector("div.cover > a > img").attributes["src"];
            photoList.add(src);
          }
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }


  @override
  void initState(){
    _getCasts();
    _getPhotos();
    super.initState();
  }

  Widget _displayPhoto(){
    if (photoList != null && photoList.length > 0){
      return Text(
          ' 相关照片  · · · · · · ',
          style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
      );
    }
    return Container();
  }

  Widget _displayPhotoDivide(){
    if (photoList != null && photoList.length > 0){
      return Container(height: 10.0,);
    }
    return Container();
  }

  Widget _displayBestMovie(){
    if (cast.relatedMovieList != null && cast.relatedMovieList.length > 0){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _displayPhotoDivide(),
          Text(
            ' 最受好评的作品  · · · · · · ',
            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
          ),
        ],
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
       // title: Text(cast?.name??""),
          backgroundColor: detailPageBGColor,
          elevation:0,
          actions: <Widget>[
            buildHomeNavButton(context)
          ],
      ),
      body: ScrollConfiguration(
        behavior: OverScrollBehavior(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index){
                  if(index == 0){
                    return Column(
                      children: <Widget>[
                        getItem(),
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
                child: _displayPhoto(),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 8 / 9,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  var column = ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: getCachedImage(photoList[index]??defaultCastImage, width: 110, height: 100)
                  );
                  return GestureDetector(
                      child: getBoxCard(column),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MultiPhotoView(
                            images:photoList,
                            index: index,
                            heroTag: index.toString(),
                          )
                      ));
                    },
                  );
                },
                childCount: photoList?.length??0,
              ),
            ),
            SliverToBoxAdapter(
              child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child:  _displayBestMovie()
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
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: getCachedImage(cast?.relatedMovieList[index]?.image??defaultCastImage, width: 110, height: 100)
                      ),
                      Text(cast?.relatedMovieList[index]?.title??"",overflow: TextOverflow.ellipsis,maxLines: 2)
                    ],
                  );
                  var onclick = GestureDetector(
                    child: column,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MovieDetailPage(cast?.relatedMovieList[index].id)
                      ));
                    },
                  );
                  return Container(
                    margin: EdgeInsets.all(2),
                      child: onclick
                  );
                },
                childCount: cast?.relatedMovieList?.length??0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 获取影人简介
  Widget getItem() {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(420),
          child: Text(cast?.info??"",
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: detailPagePropTextColor
          )),
        ),
        Container(
          width: 30,
        ),
        GestureDetector(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(cast?.avatar??defaultCastImage, width: 110, height: 160)
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => SinglePhotoView(
                  imageProvider:NetworkImage(cast?.avatar??defaultCastImage),
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
      height: ScreenUtil().setHeight(460),
      margin: EdgeInsets.all(0.0),
      child: row,
    );
  }

  // 获取影人概要
  Widget getSummary() {
    if(cast ==null || cast.summary == null || cast.summary == ""){
      return Container(height:0.0,width:0.0);
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" 影人简介  · · · · · ·",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
          ExpandableText(
            text: cast.summary,
            maxLines: 5,
            style: TextStyle(fontSize: 16,),
          ),
        Container(height: 10.0),
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(4.0),
        child: column
    );
  }

}