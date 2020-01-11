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

  List<Song> hotSongs = List.generate(1, (index) {
    return Song("$index", "", defaultMusicImage , "" , "",);
  });

  List<Album> hotAlbums = List.generate(1, (index) {
    return Album("$index", "" , defaultMusicImage, "", "" , "",  "", null);
  });

  List<MV> artistMVs = List.generate(1, (index) {
    return MV("$index", "" , defaultMusicImage, "");
  });

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
            delegate: _SliverAppBarDelegate(TabBar(
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: '歌曲 (热门)'),
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
                  itemCount: hotSongs?.length,
                  itemBuilder: (context,index){
                    return getSongs(index);
                  }
                ),
                ListView.builder(
                  itemCount: hotAlbums?.length,
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
                  itemCount: mvCount,
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
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: getCachedImage(song?.album?.picUrl??defaultMusicImage,width: 60),
      ),
      title: Text(song?.name??"", overflow: TextOverflow.ellipsis, maxLines: 1,
          style: TextStyle(fontSize: 16.0,color: Colors.black,decoration: TextDecoration.none)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(song?.artistName??"", overflow: TextOverflow.ellipsis, maxLines: 1,
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
  }

  Widget getAlbums(int index){
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: getCachedImage(hotAlbums[index]?.picUrl??defaultMusicImage,width: 60),
      ),
      title: Text(hotAlbums[index]?.name??"", overflow: TextOverflow.ellipsis, maxLines: 1,
          style: TextStyle(fontSize: 16.0,color: Colors.black,decoration: TextDecoration.none)),
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
              width: 250,
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

  Widget getArtistDesc(){
    var column = Column(
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
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
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
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
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
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
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
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
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
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
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


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}