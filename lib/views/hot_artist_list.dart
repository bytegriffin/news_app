import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import 'artist_detail.dart';
import '../models/artist.dart';

// 热门歌手列表
class HotArtistListPage extends StatefulWidget {
  HotArtistListPage();

  @override
  _HotArtistListPageState createState() => _HotArtistListPageState();
}

class _HotArtistListPageState extends State<HotArtistListPage> with AutomaticKeepAliveClientMixin{
  int count = 0;

  @override
  bool get wantKeepAlive => true;

  List<Artist> hotArtistList= List.generate(0, (index) {
    return Artist("$index","",defaultMusicImage);
  });

  @override
  void initState(){
    super.initState();
    _getMusics();
  }

  _getMusics(){
    //推荐新音乐
    HttpClient.get(HOT_ARTIST_URL, (result){
      if(mounted){
        setState(() {
          this.hotArtistList = ArtistList.fromJson(result).artists;
          count = this.hotArtistList.length;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView.separated(
        itemCount: count,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(hotArtistList[index]?.picUrl??defaultMusicImage,fit: BoxFit.cover,width: 100,height: 80),
            ),
            title: Container(child: Text(hotArtistList[index].name)),
            subtitle: Row(
              children: <Widget>[
                Text("单曲：${hotArtistList[index].musicSize}" ,maxLines: 1,overflow: TextOverflow.fade,),
                Expanded(
                  child: Text(" - 专辑：${hotArtistList[index].albumSize}",maxLines: 1,overflow: TextOverflow.fade),
                ),
              ],
            ),
            //trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ArtistDetailPage(hotArtistList[index].id)
              ));
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

}


