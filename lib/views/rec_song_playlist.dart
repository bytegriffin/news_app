import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import '../models/play_list.dart';
import '../util/color_util.dart';
import 'song_playlist_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 推荐歌单列表页
class RecSongPlayListPage extends StatefulWidget {
  @override
  _RecSongPlayListPageState createState() => _RecSongPlayListPageState();
}

class _RecSongPlayListPageState extends State<RecSongPlayListPage>{
  List<PlayList> playLists;
  int count = 0;

  @override
  void initState(){
    playLists = List<PlayList>();
    super.initState();
    _getMusics();
  }

  _getMusics(){
    HttpClient.get(REC_PLAYLIST_URL+"100", (result){
      if(mounted){
        setState(() {
          playLists = PersonalPlayLists.fromJson(result).result;
          count = playLists.length;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("推荐歌单"),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(height: 10.0,indent: 0.0,color: detailPageBGColor);
            },
            itemCount: count,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
              return getSong(index);
            },
          ),
        )
    );
  }

  Widget getSong(int index){
    var column = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10,top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(playLists[index]?.picUrl??defaultMusicImage,width: 140,height: 80),
            ),
          ),
          Container(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(380),
                child: Text("${playLists[index].name??''}",
                    style: TextStyle(fontSize:16, fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis, maxLines: 3),
              ),
              Container(
                width: ScreenUtil().setWidth(380),
                child: Text("${playLists[index].playCount}次播放",
                    style: TextStyle(fontSize:16),overflow: TextOverflow.ellipsis, maxLines: 1),
              ),
            ],
          ),
        ]
    );
    return GestureDetector(
      child: column,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => SongPlayListDetailPage(playLists[index].id ,playLists[index].name,playLists[index].picUrl)
        ));
      },
    );
  }

}


