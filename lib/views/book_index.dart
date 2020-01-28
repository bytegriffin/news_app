import 'package:flutter/material.dart';
import 'package:news_app/views/top_book_list.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import '../util/image_util.dart';
import '../components/custom_card.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../models/book.dart';
import 'book_list.dart';
import '../models/book_post_data.dart';

// 阅读首页
class BookIndexPage extends StatefulWidget {
  @override
  _BookIndexPageState createState() => _BookIndexPageState();
}

class _BookIndexPageState extends State<BookIndexPage> with AutomaticKeepAliveClientMixin{

  List<Book> wxBookList= List.generate(6, (index) {
    return Book("",defaultBookImage,"");
  });

  List<Book> jsjBookList= List.generate(6, (index) {
    return Book("",defaultBookImage,"");
  });

  List<Book> jjglBookList= List.generate(6, (index) {
    return Book("",defaultBookImage,"");
  });

  List<Book> zzBookList= List.generate(6, (index) {
    return Book("",defaultBookImage,"");
  });

  List<Book> jyksBookList= List.generate(6, (index) {
    return Book("",defaultBookImage,"");
  });

  List<Book> mhhbBookList= List.generate(6, (index) {
    return Book("",defaultBookImage,"");
  });

  List<Book> yssjBookList= List.generate(6, (index) {
    return Book("",defaultBookImage,"");
  });

  @override
  bool get wantKeepAlive => true;

  _getBooks() {
    HttpClient.postBook(BOOK_URL, WXBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          wxBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(BOOK_URL, JSJBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          jsjBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(BOOK_URL, JJGLBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          jjglBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(BOOK_URL, ZZBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          zzBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(BOOK_URL, JYKSBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          jyksBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(BOOK_URL, MHHBBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          mhhbBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(BOOK_URL, YSSJBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          yssjBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });
  }

  @override
  void initState(){
    _getBooks();
    super.initState();
  }

  List<Widget> generateWenXueBookList() {
    return wxBookList.sublist(0,6).map((item) => getBookRowItem(context, item)).toList();
  }

  List<Widget> generateJSJBookList() {
    return jsjBookList.sublist(0,6).map((item) => getBookRowItem(context, item)).toList();
  }

  List<Widget> generateMHHBBookList() {
    return mhhbBookList.sublist(0,6).map((item) => getBookRowItem(context, item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildSwiper(),
            _buildButton(),
            buildRowBookCard1(context, "最新文学",BookListPage("最新文学",BookType.WenXue ),generateWenXueBookList()),
            buildRowBookCard1(context, "计算机与互联网",BookListPage("计算机与互联网",BookType.JiSuanJi ),generateJSJBookList()),
            buildRowBookCard2(context, "经济管理",BookListPage("经济管理",BookType.JingJiGuanLi),jjglBookList),
            buildRowBookCard3(context, "杂志",BookListPage("杂志",BookType.ZaZhi),zzBookList),
            buildRowBookCard2(context, "教育考试",BookListPage("教育考试",BookType.JiaoYuKaoShi),jyksBookList),
            buildRowBookCard1(context, "漫画绘本",BookListPage("漫画绘本",BookType.ManHuaHuiBen ),generateMHHBBookList()),
            buildRowBookCard3(context, "艺术设计",BookListPage("艺术设计",BookType.YiShuSheJi),yssjBookList),
          ],
        ),
      )
    );
  }

  Widget _buildSwiperItem(int index){
    if(index == 0){
      return TopBookListPage("推荐作品",recBookImage, TOP_HIGH_RATE_BOOK);
    }
    return BookListPage("热门英文书籍",BookType.ReMenYingWen);
  }

  Widget _buildSwiperImage(int index){
    if(index == 0){
      return Image.asset(recBookImage??"",fit: BoxFit.cover);
    }
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(hotEnglishBookImage??"",fit: BoxFit.cover),
        Positioned(
          top: 20,
          right: 30,
          child: Text("热门英文读物",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 34.0,color: Colors.white)),
        )

      ],
    );
  }

  Widget _buildSwiper(){
    var con =  Container(
        height: 120,
      width: MediaQuery.of(context).size.width/ 1.1,
        child: Swiper(
          pagination: new SwiperPagination(margin: new EdgeInsets.all(1.0)),
          itemCount: 2,
          autoplay: true,
          //autoplayDisableOnInteraction: false,
          itemBuilder: (c, i) {
            return GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: _buildSwiperImage(i),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => _buildSwiperItem(i)
                ));
              },
            );
          },
        ),
    );
    return Card(
      elevation: 4,
      child: con,
    );
  }

  //构建类别按钮
  Widget _buildButton(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(IconData(0xe65d, fontFamily: 'iconfont'),color: Colors.indigo,size: 30,),
                Text("新书榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopBookListPage("新书榜",topNewBookImage, TOP_NEW_BOOK)
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(IconData(0xe609, fontFamily: 'iconfont'),color: Colors.yellow,size: 30,),
                Text("畅销榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopBookListPage("畅销榜",topNewBookImage, TOP_HIGH_RATE_BOOK)
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(IconData(0xe604, fontFamily: 'iconfont'),color: Colors.purpleAccent,size: 30,),
                Text("长篇榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopBookListPage("长篇榜",topSalesBookImage, TOP_LONG_BOOK)
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(IconData(0xe605, fontFamily: 'iconfont'),color: Colors.brown,size: 30,),
                Text("中篇榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopBookListPage("中篇榜",topSalesBookImage, TOP_MIDDLE_BOOK)
              ));
            },
          )
        ],
      ),
    );
  }

}
