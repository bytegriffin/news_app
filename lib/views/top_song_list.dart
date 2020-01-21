import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../components/cycle_list_header.dart';
import '../models/top_song.dart';
import '../components/nav_button.dart';
import '../util/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/track.dart';

//排行榜列表
class TopSongListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final TopSong topSong;
  TopSongListPage(this.title, this.backgroundImage,this.topSong);
  @override
  _TopSongListPageState createState() => _TopSongListPageState();
}

class _TopSongListPageState extends State<TopSongListPage> {
  TopSong topSong;
  VoidCallback playOnTap;
  List<Track> tracks;

  @override
  void initState(){
    super.initState();
    topSong = widget.topSong;
    tracks = topSong.tracks;
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
              count: tracks.length,
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
                    style: TextStyle(fontSize: 16.0,decoration: TextDecoration.none)),
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


