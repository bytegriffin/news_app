import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../models/top_movie.dart';
import '../views/movie_detail.dart';
import '../components/star_rating.dart';
import '../models/song.dart';
import '../models/album.dart';
import '../models/mv.dart';
import '../views/album_detail.dart';
import '../components/music_player.dart';
import '../views/mv_detail.dart';
import '../util/color_util.dart';
import '../models/book.dart';
import '../views/book_detail.dart';
import '../models/play_list.dart';
import '../models/free_movie.dart';
import '../views/song_playlist_detail.dart';
import '../views/custom_free_movie_detail.dart';
import '../models/artist.dart';
import '../views/artist_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/top_book.dart';
import '../views/top_book_list.dart';
import '../net/http_config.dart';
import '../views/bundle_book_detail.dart';

Widget getBoxCard(Widget widget) {
  var con = Container(
    width: 450,
    margin: EdgeInsets.all(0.0),
    child: widget,
  );
  return Card(
    child: con,
  );
}

Widget buildRowSongPlayListCard(BuildContext context,String typeName,Widget page, List<PlayList> playlist){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:5.0,left: 5.0,bottom: 0.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            )
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // reverse: true,
        //padding: EdgeInsets.all(0.0),
        physics: BouncingScrollPhysics(),
        child: Row(
          children: <Widget>[
            getPlayListRowItem(context,playlist[0]),
            getPlayListRowItem(context,playlist[1]),
            getPlayListRowItem(context,playlist[2]),
            getPlayListRowItem(context,playlist[3]),
            getPlayListRowItem(context,playlist[4]),
            getPlayListRowItem(context,playlist[5]),
          ],
        ),
      ),
    ],
  );
}

Widget getPlayListRowItem(BuildContext context,PlayList playlist){
  return Container(
    alignment: Alignment.topLeft,
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(220),
            height: ScreenUtil().setHeight(220),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(playlist.picUrl??defaultMusicImage),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(220),
            child: Text("${playlist.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => SongPlayListDetailPage(playlist.id ,playlist.name,playlist.picUrl)
        ));
      },
    ),
  );
}

Widget getMVRowItem(BuildContext context,MV mv){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(200),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: getCachedImage(mv.cover),
                ),
              ),
              Icon(Icons.play_circle_outline,color: Colors.white,),
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: Text("${mv.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: Text("${mv.artistName}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0,)),
          )
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MVDetailPage(mv.id)
        ));
      },
    ),
  );
}

Widget buildRowMVCard(BuildContext context,String typeName,Widget page, List<MV> mvList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:5.0,left: 5.0,bottom: 0.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            )
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // reverse: true,
        //padding: EdgeInsets.all(0.0),
        physics: BouncingScrollPhysics(),
        child: Row(
          children: <Widget>[
            getMVRowItem(context,mvList[0]),
            getMVRowItem(context,mvList[1]),
            getMVRowItem(context,mvList[2]),
            getMVRowItem(context,mvList[3]),
          ],
        ),
      ),
    ],
  );
}

Widget getAlbumRowItem(BuildContext context,Album album){
  return Container(
    padding: EdgeInsets.all(1.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 130,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(album.picUrl),
            ),
          ),
          Container(
            width: 130,
            child: Text("${album.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: 130,
            child: Text("${album.artistName}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight:FontWeight.normal, fontSize: 14.0,)),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => AlbumDetailPage(album)
        ));
      },
    ),
  );
}

Widget buildRowAlbumCard(BuildContext context,String typeName,Widget page, List<Widget> albumList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            ),
          ],
        ),
      ),
      GridView.count(
        primary: false,
        shrinkWrap:true,
        //水平子Widget之间间距
        crossAxisSpacing:1.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 2.0,
        //GridView内边距
        padding: EdgeInsets.all(1.0),
        //一行的Widget数量
        crossAxisCount: 3,
        //子Widget宽高比例
        childAspectRatio: 7 / 10,
        //子Widget列表
        children: albumList,
      )
    ],
  );
}


Widget getSongRowItem(BuildContext context,List<Song> songs,int index){
  return Container(
    padding: EdgeInsets.all(1.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 130,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: getCachedImage(songs[index]?.picUrl),
                ),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child:Icon(Icons.play_circle_filled,color: songIconPlayColor,)
              )
            ],
          ),
          Container(
            width: 130,
            child: Text("${songs[index]?.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: 130,
            child: Text("${songs[index]?.artistNames??""}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight:FontWeight.normal, fontSize: 14.0,)),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MusicPlayer(songs, index)
        ));
      },
    ),
  );
}

