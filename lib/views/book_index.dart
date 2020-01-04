import 'package:flutter/material.dart';
import 'package:news_app/views/book_list.dart';
import '../models/top_book.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import '../util/imageutil.dart';
import '../components/row_card.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// 阅读首页
class BookIndexPage extends StatefulWidget {
  @override
  _BookIndexPageState createState() => _BookIndexPageState();
}

class _BookIndexPageState extends State<BookIndexPage> with AutomaticKeepAliveClientMixin{
  TopBookList newTopBookList;
  TopBookList salesTopBookList;
  TopBookList highRateTopBookList;

  List<TopBook> newBookList= List.generate(4, (index) {
    return TopBook("","$index","","",defaultBookImage,"内容加载中。。。","0字","");
  });
  List<TopBook> salesBookList= List.generate(4, (index) {
    return TopBook("","$index","","",defaultBookImage,"内容加载中。。。","0字","");
  });
  List<TopBook> hightRateBookList= List.generate(4, (index) {
    return TopBook("","$index","","",defaultBookImage,"内容加载中。。。","0字","");
  });

  @override
  bool get wantKeepAlive => true;

  _getBooks(){
    HttpClient.get(TOP_NEW_BOOK, (result){
      if(mounted){
        setState(() {
          this.newTopBookList = TopBookList.fromJson(result);
          this.newBookList = this.newTopBookList.list;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    HttpClient.get(HIGH_RATE_BOOK, (result){
      if(mounted){
        setState(() {
          this.highRateTopBookList = TopBookList.fromJson(result);
          this.hightRateBookList = this.highRateTopBookList.list;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    HttpClient.get(TOP_SALE_BOOK, (result){
      if(mounted){
        setState(() {
          this.salesTopBookList = TopBookList.fromJson(result);
          this.salesBookList = this.salesTopBookList.list;
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
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            buildSwiper(),
            buildRowBookCard(context, "最新作品",BookListPage("最新作品",topNewBookImage,newBookList),newBookList),
            buildRowBookCard(context, "畅销作品",BookListPage("畅销作品",topSalesBookImage, salesBookList),salesBookList),
          ],
        ),
      )
    );
  }

  Widget buildSwiper(){
    return Container(
      height: 120,
        width: 420,
        child: Swiper(
          //autoplayDisableOnInteraction: false,
          itemBuilder: (c, i) {
            return GestureDetector(
              child: Image.asset(recBookImage,fit: BoxFit.cover),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BookListPage("推荐作品",recBookImage, hightRateBookList)
                ));
              },
            );
          },
          //pagination: new SwiperPagination(margin: new EdgeInsets.all(1.0)),
          itemCount: 1,
        ),
    );
  }

}
