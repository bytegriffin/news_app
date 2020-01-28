import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../util/color_util.dart';
import '../components/expandable_text.dart';
import '../models/album.dart';
import '../models/artist.dart';
import '../models/song.dart';
import '../util/image_util.dart';
import 'album_detail.dart';
import '../components/nav_button.dart';
import '../models/mv.dart';
import 'mv_detail.dart';
import '../components/sliver_appbar_delegate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/music_player.dart';

class ArtistDetailPage extends StatefulWidget {
  final String id;
  ArtistDetailPage(this.id);
  @override
  _ArtistDetailPageState createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> with TickerProviderStateMixin{
  VoidCallback playOnTap;
  Artist artist;
  ArtistDesc artistDesc;
  TabController tabController;
  int mvCount;

  List<Song> hotSongs;

  List<Album> hotAlbums;

  List<MV> artistMVs;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    // 获取歌手热门歌曲
    HttpClient.get(ARTIST_SONG_URL+widget.id, (result){
      if(mounted){
        setState(() {
          ArtistSong as = ArtistSong.fromJson(result);
          this.hotSongs = as.hotSongs;
          this.artist = as.artist;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    // 获取歌手简介
    HttpClient.get(ARTIST_DESC_URL+widget.id, (result){
      if(mounted){
        setState(() {
          this.artistDesc = ArtistDesc.fromJson(result);
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    // 获取歌手专辑
    HttpClient.get(ARTIST_ALBUM_URL+widget.id, (result){
      if(mounted){
        setState(() {
          this.hotAlbums = ArtistAlbum.fromJson(result).hotAlbums;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    // 获取歌手MV
    HttpClient.get(ARTIST_MV_URL+widget.id, (result){
      if(mounted){
        setState(() {
          this.artistMVs = ArtistMV.fromJson(result).mvs;
          this.mvCount = this.artistMVs.length;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  Widget getSeq(int index){
    index = index + 1;
    return Padding(padding: EdgeInsets.all(10), child: Text("$index"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              buildHomeNavButton(context)
            ],
            backgroundColor: detailPageBGColor,
            expandedHeight: 240.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(artist?.name??""),
              background: getCachedImage(artist?.picUrl??defaultMusicImage),
            ),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverPersistentHeader(
            delegate: SliverAppBarDelegate(TabBar(
              labelColor: getTabColor(context),
              unselectedLabelColor: getUnselectedLabelColor(),
              tabs: [
                Tab(text: '热门歌曲'),
                Tab(text: '专辑'),
                Tab(text: 'MV'),
                Tab(text: '简介'),
              ],
              controller: tabController,
            ))
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                ListView.builder(
                  itemCount: hotSongs?.length??0,
                  itemBuilder: (context,index){
                    return getSongs(index);
                  }
                ),
                ListView.builder(
                  itemCount: hotAlbums?.length??0,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      child: getAlbums(index),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AlbumDetailPage(hotAlbums[index]??null)
                        ));
                      },
                    );
                  }
                ),
                ListView.builder(
                  itemCount: mvCount??0,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      child: getMVs(index),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MVDetailPage(artistMVs[index].id)
                        ));
                      },
                    );
                  }
                ),
                getArtistDesc(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getSongs(int index){
    Song song = hotSongs[index];
    var tile = ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: getCachedImage(song?.album?.picUrl??defaultMusicImage,width: 60),
      ),
      title: Text(song?.name??"", overflow: TextOverflow.ellipsis, maxLines: 1,
          style: TextStyle(fontSize: 16.0,decoration: TextDecoration.none)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(song?.artistNames??"", overflow: TextOverflow.ellipsis, maxLines: 1,
                style: TextStyle(fontSize: 14.0,color:Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none)),
          ),
          Expanded(
            child: Text(" - "+song?.albumName.toString()??"", overflow: TextOverflow.ellipsis, maxLines: 1,
                style: TextStyle(fontSize: 14.0,color:Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none)),
          )
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
  }

  Widget getAlbums(int index){
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: getCachedImage(hotAlbums[index]?.picUrl??defaultMusicImage,width: 60),
      ),
      title: Text(hotAlbums[index]?.name??"", overflow: TextOverflow.ellipsis, maxLines: 1,
          style: TextStyle(fontSize: 16.0,decoration: TextDecoration.none)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(hotAlbums[index]?.pubTime??"", overflow: TextOverflow.ellipsis, maxLines: 1,
                style: TextStyle(fontSize: 14.0,color:Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none)),
          ),
        ],
      ),
    );
  }

  Widget getMVs(int index){
   var column = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10,bottom: 10),
          child: Stack(
            alignment:Alignment.center ,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: getCachedImage(artistMVs[index]?.cover??defaultMusicImage,width: 140,height: 80),
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
              width: ScreenUtil().setWidth(400),
              child: Text(artistMVs[index]?.name??"",
                style: TextStyle(fontSize:16),),
            ),
             Text(artistMVs[index]?.duration??"", overflow: TextOverflow.ellipsis, maxLines: 1,
               style: TextStyle(fontSize: 16.0,color:Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none))
          ],
        ),
      ]
    );
    return column;
  }

  // 是否显示歌手简介
  Widget _displayBrief(){
    if (artist == null || artist.briefDesc == null) {
      return Container();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" 歌手简介  · · · · · ·",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: detailPageTitleTextColor
          )
        ),
        ExpandableText(
          text: "       ${artist?.briefDesc?.toString()??''}",
          maxLines: 5,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // 是否显示歌手详情1
  Widget _displayTi1(){
    if (artistDesc == null || artistDesc.ti1 == null) {
      return Container(height: 10,);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" ${artistDesc?.ti1??''}  · · · · · ·",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: detailPageTitleTextColor
          )
        ),
        ExpandableText(
          text: "       ${artistDesc?.txt1?.toString()??''}",
          maxLines: 5,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // 是否显示歌手详情2
  Widget _displayTi2(){
    if (artistDesc == null || artistDesc.ti2 == null) {
      return Container(height: 10,);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" ${artistDesc?.ti2??''}  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: "       ${artistDesc?.txt2?.toString()??''}",
          maxLines: 5,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // 是否显示歌手详情3
  Widget _displayTi3(){
    if (artistDesc == null || artistDesc.ti3 == null) {
      return Container(height: 10,);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" ${artistDesc?.ti3??''}  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: "       ${artistDesc?.txt3?.toString()??''}",
          maxLines: 5,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // 是否显示歌手详情4
  Widget _displayTi4(){
    if (artistDesc == null || artistDesc.ti4 == null) {
      return Container(height: 10,);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" ${artistDesc?.ti4??''}  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: "       ${artistDesc?.txt4?.toString()??''}",
          maxLines: 5,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget getArtistDesc(){
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _displayBrief(),
        _displayTi1(),
        _displayTi2(),
        _displayTi3(),
        _displayTi4()
      ],
    );
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 20,left: 4,right: 4,top: 4),
          child: column
      ),
    );
  }

}
