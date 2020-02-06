import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import 'artist_detail.dart';
import '../models/artist.dart';
import '../util/image_util.dart';

// 欧美组合歌手列表
class OMBandArtistListPage extends StatefulWidget {
  @override
  _OMBandArtistListPageState createState() => _OMBandArtistListPageState();
}

class _OMBandArtistListPageState extends State<OMBandArtistListPage> with AutomaticKeepAliveClientMixin{
  int size = 0;

  List<Artist> artistList= List.generate(0, (index) {
    return Artist("$index","",defaultMusicImage);
  });

  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();
    _getMusics();
  }

  _getMusics(){
    HttpClient.get(ARTIST_URL+"2003&limit=100", (result){
      if(mounted){
        setState(() {
          this.artistList = ArtistNewList.fromJson(result).artists;
          size = this.artistList.length;
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
        itemCount: size,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(artistList[index]?.picUrl??defaultMusicImage,fit: BoxFit.cover,width: 100,height: 80),
            ),
            title: Container(child: Text(artistList[index].name)),
            subtitle: Row(
              children: <Widget>[
                Text("单曲：${artistList[index].musicSize}" ,maxLines: 1,overflow: TextOverflow.fade,),
                Expanded(
                  child: Text(" - 专辑：${artistList[index].albumSize}",maxLines: 1,overflow: TextOverflow.fade),
                ),
              ],
            ),
            //trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ArtistDetailPage(artistList[index].id)
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