Widget buildRowSongCard(BuildContext context,String typeName,Widget page, List<Widget> songList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            ),
          ],
        ),
      ),
      GridView.count(
        primary: false,
        shrinkWrap:true,
        //水平子Widget之间间距
        crossAxisSpacing:1.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 2.0,
        //GridView内边距
        padding: EdgeInsets.all(1.0),
        //一行的Widget数量
        crossAxisCount: 3,
        //子Widget宽高比例
        childAspectRatio: 7 / 10,
        //子Widget列表
        children: songList,
      )
    ],
  );
}

Widget buildRowArtistCard(BuildContext context,String typeName, List<Artist> artistList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 5.0,bottom: 5.0),
        child: Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: artistList.map((ar) {
            return getArtistRowItem(context, ar);
          }).toList(),
        ),
      ),
    ],
  );
}

Widget getArtistRowItem(BuildContext context,Artist artist){
  var container = Container(
    height: ScreenUtil().setHeight(270),
    padding: EdgeInsets.all(10.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            //child: Image.network(defaultMusicImage, fit: BoxFit.contain,),
            radius: 40.0,
            backgroundImage: NetworkImage(artist.picUrl),
            backgroundColor: Color(0xffffffff),
          ),
          Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(120),
            child: Text("${artist.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArtistDetailPage(artist.id)
        ));
      },
    ),
  );
  return Card(
    elevation: 1.0,
    child: container,
  );
}

Widget buildCustomFreeMovieRowItem(BuildContext context,FreeMovie movie){
  return Container(
    padding: EdgeInsets.only(left:5.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(movie.image),
            ),
          ),
          Container(
            width: 120,
            child: Text("${movie.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => new CustomFreeMovieDetailPage(movie)
        ));
      },
    ),
  );
}

Widget buildRowCustomFreeMovieCard(BuildContext context,String typeName, List<FreeMovie> movieList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 5.0,bottom: 5.0),
        child: Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: movieList.map((m) {
            return getCustomFreeMovieRowItem(context, m);
          }).toList(),
        ),
      ),
    ],
  );
}

Widget getCustomFreeMovieRowItem(BuildContext context,FreeMovie movie){
  return Container(
    padding: EdgeInsets.only(left:5.0,right:5.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(440),
                height: ScreenUtil().setHeight(300),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(movie.image??defaultMusicImage,fit: BoxFit.fill,),
                ),
              ),
              Icon(Icons.play_circle_outline,size: 30,color: Colors.white,)
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(440),
            child: Text("${movie.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CustomFreeMovieDetailPage(movie)
        ));
      },
    ),
  );
}


Widget buildRowMovieCard1(BuildContext context,String typeName,Widget page, List<Widget> movieList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Center(
        //padding: EdgeInsets.only(top:5.0,left: 5.0,bottom: 10.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("  $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            )
          ],
        ),
      ),
      GridView.count(
        primary: false,
        shrinkWrap:true,
        //水平子Widget之间间距
        crossAxisSpacing:3.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 2.0,
        //GridView内边距
        padding: EdgeInsets.all(5.0),
        //一行的Widget数量
        crossAxisCount: 3,
        //子Widget宽高比例
        childAspectRatio: 3 / 5,
        //子Widget列表
        children: movieList,
      ),
    ],
  );
}

Widget buildRowMovieCard2(BuildContext context,String typeName,Widget page, List<TopMovie> movieList){
  if(movieList == null){
    return Container();
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:5.0,left: 5.0,bottom: 5.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            )
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child:Row(
          children: <Widget>[
            Container(width: 5,),
            Row(
              children: movieList.map((movie) => getMovieRowItem2(context, movie)).toList(),
            ),
            Container(width: 5,),
          ],
        ),
      ),
    ],
  );
}

Widget getMovieRowItem2(BuildContext context,TopMovie movie){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal:5.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(movie.image),
            ),
          ),
          Container(
            width: 120,
            child: Text("${movie.title}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: 120,
            child: getMovieRatingWidget(movie?.rate??"0.0", getTopListBGColor(context)),
          )
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => new MovieDetailPage(movie.id)
        ));
      },
    ),
  );
}

Widget getMovieRowItem(BuildContext context,TopMovie movie){
  return Center(
    //padding: EdgeInsets.only(left:5.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(movie.image),
            ),
          ),
          Container(
            width: 120,
            child: Text("${movie.title}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: 120,
            child: getMovieRatingWidget(movie?.rate??"0.0", getTopListBGColor(context)),
          )
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => new MovieDetailPage(movie.id)
        ));
      },
    ),
  );
}

