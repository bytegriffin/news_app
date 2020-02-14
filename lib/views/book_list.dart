import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import '../models/book.dart';
import 'book_detail.dart';
import '../models/book_post_data.dart';

// 图书列表
class BookListPage extends StatefulWidget {
  final String title;
  final BookType bookType;
  BookListPage(this.title,this.bookType);

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> with AutomaticKeepAliveClientMixin{
  List<Book> bookList;
  int size = 0;
  int _pageNum = 0;
  var datas = [];

  @override
  bool get wantKeepAlive => true;

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    setState(() {
      this._pageNum = 1;
      _getMoreData(false);
    });
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    setState(() {
      this._pageNum += 1;
      _getMoreData(true);
    });
  }

  _getMoreData(bool _ifAdd){
    Map<String,dynamic> postData = getBookPostJsonData(widget.bookType,_pageNum);
    HttpClient.postBook(BOOK_URL, postData, (result) {
      if (mounted) {
        setState(() {
          bookList = BookList.fromJson(result).list;
          if (_ifAdd) {
            datas.addAll(bookList);
          } else {
            datas.clear();
            datas = bookList;
          }
          size = datas.length;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });
  }


  @override
  void initState(){
    super.initState();
    _addMoreData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getItem(Book book) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Container(
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
                      book.abstract,
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
      ),
    );

    return GestureDetector(
      child: Card(
        child: row,
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => BookDetailPage(book)
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.title),
      ),
      body: EasyRefresh(
        header: BallPulseHeader(),
        footer: BallPulseFooter(),
        onRefresh: _refreshData,
        onLoad: _addMoreData,
        child: new ListView.separated(
          itemCount: size,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return getItem(datas[index]);
          },
          separatorBuilder: (context, index) {
            return Container();
          },
        ),
      ),
    );
  }

}


