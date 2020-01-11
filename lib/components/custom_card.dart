import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../models/top_book.dart';
import '../views/book_detail.dart';
import '../models/top_movie.dart';
import '../views/movie_detail.dart';
import '../components/star_rating.dart';
import '../models/song.dart';
import '../models/album.dart';
import '../models/mv.dart';
import '../views/album_detail.dart';
import '../views/artist_detail.dart';
import '../views/mv_detail.dart';

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

Widget getMVRowItem(BuildContext context,MV mv){
  return Container(
    padding: EdgeInsets.all(1.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 130,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(mv.cover),
            ),
          ),
          Container(
            width: 130,
            child: Text("${mv.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: 130,
            child: Text("${mv.artistName}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight:FontWeight.normal, fontSize: 14.0,)),
          ),
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
        reverse: true,
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


Widget getSongRowItem(BuildContext context,Song song){
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
              child: getCachedImage(song?.picUrl),
            ),
          ),
          Container(
            width: 130,
            child: Text("${song?.name}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            width: 130,
            child: Text("${song?.artistName??""}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight:FontWeight.normal, fontSize: 14.0,)),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => new ArtistDetailPage(song.artists[0].id)
        ));
      },
    ),
  );
}

Widget buildRowSongCard(BuildContext context,String typeName,Widget page, List<Widget> movieList){
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
        children: movieList,
      )
    ],
  );
}


Widget buildRowMovieCard(BuildContext context,String typeName,Widget page, List<Widget> movieList){
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
        childAspectRatio: 3 / 5,
        //子Widget列表
        children: movieList,
      )
    ],
  );
}

Widget getMovieRowItem(BuildContext context,TopMovie movie){
  return Container(
    padding: EdgeInsets.all(1.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(movie.image),
            ),
          ),
          Container(
            width: 100,
            child: Text("${movie.title}",overflow: TextOverflow.ellipsis,
                maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
          ),
          Container(
            child: getMovieRatingWidget(movie?.rate??"0.0"),
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

Widget buildRowBookCard(BuildContext context,String typeName,Widget page, List<TopBook> bookList){
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
        reverse: true,
        //padding: EdgeInsets.all(0.0),
        physics: BouncingScrollPhysics(),
        child: Row(
          children: <Widget>[
            getBookRowItem(context,bookList[0]),
            getBookRowItem(context,bookList[1]),
            getBookRowItem(context,bookList[2]),
            getBookRowItem(context,bookList[3]),
            getBookRowItem(context,bookList[4]),
            getBookRowItem(context,bookList[5]),
          ],
        ),
      ),
    ],
  );
}

Widget getBookRowItem(BuildContext context,TopBook book){
  var pad = GestureDetector(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: getCachedImage(book.image),
        ),
        Container(
          width: 100,
          child: Text("${book.title}",overflow: TextOverflow.ellipsis,
              maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
        ),
        Container(
          width: 100,
          child: Text("${book.author}",overflow: TextOverflow.ellipsis,
              maxLines:1,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.0,)),
        )
      ],
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => new BookDetailPage(book.id)
      ));
    },
  );
  return Card(
    child: pad,
  );
}