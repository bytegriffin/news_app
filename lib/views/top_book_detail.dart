import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../components/star_rating.dart';
import '../components/text_tag.dart';
import '../components/custom_sliver.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/single_photo_view.dart';
import '../models/top_book.dart';
import 'read_ebook.dart';

// （长篇榜/中篇榜）书籍排行榜详情页（不包括新书榜/畅销榜/推荐作品）
class TopBookDetailPage extends StatefulWidget {
  final TopBook topBook;
  TopBookDetailPage(this.topBook);
  @override
  _TopBookDetailPageState createState() => _TopBookDetailPageState();
}

class _TopBookDetailPageState extends State<TopBookDetailPage> {
  TopBook book;
  String summary = "";
  String authorIntro = "";
  String catalog = "";

  @override
  void initState(){
    book = widget.topBook;
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
              getTags(),
              getSummary(),
              Container(height:20.0,width:0.0)
            ],
          ),
        )
    );
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
              getRatingWidget(book?.rating??"0.0",detailPageBGColor,ratingTextColor),
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
              Text(
                "字数：${book?.wordCount??""}",
                style: TextStyle(
                    fontSize: 16,
                    color: detailPagePropTextColor
                ),
              ),
              Text(
                "类型：${book?.kindNames??""}",
                style: TextStyle(
                    fontSize: 16,
                    color: detailPagePropTextColor
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              GestureDetector(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: getCachedImage(book?.image??defaultBookImage, width: 110, height: 160)
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SinglePhotoView(
                        imageProvider:NetworkImage(book?.image??defaultBookImage),
                        heroTag: 'simple',
                      )
                  ));
                },
              ),
              MaterialButton(
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
              )
            ],
          )
        ],
      ),
    );
    return row;
  }

  // 获取书籍标签
  Widget getTags() {
    if(book.tags == null){
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
          TextTags(list:this.book.tags),
          Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
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
          style: TextStyle(fontSize: 16, ),
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


}
