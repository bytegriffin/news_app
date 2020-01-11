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
import 'artist_list.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'mv_detail.dart';
import 'top_playlist.dart';

// 音乐首页
class MusicIndexPage extends StatefulWidget {
  @override
  _MusicIndexPageState createState() => _MusicIndexPageState();
}

class _MusicIndexPageState extends State<MusicIndexPage> with AutomaticKeepAliveClientMixin{

  List<Song> recNewMusicList= List.generate(6, (index) {
    return Song("$index", "", defaultMusicImage , "" , "",);
  });

  List<Album> recNewAlbumList= List.generate(6, (index) {
    return Album("$index", "" , defaultMusicImage, "", "" , "",  "", null);
  });

  List<MV> recNewMVList= List.generate(4, (index) {
    return MV("$index","测试",defaultMusicImage,"");
  });

  @override
  bool get wantKeepAlive => true;

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

  }

  @override
  void initState(){
    _getMusics();
    super.initState();
  }

  List<Widget> generateDefaultRecNewMusicList() {
    return recNewMusicList.sublist(0,6).map((item) => getSongRowItem(context, item)).toList();
  }

  List<Widget> generateDefaultRecNewAlbumList() {
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
          buildRowMVCard(context,"推荐新MV",MVListPage("推荐新MV",topNewMusicImage),recNewMVList),
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
              child: getCachedImage(recNewMVList[i]?.cover??""),
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
                  builder: (context) => ArtistListPage("歌手",topNewMusicImage)
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
                  builder: (context) => TopSongPage("排行",searchMovieImage)
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
                  builder: (context) => TopPlayListPage("歌单",topNewMusicImage)
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
                  builder: (context) => MVListPage("推荐新MV",topNewMusicImage)
              ));
            },
          )
        ],
      ),
    );
  }

}
