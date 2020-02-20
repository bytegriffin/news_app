import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/image_util.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import '../models/book.dart';
import '../net/httpclient.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'bundle_book_detail.dart';
import 'book_detail.dart';

// 图书提供方详情页
class BookProviderListPage extends StatefulWidget {
  final String url;
  final String count;
  BookProviderListPage(this.url,this.count);
  @override
  _BookProviderListPageState createState() => _BookProviderListPageState();
}

class _BookProviderListPageState extends State<BookProviderListPage> {
  String logo = defaultBookImage;
  String name = "";
  String desc = "";
  int size = 0;
  int _pageNum = 0;
  var datas = [];
  bool showToTopBtn = false;
  ScrollController _controller = new ScrollController();

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    setState(() {
      this._pageNum = 0;
      _getMoreData(false);
    });
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    setState(() {
      this._pageNum += 30;
      _getMoreData(true);
    });
  }

  _getMoreData(bool _ifAdd){
    HttpClient.get("https://read.douban.com"+widget.url+"?sort=new&cat=all&start="+_pageNum.toString(), (result){
      if (mounted) {
        setState(() {
          List<Book> bookList = List<Book>();
          dom.Document doc = parse(result.toString());
          logo = doc.querySelector("div.avatar > img").attributes['src'];
          name = doc.querySelector("div.cm-body").text;
          desc = doc.querySelector("div.provider-intro").text;
          List<dom.Element> ulList = doc.querySelector("ul.list-col").children;
          for(dom.Element li in ulList){
            dom.Element a =  li.querySelector("div.cover > a");
            List urlArray = a.attributes['href'].split("/");
            bool isBundle = urlArray[1]=="bundle" ? true : false;
            String id = urlArray[2];
            String cover = a.querySelector("img").attributes["src"];
            String title = li.querySelector("div.info > h4.title").text;
            String author = li.querySelector("div.info > div.author > span.orig-author").text;
            Book book = Book(id, title, cover, author, isBundle);
            dom.Element transEle = li.querySelector("div.info > div.author > span.translator");
            if(transEle != null){
              book.translators = transEle.text;
            }
            book.salesPrice = li.querySelector("span.price-tag").text;
            book.abstract = li.querySelector("div.rec-intro").text;
            bookList.add(book);
          }
          if (_ifAdd) {
            datas.addAll(bookList);
          } else {
            datas.clear();
            datas = bookList;
          }
          size = datas.length;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }


  @override
  void initState(){
    super.initState();
    _refreshData();
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

  Widget _displayBookCount(){
    if(widget.count != null && widget.count != ""){
      return Text(
        "作品数量（${widget.count}）",
        overflow: TextOverflow.ellipsis, maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
        ),
      );
    }
    return Container();
  }

  // 获取提供方简介
  Widget getPageTopic() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10,right:10,top: 5,bottom: 0),
              child: Image.network(logo, width: 80, height: 80)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(530),
                  child: Text(
                    name??"",
                    overflow: TextOverflow.ellipsis, maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                _displayBookCount()
              ],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 10,right: 10,top:3),
          child: ExpansionTile(
            title: Text('详细介绍'),
            //leading: Icon(Icons.ac_unit),
            backgroundColor: Colors.white12,
            children: <Widget>[
              ListTile(
                title: Text(desc),
                // subtitle: Text('subtitle'),
              ),
            ],
            initiallyExpanded: false, //打开状态  不写默认false闭合状态
          ),
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
                    Text(
                      '作者：${book.authors ?? ""}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
