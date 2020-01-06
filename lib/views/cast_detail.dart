import 'package:flutter/material.dart';
import 'package:news_app/components/custom_card.dart';
import '../models/cast.dart';
import '../util/image_util.dart';
import '../net/httpclient.dart';
import '../net/http_router.dart';
import 'movie_detail.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/photo_view.dart';

//影人详情页
class CastDetailPage extends StatefulWidget {
  final String id;
  CastDetailPage(this.id);
  @override
  _CastDetailPageState createState() => _CastDetailPageState();
}

class _CastDetailPageState extends State<CastDetailPage>{
  Cast cast;
  String summary = "";

  _getCasts(){
    HttpClient.get(getCastUrl+widget.id, (result){
      if(mounted){
        setState(() {
          this.cast = Cast.fromJson(result);
          this.summary = cast.summary;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    _getCasts();
    super.initState();
  }

  Widget _displayPhoto(){
    if (cast?.photos?.length != null && cast.photos.length > 0){
      return Text(
          ' 相关照片  · · · · · · ',
          style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
      );
    }
    return Container(height:0.0,width:0.0);
  }

  Widget _displayPhotoDivide(){
    if (cast?.photos?.length != null && cast.photos.length > 0){
      return Divider(height: 10.0,indent: 0.0,color: detailPageBGColor);
    }
    return Container(height:0.0,width:0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text(cast?.name??""),
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
                    child: getCachedImage(cast?.photos[index]??defaultCastImage, width: 110, height: 100)
                );
                return GestureDetector(
                    child: getBoxCard(column),
                  onTap: (){
                    //FadeRoute是自定义的切换过度动画（渐隐渐现） 如果不需要 可以使用默认的MaterialPageRoute
                    Navigator.of(context).push(new FadeRoute(page: PhotoViewGalleryScreen(
                      images:cast?.photos,//传入图片list
                      index: index,//传入当前点击的图片的index
                      heroTag: index.toString(),//传入当前点击的图片的hero tag （可选）
                    )));
                  },
                );
              },
              childCount: cast?.photos?.length??0,
            ),
          ),
          SliverToBoxAdapter(
            child: new Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _displayPhotoDivide(),
                  Text(
                    ' 最受好评的作品  · · · · · · ',
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
    );
  }

  // 获取影人简介
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
              "${cast?.name??""}",
              style: TextStyle(
                fontSize: 20,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "英文名：${cast?.enName??""}",
              style: TextStyle(
                fontSize: 16,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "性别：${cast?.gender??""}",
              style: TextStyle(
                fontSize: 16,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "星座：${cast?.constellation??""}",
              style: TextStyle(
                fontSize: 16,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "出生日期：${cast?.birthday??""}",
              style: TextStyle(
                fontSize: 16,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Container(
              width: 210,
              child: Text(
                "出生地：${cast?.bornPlace??""}",
                style: TextStyle(
                  fontSize: 16,
                    color: detailPagePropTextColor
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Text(
              "职业：${cast?.professions??""}",
              style: TextStyle(
                fontSize: 16,
                  color: detailPagePropTextColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        Container(
          width: 30,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: getCachedImage(cast?.avatar??defaultCastImage, width: 110, height: 160)
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

  // 获取影人概要
  Widget getSummary() {
    if(summary == ""){
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