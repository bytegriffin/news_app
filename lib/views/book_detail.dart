import 'package:flutter/material.dart';
import '../models/search_book.dart';
import '../util/image_util.dart';
import '../components/star_rating.dart';
import '../components/text_tag.dart';
import '../components/custom_sliver.dart';
import '../net/httpclient.dart';
import '../net/http_router.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    HttpClient.get(getBookUrl+widget.id, (result){
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
          //title: Text(book?.title??""),
          backgroundColor: detailPageBGColor,
          elevation:0,
          actions: <Widget>[
            buildHomeNavButton(context)
          ],
        ),
        body: buildSliverList(
          Column(
            children: <Widget>[
              getItem(),
              getTags(),
              Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
              getSummary(),
              Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
              getAuthroIntro(),
              Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
              getCatalog(),
              Container(height:20.0,width:0.0)
            ],
          ),
        )
    );
  }

  Widget _displaySubtitle(){
    if (book?.subtitle != ""){
      return Container(
        width: 230,
        child: Text(
          "副标题：${book?.subtitle??""}",
          style: TextStyle(
            fontSize: 15,
            color:detailPagePropTextColor
          ),
        ),
      );
    }
    return Container(height:0.0,width:0.0);
  }

  // 获取书籍简介
  Widget getItem() {
    var row = Container(
      color: detailPageBGColor,
      height: ScreenUtil().setHeight(430),
      margin: EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 230,
                child: Text(
                  book?.title??"",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: detailPagePropTextColor
                  ),
                ),
              ),
              _displaySubtitle(),
              getRatingWidget(book?.rating??"0.0",detailPageBGColor,ratingTextColor),
              Container(
                width: 230,
                child: Text(
                  '作者：${book?.author??""}',
                  style: TextStyle(
                    fontSize: 16,
                    color: detailPagePropTextColor
                  ),
                ),
              ),
              Container(
                width: 230,
                child: Text(
                  "出版社：${book?.publisher??""} ",
                  style: TextStyle(
                    fontSize: 16,
                      color: detailPagePropTextColor
                  ),
                ),
              ),
              Text(
                "出版时间：${book?.pubDate??""}",
                style: TextStyle(
                  fontSize: 16,
                  color: detailPagePropTextColor
                ),
              ),
              Text(
                "价格：${book?.price??""}",
                style: TextStyle(
                  fontSize: 16,
                  color: detailPagePropTextColor
                ),
              ),
            ],
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: getCachedImage(book?.image??defaultBookImage, width: 110, height: 160)
          ),
        ],
      ),
    );
    return row;
  }

  // 获取书籍标签
  Widget getTags() {
    if(tags == null){
      return Container(height:0.0,width:0.0);
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(" 标签  · · · · · ·",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
              )
          ),
          TextTags(list:this.tags),
      ],
      ),
    );
  }

  // 获取书籍内容概要
  Widget getSummary() {
    if(summary == ""){
      return Container(height:0.0,width:0.0);
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" 摘要  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: summary,
          maxLines: 5,
          style: TextStyle(fontSize: 16, color: Colors.black),
        )
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(4.0),
        child: column
    );
  }

  // 获取作者简介
  Widget getAuthroIntro() {
    if(authorIntro == ""){
      return Container(height:0.0,width:0.0);
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" 作者简介  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: summary,
          maxLines: 5,
          style: TextStyle(fontSize: 16, color: Colors.black),
        )
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(4.0),
        child: column
    );
  }

  // 获取目录
  Widget getCatalog() {
    if(catalog == ""){
      return Container(height:0.0,width:0.0);
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" 目录  · · · · · ·",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: detailPageTitleTextColor
            )
        ),
        ExpandableText(
          text: summary,
          maxLines: 5,
          style: TextStyle(fontSize: 16, color: Colors.black),
        )
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(4.0),
        child: column
    );
  }


}
