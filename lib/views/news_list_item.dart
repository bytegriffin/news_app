import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/news.dart';
import 'news_detail.dart';
import '../util/image_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 新闻列表每项设置
class NewsListItemPage extends StatelessWidget {
  final News news;
  NewsListItemPage(this.news);

  Widget _displayImage(){
    String netImage = news.image0;
    if(netImage != null){
      return ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.network(netImage,fit: BoxFit.cover,),
      );
    }
    return null;
  }

  Widget _buildListTile(BuildContext context){
    return ListTile(
      leading: _displayImage(),
      title: Text(news.title),
      subtitle: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(getAvatarPath(news.source)),
                radius: 10.0,
                backgroundColor: Color(0xffffffff),
              ),
              Text(news.authorName,maxLines: 1,overflow: TextOverflow.fade,),
            ],
          ),
          Text(news.time,maxLines: 1,overflow: TextOverflow.fade),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      //trailing: Icon(Icons.chevron_right),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => new NewsDetailPage(news:news)
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if(news.tplName == "moreImg"){
      var column = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(news.title, style: new TextStyle(fontSize: 16),),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(220),
                  height: ScreenUtil().setHeight(180),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(news?.image0??defaultBookImage,fit: BoxFit.cover,),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(220),
                  height: ScreenUtil().setHeight(180),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(news?.image1??defaultBookImage,fit: BoxFit.cover,),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(220),
                  height: ScreenUtil().setHeight(180),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(news?.image2??defaultBookImage,fit: BoxFit.cover,),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(getAvatarPath(news.source)),
                    radius: 10.0,
                  ),
                  Text(news.authorName,maxLines: 1,overflow: TextOverflow.fade,),
                ],
              ),
              Text(news.time,maxLines: 1,overflow: TextOverflow.fade),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      );
      return GestureDetector(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: column
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => new NewsDetailPage(news:news)
          ));
        },
      );
    } else if(news.tplName == "gallery"){
      var column = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(news.title, style: new TextStyle(fontSize: 16),),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: ScreenUtil().setWidth(900),
            height: ScreenUtil().setHeight(420),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(news?.image0??defaultBookImage,fit: BoxFit.cover,),
            ),
          ),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(getAvatarPath(news.source)),
                    radius: 10.0,
                  ),
                  Text(news.authorName,maxLines: 1,overflow: TextOverflow.fade,),
                ],
              ),
              Text(news.time,maxLines: 1,overflow: TextOverflow.fade),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      );
      return GestureDetector(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: column
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => new NewsDetailPage(news:news)
          ));
        },
      );
    }
    return _buildListTile(context);
  }
}
