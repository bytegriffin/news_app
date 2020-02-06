import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import '../models/top_song.dart';
import '../util/color_util.dart';
import 'top_song_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSongPage extends StatefulWidget {
  TopSongPage();
  @override
  _TopSongPageState createState() => _TopSongPageState();
}

class _TopSongPageState extends State<TopSongPage>{
  List<TopSong> allTopList;
  int allTopCount = 0;

  @override
  void initState(){
    allTopList = List<TopSong>();
    super.initState();
    _getMusics();
  }

  _getMusics(){
    //云音乐新歌榜
    HttpClient.get(TOP_SONG_URL+"0", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //云音乐热歌榜
    HttpClient.get(TOP_SONG_URL+"1", (result){
      if(mounted){
        setState(() {
          allTopList.add( TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //云音乐电音榜
    HttpClient.get(TOP_SONG_URL+"4", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //UK排行榜周榜
    HttpClient.get(TOP_SONG_URL+"5", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //美国Billboard周榜
    HttpClient.get(TOP_SONG_URL+"6", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //KTV嗨榜
    HttpClient.get(TOP_SONG_URL+"7", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //iTunes榜
    HttpClient.get(TOP_SONG_URL+"8", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    // Hit FM Top榜
    HttpClient.get(TOP_SONG_URL+"9", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //云音乐说唱榜
    HttpClient.get(TOP_SONG_URL+"23", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //华语金曲榜
    HttpClient.get(TOP_SONG_URL+"17", (result){
      if(mounted){
        setState(() {
          allTopList.add(TopSong.fromJson(result['playlist']));
          allTopCount = allTopCount + 1;
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
        title: Text("排行榜"),
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
              child: Stack(
                alignment:Alignment.center ,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: getCachedImage(allTopList[index]?.picUrl??defaultMusicImage,width: 140,height: 80),
                  ),
                  Icon(Icons.play_circle_outline,color: Colors.white,),
                ],
              )
          ),
          Container(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(380),
                child: Text("${allTopList[index].name??''}",
                    style: TextStyle(fontSize:16, fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis, maxLines: 1),
              ),
              Container(
                width: ScreenUtil().setWidth(380),
                child: Text("1.${allTopList[index].tracks[0]?.artistNames??''} - ${allTopList[index].tracks[0]?.songName??''}",
                  style: TextStyle(fontSize:16),overflow: TextOverflow.ellipsis, maxLines: 1),
              ),
              Container(
                width: ScreenUtil().setWidth(380),
                child: Text("2.${allTopList[index].tracks[1]?.artistNames??''} - ${allTopList[index].tracks[1]?.songName??''}",
                  style: TextStyle(fontSize:16),overflow: TextOverflow.ellipsis, maxLines: 1),
              ),
              Container(
                width: ScreenUtil().setWidth(380),
                child: Text("3.${allTopList[index].tracks[2]?.artistNames??''} - ${allTopList[index].tracks[2]?.songName??''}",
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
            builder: (context) => TopSongListPage(allTopList[index].name,allTopList[index].picUrl, allTopList[index])
        ));
      },
    );
  }

}


