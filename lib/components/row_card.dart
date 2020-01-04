import 'package:flutter/material.dart';
import '../util/imageutil.dart';
import '../models/top_book.dart';
import '../views/book_detail.dart';

Widget buildRowBookCard(BuildContext context,String typeName,Widget page, List<TopBook> bookList){
  return SizedBox(
    height: 280,
    child: Card(
      clipBehavior: Clip.antiAlias,
      semanticContainer: true,
      elevation: 5.0,
      margin: EdgeInsets.all(5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
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
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getBookRowItem(BuildContext context,TopBook book){
  return Padding(
    padding: EdgeInsets.all(11.0),
    child: GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: getCachedImage(book.image),
          ),
          Container(
            width: 100,
            child: Text("${book.title}",overflow: TextOverflow.ellipsis,
                maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
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
    ),
  );
}