Widget buildRowMovieCard3(BuildContext context,String typeName,Widget page, List<TopMovie> movieList){
  if(movieList == null){
    return Container();
  }else if(movieList.length > 3){
    movieList = movieList.sublist(0, 3);
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:10.0,left: 5.0,bottom: 5.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            )
          ],
        ),
      ),
      Column(
        children: movieList.map((movie) => _buildMovieRowItem(context, movie)).toList(),
      ),
    ],
  );
}


Widget _displayWidget(String title, List<String> list){
  String name = "";
  for (int i=0; i < list.length; i++) {
    name += list[i].toString();
    if(list.length - i > 1){
      name = name + " | ";
    }
  }
  return Text(
    title + name,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
  );
}

Widget _buildMovieRowItem(BuildContext context,TopMovie movie){
  var row = Row(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(4),
        height: 150,
        width: 110,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.network(movie.image,fit: BoxFit.fill,),
        ),
      ),
      Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 8.0),
            height: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  movie.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: <Widget>[
                    Text("评分："),
                    getMovieRatingWidget(movie?.rate??"0.0", getTopListBGColor(context))
                  ],
                ),
                _displayWidget("导演：", movie?.directors??List<String>()),
                _displayWidget("演员：", movie?.casts??List<String>()),
              ],
            ),
          )
      )
    ],
  );
  return GestureDetector(
    child: Card(
      child: row,
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => MovieDetailPage(movie.id)
      ));
    },
  );
}


Widget buildRowBookCard1(BuildContext context,String typeName,Widget page, List<Widget> bookList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:5.0,left: 5.0,bottom: 10.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("  $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            )
          ],
        ),
      ),
      GridView.count(
        primary: false,
        shrinkWrap:true,
        //水平子Widget之间间距
        crossAxisSpacing:3.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 2.0,
        //GridView内边距
        padding: EdgeInsets.all(5.0),
        //一行的Widget数量
        crossAxisCount: 3,
        //子Widget宽高比例
        childAspectRatio: 3 / 5,
        //子Widget列表
        children: bookList,
      ),
    ],
  );
}


Widget buildRowBookCard2(BuildContext context,String typeName,Widget page, List<Book> bookList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:5.0,left: 5.0,bottom: 10.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            )
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: <Widget>[
            Container(width: 5,),
            Row(
              children: bookList.map((book) => getBookRowItem2(context, book)).toList(),
            ),
            Container(width: 5,),
          ],
        )
      ),
    ],
  );
}

Widget getBookRowItem2(BuildContext context,Book book){
  Widget goPage = BookDetailPage(book);
  if(book.isBundle){
    goPage = BundleBookDetailPage(book);
  }
  return Container(
    padding: EdgeInsets.symmetric(horizontal:5.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(book?.cover??defaultBookImage),
            ),
          ),
          Container(
            width: 120,
            child: Text("${book.title}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: 120,
            child: Text("${book.authors??book.origAuthors}",overflow: TextOverflow.ellipsis,
                maxLines:1,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.0,)),
          )
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => goPage
        ));
      },
    ),
  );
}

Widget getBookRowItem(BuildContext context,Book book){
  Widget goPage = BookDetailPage(book);
  if(book.isBundle){
    goPage = BundleBookDetailPage(book);
  }
  return Center(
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(book?.cover??defaultBookImage),
            ),
          ),
          Container(
            width: 120,
            child: Text("${book.title}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: 120,
            child: Text("${book.authors??book.origAuthors}",overflow: TextOverflow.ellipsis,
                maxLines:1,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.0,)),
          )
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
           builder: (context) => goPage
        ));
      },
    ),
  );
}

Widget buildRowBookCard3(BuildContext context,String typeName,Widget page, List<Book> bookList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:10.0,left: 5.0,bottom: 5.0,right: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Text("查看更多",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
                  Icon(Icons.arrow_right,color: Colors.blue,)
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => page
                ));
              },
            )
          ],
        ),
      ),
      _buildBookRowItem(context,bookList[0]),
      _buildBookRowItem(context,bookList[1]),
      _buildBookRowItem(context,bookList[2])
    ],
  );
}

Widget _buildBookRowItem(BuildContext context,Book book){
  Widget goPage = BookDetailPage(book);
  if(book.isBundle){
    goPage = BundleBookDetailPage(book);
  }
  var row = Row(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(4),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.network(book.cover),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 8.0),
          height: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                book.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                '作者：${book.authors??book.origAuthors}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                book?.abstract??"",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle( fontWeight: FontWeight.w600,),
              ),
              Text(
                "约 ${book.wordCount} | ${book.kindNames} ",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )
      )
    ],
  );
  return GestureDetector(
    child: Card(
      child: row,
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => goPage
      ));
    },
  );
}

