import 'package:flutter/material.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import '../models/book.dart';
import '../net/httpclient.dart';
import '../models/book_post_data.dart';
import 'book_detail.dart';
import 'bundle_book_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 某作者的图书列表页
class AuthorBookListPage extends StatefulWidget {
  final String author;
  AuthorBookListPage(this.author);
  @override
  _AuthorBookListPageState createState() => _AuthorBookListPageState();
}

class _AuthorBookListPageState extends State<AuthorBookListPage> {
  int total=0;
  int size = 0;
  int _pageNum = 0;
  var datas = [];
  bool showToTopBtn = false;
  ScrollController _controller = new ScrollController();

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
    Map<String,dynamic> postData = getAuthorBookPostJsonData(widget.author, _pageNum);
    HttpClient.postBook("https://read.douban.com/j/search_v2", postData, (result) {
      setState(() {
        BookList bookListObj = BookList.fromJson(result);
        total = bookListObj.total;
        List<Book> bookList = bookListObj.list;
        if (_ifAdd) {
          datas.addAll(bookList);
        } else {
          datas.clear();
          datas = bookList;
        }
        size = datas.length;
      });
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    super.initState();
    _addMoreData();
    _controller.addListener(() {
      if (_controller.offset < 2000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 2000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
        //title: Text(book?.title??""),
        backgroundColor: detailPageBGColor,
        elevation:0,
        actions: <Widget>[
          buildHomeNavButton(context)
        ],
      ),
      body: getPageTopic(),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          //返回到顶部时执行动画
          _controller.animateTo(.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease
          );
        }
      ),
    );
  }

  // 获取提供方简介
  Widget getPageTopic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 3.0,
          runSpacing: 3.0,
          children: <Widget>[
            Container(width: 5,),
            Icon(Icons.search),
            Text(
              "包含",
              softWrap: true,
              //overflow: TextOverflow.ellipsis, maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
              ),
            ),
            Text(
              "${widget.author}",
              softWrap: true,
              //overflow: TextOverflow.ellipsis, maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                  color: detailPagePropLinkColor
              ),
            ),
            Text(
              " 的搜索结果",
              softWrap: true,
              //overflow: TextOverflow.ellipsis, maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
              ),
            ),
            Text(
              "（$total）",
              softWrap: true,
              //overflow: TextOverflow.ellipsis, maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        Expanded(
          child: EasyRefresh(
            header: BallPulseHeader(),
            footer: BallPulseFooter(),
            onRefresh: _refreshData,
            onLoad: _addMoreData,
            child: new ListView.separated(
              controller: _controller,
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
        )
      ],
    );
  }

  Widget _displayTranlator(Book book){
    if(book.translators != null){
      return Text(
        '译者：${book.translators ?? ""}',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }
    return Container();
  }

  Widget _displayAuthor(Book book){
    String authors = book.authors ?? book.origAuthors;
    if(authors.contains(widget.author)){
      return Wrap(
        children: <Widget>[
          Text(
            '作者：',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Container(
            child: Text(
              '${book.authors ?? book.origAuthors ?? ""}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent
              )
            ),
          )
        ],
      );
    }
    return Text(
      '作者：${authors ?? ""}',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget getItem(Book book) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(300),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(book.cover),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8.0),
              height: ScreenUtil().setHeight(300),
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
                  _displayAuthor(book),
                  _displayTranlator(book),
                  Text(
                    book.abstract,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w600,),
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
        visit(book);
      },
    );
  }

  visit(Book book){
    if(book.isBundle){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => BundleBookDetailPage(book)
      ));
    }else {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => BookDetailPage(book)
      ));
    }
  }
}
