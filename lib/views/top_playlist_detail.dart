import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../components/cycle_list_header.dart';
import '../models/play_list.dart';
import '../components/nav_button.dart';
import '../util/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/track.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';

//歌单列表
class TopPlayListDetailPage extends StatefulWidget {
  final String id;
  final String title;
  final String backgroundImage;
  TopPlayListDetailPage(this.id, this.title, this.backgroundImage);
  @override
  _TopPlayListDetailPageState createState() => _TopPlayListDetailPageState();
}

class _TopPlayListDetailPageState extends State<TopPlayListDetailPage> {
  PlayList playList;
  VoidCallback playOnTap;
  int count = 0;

  List<Track> tracks= List.generate(4, (index) {
    return Track("$index","测试");
  });

  _getMusics(){
    HttpClient.get(PLAYLIST_DETAIL_URL + widget.id.toString(), (result){
      if(mounted){
        setState(() {
          playList = PlayList.fromJson(result['playlist']);
          tracks = playList.tracks;
          count = tracks.length;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    super.initState();
    _getMusics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: detailPageBGColor,
            actions: <Widget>[
              buildHomeNavButton(context)
            ],
            expandedHeight:  ScreenUtil().setHeight(500),
            flexibleSpace: FlexibleSpaceBar(
              background:  ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: getCachedImage(widget.backgroundImage),
              ),
            ),
            title: Text(widget.title),
            pinned: true,
            floating: false,
            snap: false,
            bottom: CycleListHeader(
              onTap: playOnTap,
              count: count??0,
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(tracks.map((song) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: getCachedImage(song.albumPic??defaultMusicImage,width: 60),
                ),
                title: Text(song.songName, overflow: TextOverflow.ellipsis, maxLines: 1,
                    style: TextStyle(fontSize: 16.0,color: Colors.black,decoration: TextDecoration.none)),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(song.artistNames, overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(fontSize: 14.0,color:Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none)),
                    ),
                    Expanded(child: Text(" - ${song.albumName}", overflow: TextOverflow.ellipsis, maxLines: 1,)),
                  ],
                ),
                trailing: Icon(Icons.more_vert),
              );
            }).toList()),
            itemExtent: 70.0,
          ),
        ],
      ),
    );
  }

}