Widget buildRowBookCard4(BuildContext context,String typeName, List<Widget> bookList){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:5.0,left: 5.0,bottom: 10.0,right: 5.0),
        child: Row(
          children: <Widget>[
            Text(" $typeName",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0,)),
//            GestureDetector(
//              child: Row(
//                children: <Widget>[
//                  Text("换一换",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0,color: Colors.blue)),
//                  Icon(Icons.refresh,color: Colors.blue,)
//                ],
//              ),
//              onTap: (){
//                if(bookList.length > 6){
//                  bookList = bookList.sublist(6, size+6);
//                }
//              },
//            )
          ],
        ),
      ),
      GridView.count(
        primary: false,
        shrinkWrap:true,
        //水平子Widget之间间距
        crossAxisSpacing:3.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 2.0,
        //GridView内边距
        padding: EdgeInsets.all(5.0),
        //一行的Widget数量
        crossAxisCount: 3,
        //子Widget宽高比例
        childAspectRatio: 3 / 5,
        //子Widget列表
        children: bookList,
      ),
    ],
  );
}

Widget buildScrollRow(List<Widget> widgets){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    child: Row(
      children: widgets,
    )
  );
}

Widget buildTopWidget(BuildContext context, String topic, List<TopBook> bookList){
  List<Color> colorList = [Color(0xFFfbab66), Color(0xFFf7418c)];
  String onclickUrl = TOP_WOMEN_BOOK;
  if(topic.contains("悬疑")){
    onclickUrl = TOP_MYSTERY_BOOK;
    colorList = [Color(0xFFCDB38B), Color(0xFFCD6839)];
  }else if(topic.contains("幻想")){
    onclickUrl = TOP_SCIENCE_BOOK;
    colorList = [Color(0xFFCD96CD), Color(0xFF9B30FF)];
  }
  var c = Column(
    children: <Widget>[
      Container(
        height: ScreenUtil().setHeight(120),
        alignment: Alignment.centerLeft,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
          gradient: LinearGradient(
            colors: colorList,
            begin: Alignment.centerLeft,
            end:Alignment.centerRight
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(width: 40,),
                Text(topic,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,),),
              ],
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => TopBookListPage(topic,topSalesBookImage, onclickUrl)
                    ));
                  },
                  child: Text("查看详情 >",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold,),),
                ),
                Container(width:30,),
              ],
            )
          ],
        )
      ),
      Container(
        width:double.infinity,
        padding: EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: bookList.sublist(0, 5).map((book) => _buildListTile(context, book)).toList(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: bookList.sublist(5, bookList.length).map((book) => _buildListTile(context, book)).toList(),
            )
          ],
        ),
      )
    ],
  );
  return SizedBox(
    width: ScreenUtil().setWidth(650),
    //height: ScreenUtil().setHeight(750),
    child: Card(
      child: Container(
        decoration: new BoxDecoration(
         // border: Border.all(width: 1.0,color: Colors.orangeAccent),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
        ),
        child: c,
      ),
    ),
  );
}

Widget _buildListTile(BuildContext context, TopBook topBook){
  Widget text = Text(topBook.currentRank,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow),);
  if(topBook.currentRank == "1"){
    text = Text(topBook.currentRank,style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold,),);
  } else if(topBook.currentRank == "2"){
    text = Text(topBook.currentRank,style: TextStyle(fontSize: 20,color: Colors.orange,fontWeight: FontWeight.bold,),);
  } else if(topBook.currentRank == "3"){
    text = Text(topBook.currentRank,style: TextStyle(fontSize: 20,color: Colors.amber,fontWeight: FontWeight.bold,),);
  }
  Widget cc = Container();
  if(topBook.currentRank == "10"){
    cc = Container();
  } else {
    cc = Container(padding: EdgeInsets.only(right:10),);
  }
  String image = topBook.image;
  if(image == null || image.trim() == "" ){
    image = defaultBookImage;
  }
  var row = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      cc,
      text,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: Image.network(image,width: ScreenUtil().setWidth(60),),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(160),
            child: Text(topBook.title,maxLines: 2,overflow: TextOverflow.ellipsis,style:
            TextStyle(fontSize: 14,fontWeight: FontWeight.bold,))
          ),
          Container(
            width: ScreenUtil().setWidth(160),
            child: Text(topBook.authors,maxLines: 1,overflow: TextOverflow.ellipsis,style:
                 TextStyle(fontSize: 13,fontWeight: FontWeight.normal,))
          ),
        ],
      ),
      //Container(padding: EdgeInsets.only(right:5),)
    ],
  );
  return GestureDetector(
    child: row,
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => BookDetailPage(Book(topBook.eBookId, topBook.title, topBook.image, topBook.authors, false ))
      ));
    },
  );
}