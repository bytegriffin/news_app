import 'package:flutter/cupertino.dart';
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
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import '../models/top_book.dart';

// 阅读首页
class BookIndexPage extends StatefulWidget {
  @override
  _BookIndexPageState createState() => _BookIndexPageState();
}

class _BookIndexPageState extends State<BookIndexPage> with AutomaticKeepAliveClientMixin{

  List<Book> wxBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<Book> jsjBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<Book> jjglBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<Book> zzBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<Book> jyksBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<Book> mhhbBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<Book> yssjBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<Book> zxtjBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<Book> xsBookList= List.generate(6, (index) {
    return Book("","",defaultBookImage,"", false);
  });

  List<TopicBooks> dynamicBookList= List.generate(0, (index) {
    return TopicBooks("", null);
  });

  List<TopBook> womenBookList= List.generate(10, (index) {
    return TopBook("", "", "", "", "", "");
  });

  List<TopBook> scienceBookList= List.generate(10, (index) {
    return TopBook("", "", "", "", "", "");
  });

  List<TopBook> mysteryBookList= List.generate(10, (index) {
    return TopBook("", "", "", "", "", "");
  });

  @override
  bool get wantKeepAlive => true;
  bool showToTopBtn = false;
  ScrollController _controller = new ScrollController();

  _getBookList(){
    // 最新推荐
    HttpClient.getBook("https://read.douban.com/ebooks/", (result){
      if(mounted){
        setState(() {
          zxtjBookList.clear();
          dom.Document doc = parse(result.toString());
          List<dom.Element> sectionList= doc.querySelector("div.main > article").children;
          List<dom.Element> ulList =  sectionList[3].querySelector("div.bd > div > div").children;
          for(dom.Element ul in ulList){
            for(dom.Element li in ul.children){
              dom.Element a =  li.querySelector("div > div.cover > a");
              List urlArray = a.attributes['href'].split("?")[0].split("/");
              bool isBundle = urlArray[1]=="bundle" ? true : false;
              String id = urlArray[2];
              String cover = a.querySelector("img").attributes["data-src"];
              String title = li.querySelector("div > div.info > h4.title").text;
              String author = li.querySelector("div > div.info > div.author").text;
              zxtjBookList.add(Book(id, title, cover, author, isBundle));
            }
          }
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    // 女性排行榜
    HttpClient.getBook(TOP_WOMEN_BOOK, (result){
      if(mounted){
        setState(() {
          this.womenBookList = TopBookList.fromJson(result).list;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    // 悬疑排行榜
    HttpClient.getBook(TOP_MYSTERY_BOOK, (result){
      if(mounted){
        setState(() {
          this.mysteryBookList = TopBookList.fromJson(result).list;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    // 幻想排行榜
    HttpClient.getBook(TOP_SCIENCE_BOOK, (result){
      if(mounted){
        setState(() {
          this.scienceBookList = TopBookList.fromJson(result).list;
        });
      }
    },errorCallBack: (error){
      print(error);
    });

    // 动态图书列表
    HttpClient.getBook("https://read.douban.com/j/ebooks/topics_sections", (result){
      setState(() {
        dom.Document doc = parse(result["html"].toString());
        List<dom.Element> sectionList = doc.getElementsByTagName("section");
        for(dom.Element section in sectionList){
          String label = section.querySelector("div.hd > h3").text;
          if(label.contains("新书速递") || label.contains("超低特价")){
            continue;
          }
          _generateDynamicBookList(label, section);
        }
      });
    },errorCallBack: (error){
      print(error);
    });
  }

  _generateDynamicBookList(String label, dom.Element section){
    List<Book> newBookList = List<Book>();
    List<dom.Element> ulList =  section.querySelector("div.bd > div > div").children;
    for(dom.Element ul in ulList){
      for(dom.Element li in ul.children){
        dom.Element a =  li.querySelector("div > div.cover > a");
        List urlArray = a.attributes['href'].split("?")[0].split("/");
        bool isBundle = urlArray[1]=="bundle" ? true : false;
        String id = urlArray[2];
        String cover = a.querySelector("img").attributes["src"];
        String title = li.querySelector("div > div.info > h4.title").text;
        String author = li.querySelector("div > div.info > div.author").text;
        newBookList.add(Book(id, title, cover, author, isBundle));
      }
    }
    dynamicBookList.add(TopicBooks(label, newBookList));
  }

  _getBooks() {
    HttpClient.postBook(EBOOK_LIST_URL, WXBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          wxBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(EBOOK_LIST_URL, JSJBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          jsjBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(EBOOK_LIST_URL, JJGLBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          jjglBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(EBOOK_LIST_URL, ZZBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          zzBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(EBOOK_LIST_URL, JYKSBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          jyksBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(EBOOK_LIST_URL, MHHBBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          mhhbBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(EBOOK_LIST_URL, XSBookPostData(1).toJson(), (result) {
      if (mounted) {
        setState(() {
          xsBookList = BookList.fromJson(result).list;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });

    HttpClient.postBook(EBOOK_LIST_URL, YSSJBookPostData(1).toJson(), (result) {
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
    _getBookList();
    _getBooks();
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
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  List<Widget> generateZXTJBookList() {
    int size = 6;
    if(zxtjBookList.length < 6){
      size = zxtjBookList.length;
    }
    return zxtjBookList.sublist(0,size).map((item) => getBookRowItem(context, item)).toList();
  }

  //构建排行榜单
  List<Widget> _buildTopBookWidget(){
    List<Widget> list = List<Widget>();
    list.add(Container(width: 10,));
    list.add(buildTopWidget(context, "女性榜单", womenBookList));
    list.add(buildTopWidget(context, "悬疑榜单", mysteryBookList));
    list.add(buildTopWidget(context, "幻想榜单", scienceBookList));
    list.add(Container(width: 10,));
    return list;
  }

  List<Widget> _buildDynamicWidget(){
    List<Widget> list = List<Widget>();
    for(TopicBooks tb in dynamicBookList){
      List<Book> bookList = tb.list;
      int size = bookList.length > 6 ? 6 : bookList.length;
      List<Widget> displayList = bookList.sublist(0,size).map((item) => getBookRowItem(context, item)).toList();
      list.add(buildRowBookCard4(context, tb.label ,displayList));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        controller: _controller,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildSwiper(),
                _buildButton(),
                buildRowBookCard4(context, "最新推荐",generateZXTJBookList()),
                buildScrollRow(_buildTopBookWidget()),
                Container(height: 10,),
              ],
            ),
            Column(
              children: _buildDynamicWidget(),
            ),
            Column(
              children: <Widget>[
                buildRowBookCard1(context, "最新文学",BookListPage("最新文学",BookType.WenXue ),generateWenXueBookList()),
                buildRowBookCard1(context, "计算机与互联网",BookListPage("计算机与互联网",BookType.JiSuanJi ),generateJSJBookList()),
                buildRowBookCard2(context, "经济管理",BookListPage("经济管理",BookType.JingJiGuanLi),jjglBookList),
                Container(height: 20,),
                buildRowBookCard3(context, "杂志",BookListPage("杂志",BookType.ZaZhi),zzBookList),
                Container(height: 20,),
                buildRowBookCard2(context, "教育考试",BookListPage("教育考试",BookType.JiaoYuKaoShi),jyksBookList),
                Container(height: 20,),
                buildRowBookCard1(context, "漫画绘本",BookListPage("漫画绘本",BookType.ManHuaHuiBen ),generateMHHBBookList()),
                buildRowBookCard2(context, "小说",BookListPage("小说",BookType.XiaoShuo),xsBookList),
                Container(height: 20,),
                buildRowBookCard3(context, "艺术设计",BookListPage("艺术设计",BookType.YiShuSheJi),yssjBookList),
              ],
            ),
          ],
        ),
      ),
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

  Widget _buildSwiperItem(int index){
    if(index == 0){
      return TopBookListPage("推荐作品",recBookImage, TOP_HIGH_RATE_BOOK);
    }
    return BookListPage("热门英文书籍",BookType.ReMenYingWen);
  }

  Widget _buildSwiperImage(int index){
    if(index == 0){
      return Image.asset(recBookImage,fit: BoxFit.cover);
    }
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(hotEnglishBookImage,fit: BoxFit.cover),
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
                Icon(IconData(0xe606, fontFamily: 'iconfont'),color: Colors.lightBlue,size: 30,),
                Text("免费区")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => BookListPage("免费区",BookType.MianFei)
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(IconData(0xe605, fontFamily: 'iconfont'),color: Colors.brown,size: 30,),
                Text("历史榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopBookListPage("历史榜",topSalesBookImage, TOP_HISTORY_BOOK)
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(IconData(0xe8ac, fontFamily: 'iconfont'),color: Colors.deepOrangeAccent,size: 30,),
                Text("文艺榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopBookListPage("文艺榜",topSalesBookImage, TOP_LITERARY_BOOK)
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(IconData(0xe604, fontFamily: 'iconfont'),color: Colors.purple,size: 30,),
                Text("套装榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopBookListPage("套装榜",topSalesBookImage, TOP_BUNDLE_BOOK)
              ));
            },
          )
        ],
      ),
    );
  }

}
