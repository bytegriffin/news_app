import 'package:flutter/material.dart';
import '../models/search_book.dart';
import '../util/imageutil.dart';
import '../components/star_rating.dart';
import '../components/text_tag.dart';
import '../components/custom_sliver.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';

class BookDetailPage extends StatefulWidget {
  final String id;
  BookDetailPage(this.id);
  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  SearchBook book;
  String summary = "";
  String authorIntro = "";
  String catalog = "";

  List<String> tags=List<String>.generate(1, (index){
    return "标签";
  });

  _getBooks(){
    HttpClient.get(GET_BOOK+widget.id, (result){
      if(mounted){
        setState(() {
          this.book = SearchBook.fromJson(result);
          this.tags = book.tags;
          this.summary = book.summary;
          this.authorIntro = book.authorIntro;
          this.catalog = book.catalog;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    _getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(book?.title??""),
        ),
        body: buildSliverList(
          Column(
            children: <Widget>[
              getItem(book),
              getTags(book),
              getSummary(book),
              getAuthroIntro(book),
              getCatalog(book)
            ],
          ),
        )
    );
  }

  // 获取书籍简介
  Widget getItem(SearchBook book) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(book?.image??defaultBookImage, width: 110, height: 160)
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      book?.title??"",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      "副标题：${book?.subtitle??""}",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    getRatingWidget(book?.rating??"0.0"),
                    Text(
                      '作者：${book?.author??""}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "出版社：${book?.publisher??""} ",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "出版时间：${book?.pubDate??""}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "价格：${book?.price??""}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
    return Card(
      child: row,
    );
  }

  // 获取书籍标签
  Widget getTags(SearchBook book) {
    return Card(
      child: Container(
        width: 400,
        margin: EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("常用的标签： ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                )
            ),
            TextTags(list:this.tags),
          ],
        ),
      ),
    );
  }

  // 获取书籍内容概要
  Widget getSummary(SearchBook book) {
    var row = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("摘要： ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            )
          ),
          Text(summary,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ))
//         由于是异步请求，当summary为空时，就会很快的传给ExpandableText，因此不起作用
//          ExpandableText(
//            text: summary,
//            maxLines: 5,
//            style: TextStyle(fontSize: 16, color: Colors.black),
//          )
        ],
      ),
    );
    return Card(
      child: row,
    );
  }

  // 获取作者简介
  Widget getAuthroIntro(SearchBook book) {
    var row = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("作者简介： ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              )
          ),
          Text(authorIntro,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ))
//         由于是异步请求，当summary为空时，就会很快的传给ExpandableText，因此不起作用
//          ExpandableText(
//            text: summary,
//            maxLines: 5,
//            style: TextStyle(fontSize: 16, color: Colors.black),
//          )
        ],
      ),
    );
    return Card(
      child: row,
    );
  }

  // 获取目录
  Widget getCatalog(SearchBook book) {
    var row = Container(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("目录： ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              )
          ),
          Text(catalog,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ))
//         由于是异步请求，当summary为空时，就会很快的传给ExpandableText，因此不起作用
//          ExpandableText(
//            text: summary,
//            maxLines: 5,
//            style: TextStyle(fontSize: 16, color: Colors.black),
//          )
        ],
      ),
    );
    return Card(
      child: row,
    );
  }


}
