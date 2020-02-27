import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import '../util/image_util.dart';
import '../components/custom_card.dart';
import 'song_list.dart';
import 'top_song.dart';
import '../models/song.dart';
import '../models/album.dart';
import 'album_list.dart';
import '../models/mv.dart';
import 'mv_list.dart';
import 'artist_index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'mv_detail.dart';
import 'new_song_playlist.dart';
import '../models/play_list.dart';
import 'rec_song_playlist.dart';
import '../models/free_movie.dart';
import '../models/artist.dart';

// 音乐首页
class MusicIndexPage extends StatefulWidget {
  @override
  _MusicIndexPageState createState() => _MusicIndexPageState();
}

class _MusicIndexPageState extends State<MusicIndexPage> with AutomaticKeepAliveClientMixin{

  List<Song> recNewMusicList;

  List<Album> recNewAlbumList;

  List<MV> recNewMVList= List.generate(4, (index) {
    return MV("$index","",defaultMusicImage,"");
  });

  List<PlayList> reSongPlayList= List.generate(6, (index) {
    return PlayList("", defaultMusicImage);
  });

  List<FreeMovie> freeMovieList= List<FreeMovie>();

  List<Artist> artistList = List<Artist>();

  @override
  bool get wantKeepAlive => true;

  _buildFreeMovies(){
    freeMovieList.add(FreeMovie("30402564",PageType.Movie, "泰勒·斯威夫特：“举世盛名”巡回演唱会","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2543029684.webp","https://youku.haokzy-tudou.com/ppvod/F1hQfQI9.m3u8"));
    freeMovieList.add(FreeMovie("34809304",PageType.Movie,"周杰伦2016地表最强世界巡回演唱会","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2574680900.webp","https://youku.haokzy-tudou.com/ppvod/31fZdHqp.m3u8"));
    freeMovieList.add(FreeMovie("30392921",PageType.Music,"張學友：醒著做夢音樂會","https://img9.doubanio.com/view/subject/m/public/s29937715.jpg","https://youku.haokzy-tudou.com/ppvod/CCbjEXFr.m3u8"));
  }

  _buildArtists(){
    artistList.add(Artist("7763","邓紫棋","http://p1.music.126.net/W42LIbHIkxcccJfQYWzSIA==/109951164561122718.jpg?param=177y177"));
    artistList.add(Artist("6452","周杰伦","http://p2.music.126.net/ql3nSwy0XKow_HAoZzRZgw==/109951163111196186.jpg?param=177y177"));
    artistList.add(Artist("964108","吴亦凡","http://p2.music.126.net/VNls4lysbyGZx-gVlaFO6g==/109951163304251991.jpg?param=177y177"));
    artistList.add(Artist("9621","王菲","http://p1.music.126.net/1KQVD6XWbs5IAV0xOj1ZIA==/18764265441342019.jpg?param=177y177"));
    artistList.add(Artist("6460","张学友","http://p2.music.126.net/Ear-Ycru9SHVKzEL39of9w==/3286440257877602.jpg?param=177y177"));
    artistList.add(Artist("3684","林俊杰","http://p1.music.126.net/_cB2figc8IpT89DYhpARxA==/3389794350704969.jpg?param=177y177"));
    artistList.add(Artist("3691","刘德华","http://p1.music.126.net/3ASmrU2Nej5t6Hj_7JkQOw==/40681930245654.jpg?param=177y177"));
    artistList.add(Artist("5781","薛之谦","http://p1.music.126.net/W__FCWFiyq0JdPtuLJoZVQ==/109951163765026271.jpg?param=177y177"));
    artistList.add(Artist("4721","朴树","http://p2.music.126.net/YDKUscOIKTm7Ko7KyKWggw==/3346913395417148.jpg?param=177y177"));
    artistList.add(Artist("2116","陈奕迅","http://p2.music.126.net/nILBk4DaE3yV__25uq-5GQ==/18641120139241412.jpg?param=177y177"));
    artistList.add(Artist("4723","潘玮柏","http://p1.music.126.net/VbC0CDRFn-4fesL6eJFWjQ==/109951163766134127.jpg?param=177y177"));
    artistList.add(Artist("36490","Johann Sebastian Bach","http://p1.music.126.net/dPp4HlN1c-HBXwc0nBwgaw==/109951163620844481.jpg?param=177y177"));
    artistList.add(Artist("32665","Eminem","http://p1.music.126.net/0-lP9MDZ02AQcMlT45LuXA==/109951164631221738.jpg?param=177y177"));
    artistList.add(Artist("53283","Drake","http://p1.music.126.net/RRV9FIP8MQAs-2t9Xo98-Q==/210006720922713.jpg?param=177y177"));
    artistList.add(Artist("44266","Taylor Swift","http://p1.music.126.net/nSp0W3dWuUfEY5XETjhsVg==/109951164025974359.jpg?param=177y177"));
    artistList.add(Artist("1045123","Alan Walker","http://p2.music.126.net/--Sx5gSt57L7pBeV_UWJkQ==/18953381439717008.jpg?param=177y177"));
  }

