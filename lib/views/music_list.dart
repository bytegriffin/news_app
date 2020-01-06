import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/music.dart';
import '../util/image_util.dart';

class MusicListPage extends StatefulWidget {
  @override
  _MusicListPageState createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage> with AutomaticKeepAliveClientMixin{
  MusicList musicList;
  int size = 0;

  @override
  bool get wantKeepAlive => true;

  _getMoreData(){
    HttpClient.get(NEW_MUSIC_URL, (result){
      if(mounted){
        setState(() {
          this.musicList = MusicList.fromJson(result);
          this.size = musicList.result.length;
        });
      }
    },errorCallBack: (error){
        print(error);
    });
  }

  @override
  void initState(){
    super.initState();
    _getMoreData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: new ListView.separated(
        itemCount: size,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return Container(
            child: getItem(musicList.result[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget getItem(Music music) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: getCachedImage(music.picUrl),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                height: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      music.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                        "歌手：${music.artists}"
                    ),
                    Text(
                      "类型：${music.type}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                        "发行公司：${music.company}"
                    ),
                    Text(
                        "发行时间：${music.publishTime}"
                    ),
//                    Text(
//                        '演员：${movie.casts}'
//                    ),
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


