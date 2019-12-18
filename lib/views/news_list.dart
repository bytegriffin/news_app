import 'package:flutter/material.dart';
import '../models/news.dart';
import 'news_detail.dart';
import '../util/imageutil.dart';

// 新闻列表每项设置
class NewsListItemPage extends StatelessWidget {
  News news;
  NewsListItemPage(this.news);

  @override
  Widget build(BuildContext context) {
    String netimg = news.image;
    Image image;
    if(netimg != null){
      image = Image.network(news.image);
    }
    return ListTile(
      leading: image,
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
