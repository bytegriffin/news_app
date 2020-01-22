import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../components/cycle_list_header.dart';
import '../models/song.dart';
import '../components/nav_button.dart';
import '../util/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/music_player.dart';

//推荐音乐列表
class SongListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final List<Song> songList;
  SongListPage(this.title, this.backgroundImage,this.songList);
  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  List<Song> songList;
  VoidCallback playOnTap;

  @override
  void initState(){
    super.initState();
    songList =widget.songList;
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
              background: Image.asset(widget.backgroundImage, fit:BoxFit.cover,),
            ),
            title: Text(widget.title),
            pinned: true,
            floating: false,
            snap: false,
            bottom: CycleListHeader(
              onTap: playOnTap,
              count: songList.length,
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(songList.map((song) {
              var tile =  ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: getCachedImage(song.picUrl,width: 60),
                      ),
                    title: Text(song.name, overflow: TextOverflow.ellipsis, maxLines: 1,
                              style: TextStyle(fontSize: 16.0,decoration: TextDecoration.none)),
                    subtitle: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(song.artistName, overflow: TextOverflow.ellipsis, maxLines: 1,
                              style: TextStyle(fontSize: 14.0,color:Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none)),
                        ),
                        Expanded(child: Text(" - "+song.album.name, overflow: TextOverflow.ellipsis, maxLines: 1,)),
                      ],
                    ),
                trailing: Icon(Icons.more_vert),
                  );
              return GestureDetector(
                child: tile,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MusicPlayer(song)
                  ));
                },
              );
            }).toList()),
            itemExtent: 70.0,
          ),

        ],
      ),
    );
  }

}


