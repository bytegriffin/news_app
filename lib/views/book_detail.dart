import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../components/star_rating.dart';
import '../components/custom_sliver.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/single_photo_view.dart';
import '../models/book.dart';
import 'read_ebook.dart';

// 最新图书
class BookDetailPage extends StatefulWidget {
  final Book book;
  BookDetailPage(this.book);
  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  Book book;
  String summary = "";
  String authorIntro = "";
  String catalog = "";

  @override
  void initState(){
    book = widget.book;
    summary = book.abstract;
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
              getSummary(),
              Container(height:20.0,width:0.0)
            ],
          ),
        )
    );
  }

  Widget _displayRating(){
    if(book.rating != null){
     return  getRatingWidget(book?.rating??"0.0",detailPageBGColor,ratingTextColor);
    }
    return Container();
  }

  Widget _displayTranslator(){
    if(book.translators != null && book.translators != ''){
      return Text(
        '翻译：${book?.translators??""}',
        style: TextStyle(
            fontSize: 16,
            color: detailPagePropTextColor
        ),
      );
    }
    return Container();
  }

  Widget _displayOnSaleTime(){
    if(book.onSaleTime != null && book.onSaleTime != ''){
      return Text(
        '上架日期：${book?.onSaleTime??""}',
        style: TextStyle(
            fontSize: 16,
            color: detailPagePropTextColor
        ),
      );
    }
    return Container();
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
                width: ScreenUtil().setWidth(400),
                child: Text(
                  book?.title??"",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: detailPagePropTextColor
                  ),
                ),
              ),
              _displayRating(),
              Container(
                width: 230,
                child: Text(
                  '作者：${book?.authors??book?.origAuthors??""}',
                  style: TextStyle(
                      fontSize: 16,
                      color: detailPagePropTextColor
                  ),
                ),
              ),
              _displayTranslator(),
              Text(
                "字数：${book?.wordCount??""}",
                style: TextStyle(
                    fontSize: 16,
                    color: detailPagePropTextColor
                ),
              ),
              Container(
                width: 200,
                child: Text(
                  "类型：${book?.kindNames??""}",
                  style: TextStyle(
                      fontSize: 16,
                      color: detailPagePropTextColor
                  ),
                ),
              ),
              _displayOnSaleTime()
            ],
          ),
          Column(
            children: <Widget>[
              GestureDetector(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: getCachedImage(book?.cover??defaultBookImage, width: 110, height: 160)
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SinglePhotoView(
                        imageProvider:NetworkImage(book?.cover??defaultBookImage),
                        heroTag: 'simple',
                      )
                  ));
                },
              ),
              _disoplayFreeReaderBtn()
            ],
          )
        ],
      ),
    );
    return row;
  }

  Widget _disoplayFreeReaderBtn(){
    if(book.isBundle){
      return Container();
    }
    return MaterialButton(
      minWidth: 110,
      colorBrightness: Brightness.dark,
      color: Colors.blue,
      textColor: Colors.white,
      child: new Text('免费试读'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ReadEBookPage(book.eBookId, book.title)
        ));
      },
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
          style: TextStyle(fontSize: 16, ),
        )
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5.0),
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
        Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
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
          style: TextStyle(fontSize: 16,),
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
          text: catalog,
          maxLines: 5,
          style: TextStyle(fontSize: 16,),
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