  _getMusics(){
    //推荐新音乐
    HttpClient.get(REC_NEW_MUSIC_URL, (result){
      if(mounted){
        setState(() {
          this.recNewMusicList = SongList.fromJson(result).result;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //新碟上架
    HttpClient.get(NEW_ALBUM_URL, (result){
      if(mounted){
        setState(() {
          this.recNewAlbumList = AlbumList.fromJson(result).albums;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //推荐新MV
    HttpClient.get(REC_MV_URL, (result){
      if(mounted){
        setState(() {
          this.recNewMVList = RecMV.fromJson(result).result;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    //推荐歌单
    HttpClient.get(REC_MV_URL+"6", (result){
      if(mounted){
        setState(() {
          this.reSongPlayList = PersonalPlayLists.fromJson(result).result;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

  }

  @override
  void initState(){
    _getMusics();
    _buildFreeMovies();
    _buildArtists();
    super.initState();
  }

  List<Widget> generateDefaultRecNewMusicList() {
    if(recNewMusicList == null){
      recNewMusicList= List.generate(6, (index) {
        return Song("$index", "", defaultMusicImage, "", null);
      });
    }
    if(recNewMusicList.sublist(0,6) == null){
      return recNewMusicList.asMap().keys.map((index) => getSongRowItem(context, recNewMusicList, index)).toList();
    }
    return recNewMusicList.sublist(0,6).asMap().keys.map((index) => getSongRowItem(context, recNewMusicList, index)).toList();
  }

  List<Widget> generateDefaultRecNewAlbumList() {
    if(recNewAlbumList == null){
      recNewAlbumList= List.generate(6, (index) {
        return Album("$index", "" , defaultMusicImage, "", "" , "",  "", null);
      });
    }
    if(recNewAlbumList.sublist(0,6) == null){
      return recNewAlbumList.map((item) => getAlbumRowItem(context, item)).toList();
    }
    return recNewAlbumList.sublist(0,6).map((item) => getAlbumRowItem(context, item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          _buildSwiper(),
          _buildButton(),
          buildRowSongCard(context,"推荐新音乐",SongListPage("推荐新音乐",topNewMusicImage, recNewMusicList), generateDefaultRecNewMusicList()),
          buildRowAlbumCard(context,"推荐新专辑",AlbumListPage("推荐新专辑",topNewMusicImage, recNewAlbumList), generateDefaultRecNewAlbumList()),
          Container(height: 20,),
          buildRowArtistCard(context,"推荐歌手", artistList),
          Container(height: 20,),
          buildRowMVCard(context,"推荐新MV",MVListPage(),recNewMVList),
          Container(height: 20,),
          buildRowSongPlayListCard(context,"推荐歌单",RecSongPlayListPage(),reSongPlayList),
          Container(height: 20,),
          buildRowCustomFreeMovieCard(context,"推荐演唱会", freeMovieList),
      ],
    ),
    );
  }

  //构建轮播图
  Widget _buildSwiper(){
    var con = Container(
      height: 120,
      width: MediaQuery.of(context).size.width/ 1.1,
      child: Swiper(
        pagination: new SwiperPagination(margin: new EdgeInsets.all(1.0)),
        itemCount: 3,
        autoplay: true,
        itemBuilder: (c, i) {
          return GestureDetector(
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(recNewMVList[i]?.cover??"",fit: BoxFit.cover,),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => new MVDetailPage(recNewMVList[i].id)
              ));
            },
          );
        },
      ),
    );
    return Card(
      elevation: 4,
      child: con,
    );
  }

  //构建类别按钮
  Widget _buildButton(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.account_circle, color: Colors.blueAccent,size: 30,),
                Text("歌手")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ArtistIndexPage()
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.show_chart, color: Colors.deepPurple,size: 30,),
                Text("排行")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopSongPage()
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.queue_music, color: Colors.cyan,size: 30,),
                Text("歌单")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NewSongPlayListPage()
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.music_video, color: Colors.deepOrangeAccent,size: 30,),
                Text("MV")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MVListPage()
              ));
            },
          )
        ],
      ),
    );
  }

}
