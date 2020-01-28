import 'package:flutter/material.dart';
import '../models/news.dart';
import 'news_detail.dart';
import '../util/image_util.dart';

// 新闻列表每项设置
class NewsListItemPage extends StatelessWidget {
  final News news;
  NewsListItemPage(this.news);

  Widget displayImage(){
    String netImage = news.image;
    Image image;
    if(netImage != null){
      image = Image.network(netImage);
      return ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: image,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: displayImage(),
      title: Text(news.title),
      subtitle: Row(
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
      //trailing: Icon(Icons.chevron_right),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => new NewsDetailPage(news:news)
        ));
      },
    );
  }
}
