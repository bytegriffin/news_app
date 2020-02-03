import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/single_photo_view.dart';
import '../models/free_book.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import 'dart:convert';
import 'read_free_book.dart';

// 详细图书
class FreeBookDetailPage extends StatefulWidget {
  final String id;
  FreeBookDetailPage(this.id);
  @override
  _FreeBookDetailPageState createState() => _FreeBookDetailPageState();
}

class _FreeBookDetailPageState extends State<FreeBookDetailPage> {
  FreeBook book;
  String summary = "";
  String authorIntro = "";
  String catalog = "";
  List<FreeBook> bookList;
  String relatedText = "";

  @override
  void initState(){
    super.initState();
    HttpClient.get(FREE_BOOK_DETAIL_URL+widget.id, (result){
      Map<String,dynamic> subjects  = json.decode(result) as Map;
      if(mounted){
        setState(() {
          this.book = FreeBook.fromJson(subjects['data']);
          this.summary = book.desc;
          this.catalog =book.catalog;
          HttpClient.get(FREE_BOOK_RELATED_URL+book?.name??"", (result){
            Map<String,dynamic> subjects  = json.decode(result) as Map;
            if(mounted){
              setState(() {
                this.bookList = FreeBookList.fromJson(subjects).list;
                for(var b in bookList){
                  if(b.id == book.id){
                    bookList.remove(b);
                    break;
                  }
                }
                if(this.bookList != null && this.bookList.length != 0){
                  relatedText = " 相关图书  · · · · · · ";
                }
              });
            }
          },errorCallBack: (error){
            print(error);
          });
        });
      }
    },errorCallBack: (error){
      print(error);
    });
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                if(index == 0){
                  return Column(
                    children: <Widget>[
                      getItem(),
                      getSummary(),
                      getCatalog(),
                    ],
                  );
                }
                return null;
              })
          ),
          SliverToBoxAdapter(
            child: new Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      relatedText,
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: detailPageTitleTextColor),
                    ),
                  ],
                )
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 3.0,
              childAspectRatio: 7 / 13,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                var column = Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(bookList[index]?.cover??defaultCastImage,fit: BoxFit.cover,)
                    ),
                    Text(bookList[index]?.name??"",overflow: TextOverflow.ellipsis,maxLines: 2)
                  ],
                );
                var onclick = GestureDetector(
                  child: column,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => FreeBookDetailPage(bookList[index].id)
                    ));
                  },
                );
                return Container(
                    margin: EdgeInsets.only(left: 5,right: 5),
                    child: onclick
                );
              },
              childCount: bookList?.length??0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayOnSaleTime(){
    if(book?.time != null && book?.time != ''){
      return Container(
        width: 200,
        child: Text(
          "出版日期：${book?.time??book?.pubDate??""}",
          style: TextStyle(
              fontSize: 16,
              color: detailPagePropTextColor
          ),
        ),
      );
    }
    return Container();
  }

  Widget _displayWords(){
    if(book?.words != null && book?.words != '0'){
      return Container(
        width: 200,
        child: Text(
          "字数：${book?.words} 字",
          style: TextStyle(
              fontSize: 16,
              color: detailPagePropTextColor
          ),
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
                  book?.name??"",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: detailPagePropTextColor
                  ),
                ),
              ),
              Container(
                width: 230,
                child: Text(
                  '作者：${book?.author??""}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 16,
                      color: detailPagePropTextColor
                  ),
                ),
              ),
              Text(
                "ISBN：${book?.isbn??""}",
                style: TextStyle(
                    fontSize: 16,
                    color: detailPagePropTextColor
                ),
              ),
              Text(
                "价格：￥${book?.price??""}",
                style: TextStyle(
                    fontSize: 16,
                    color: detailPagePropTextColor
                ),
              ),
              _displayOnSaleTime(),
              _displayWords()
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
    return MaterialButton(
      minWidth: 110,
      colorBrightness: Brightness.dark,
      color: Colors.blue,
      textColor: Colors.white,
      child: Text('免费阅读'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ReadFreeBookPage(book.id, book.name)
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
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: column
    );
  }

}
