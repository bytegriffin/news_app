import 'package:flutter/material.dart';
import '../util/image_util.dart';
import 'album_detail.dart';
import '../models/album.dart';
import '../util/color_util.dart';

class AlbumListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final List<Album> albumList;
  AlbumListPage(this.title, this.backgroundImage,this.albumList);
  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  int albumCount = 0 ;
  List<Album> albumList= List.generate(30, (index) {
    return Album("$index", "" , defaultMusicImage, "", "" , "",  "", null);
  });

  @override
  void initState(){
    super.initState();
    setState(() {
      albumList =widget.albumList;
      albumCount = albumList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getTopListBGColor(context),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
            ],
//            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              background: Image.asset(widget.backgroundImage, fit:BoxFit.cover,),
            ),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,
              mainAxisSpacing:0.0,
              crossAxisSpacing:0.0,
              childAspectRatio: 7 / 10,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: getCachedImage(albumList[index].picUrl+""),
                            ),
                            height: 140,
                            width: 140,
                          ),
                          Text(albumList[index].name, overflow: TextOverflow.ellipsis, maxLines: 1,
                              style: TextStyle(fontSize: 16.0,color: getTextColor(context),decoration: TextDecoration.none)),
                          Text(albumList[index].artistName, overflow: TextOverflow.ellipsis, maxLines: 1,
                              style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,fontSize: 14.0,
                                  color: getTextColor(context),decoration: TextDecoration.none)),
                        ],
                      )
                  ),//getMovieRatingWidget(movie?.rate??"0.0")
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AlbumDetailPage(albumList[index]??null)
                    ));
                  },
                );
              },
              childCount: albumCount,
            ),
          )
        ],
      ),
    );
  }

}


