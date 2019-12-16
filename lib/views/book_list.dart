import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/book.dart';
import '../util/imageutil.dart';

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {

  ScrollController _scrollController = ScrollController();
  BookList bookList;
  int size = 0;

  _getMoreData(){
    HttpClient.request(TECH_BOOK).then((res){
      setState(() {
        this.bookList = BookList.fromJson(res.data);
        this.size = bookList.books.length;
      });
    });
  }

  @override
  void initState(){
    super.initState();
    _getMoreData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.separated(
        itemCount: size,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return Container(
            child: getItem(bookList.books[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget getItem(Book book) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: getCachedImage(book.image)
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                height: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      book.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      "副标题：${book.subtitle}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      '作者：${book.author}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                        "出版社：${book.publisher} "
                    ),
                    Text(
                        "出版时间：${book.pubdate}   价格：${book.price}"
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

}


