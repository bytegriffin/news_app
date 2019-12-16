import 'package:flutter/material.dart';
import '../models/news.dart';
import 'news_detail.dart';
import '../util/imageutil.dart';

// 新闻列表页面
class NewsListPage extends StatelessWidget {
  News news;
  NewsListPage(this.news);

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
                backgroundImage: AssetImage(getAvatarPath(news.source)),
                radius: 10.0,
              ),
              Text(news.authorName),
            ],
          ),
          Text(news.time),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => new NewsDetailPage(news:news)
        ));
      },
    );
  }
}
