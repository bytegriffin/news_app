import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import '../models/play_list.dart';
import '../util/color_util.dart';
import 'song_playlist_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 歌单列表页
class SongPlayListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  SongPlayListPage(this.title, this.backgroundImage);
  @override
  _SongPlayListPageState createState() => _SongPlayListPageState();
}

class _SongPlayListPageState extends State<SongPlayListPage>{
  List<PlayList> allTopList;
  int allTopCount = 0;

  @override
  void initState(){
    allTopList = List<PlayList>();
    super.initState();
    _getMusics();
  }

  _getMusics(){
    HttpClient.get(PLAYLIST_URL, (result){
      if(mounted){
        setState(() {
          allTopList = PlayLists.fromJson(result).playlists;
          allTopCount = allTopList.length;
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
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(height: 10.0,indent: 0.0,color: detailPageBGColor);
            },
            itemCount: allTopCount,
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
              child: getCachedImage(allTopList[index]?.picUrl??defaultMusicImage,width: 140,height: 80),
            ),
          ),
          Container(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(380),
                child: Text("${allTopList[index].name??''}",
                    style: TextStyle(fontSize:16, fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis, maxLines: 2),
              ),
              Container(
                width: ScreenUtil().setWidth(380),
                child: Text("${allTopList[index].playCount}次播放",
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
            builder: (context) => SongPlayListDetailPage(allTopList[index].id ,allTopList[index].name,allTopList[index].picUrl)
        ));
      },
    );
  }

}


