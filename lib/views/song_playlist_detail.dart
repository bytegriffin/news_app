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
import '../components/music_player.dart';
import '../models/song.dart';
import '../components/over_scroll_behavior.dart';

//歌单列表
class SongPlayListDetailPage extends StatefulWidget {
  final String id;
  final String title;
  final String backgroundImage;
  SongPlayListDetailPage(this.id, this.title, this.backgroundImage);
  @override
  _SongPlayListDetailPageState createState() => _SongPlayListDetailPageState();
}

class _SongPlayListDetailPageState extends State<SongPlayListDetailPage> {
  PlayList playList;
  VoidCallback playOnTap;
  int count = 0;

  List<Track> tracks= List.generate(0, (index) {
    return Track("$index","");
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
    List<Song> songs = tracks.map((track) => trackToSong(track)).toList();
    return Scaffold(
      body: ScrollConfiguration(
        behavior: OverScrollBehavior(),
        child: CustomScrollView(
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
                  child: Image.network(widget.backgroundImage,fit: BoxFit.cover,),
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
              delegate: SliverChildListDelegate(tracks.asMap().keys.map((index) {
                var tile =  ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(tracks[index].albumPic??defaultMusicImage,width: 60),
                  ),
                  title: Text(tracks[index].songName, overflow: TextOverflow.ellipsis, maxLines: 1,
                      style: TextStyle(fontSize: 16.0,decoration: TextDecoration.none)),
                  subtitle: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(tracks[index].artistNames, overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(fontSize: 14.0,color:Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none)),
                      ),
                      Expanded(child: Text(" - ${tracks[index].albumName}", overflow: TextOverflow.ellipsis, maxLines: 1,)),
                    ],
                  ),
                  trailing: Icon(Icons.more_vert),
                );
                return GestureDetector(
                  child: tile,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MusicPlayer(songs, index)
                    ));
                  },
                );
              }).toList()),
              itemExtent: 70.0,
            ),
          ],
        ),
      ),
    );
  }

}


