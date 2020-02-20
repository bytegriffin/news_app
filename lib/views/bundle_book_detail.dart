import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../components/custom_sliver.dart';
import '../components/expandable_text.dart';
import '../util/color_util.dart';
import '../components/nav_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../models/book.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'book_provider_list.dart';
import 'book_detail.dart';
import '../components/over_scroll_behavior.dart';
import '../components/multi_photo_view.dart';
import 'author_book_list.dart';

// 套装书详情页面
class BundleBookDetailPage extends StatefulWidget {
  final Book book;
  BundleBookDetailPage(this.book);
  @override
  _BundleBookDetailPageState createState() => _BundleBookDetailPageState();
}

class _BundleBookDetailPageState extends State<BundleBookDetailPage> {
  Book book;
  String providerUrl = "";
  String providerCount;
  List<String> imageList = List<String>();
  String bundleTopic = "";
  List<Book> bundleBooks=List<Book>();

  _getDetail(){
    HttpClient.get(BUNDLE_EBOOK_DETAIL_URL+widget.book.id, (result){
      setState(() {
        book.bundleId = widget.book.id;
        dom.Document doc = parse(result.toString());
        List<dom.Element> infoList = doc.querySelector("div.bundle-covers").children;
        for(dom.Element info in infoList){
          dom.Element img = info.querySelector("img");
          if(img == null){
            continue;
          }
          String src = img.attributes['src']??img.attributes['data-src'];
          imageList.add(src);
        }
        book.title = doc.querySelector("div.title > h1").text;
        book.authors = doc.querySelector("div.author > span > a").text;

        dom.Element kindsElement = doc.querySelector("div.kinds");
        if(kindsElement != null){
          List<dom.Element> kinds = kindsElement.children;
          String kindNames = "";
          for (int i=1; i < kinds.length; i++) {
            kindNames += kinds[i].text;
            if(kinds.length - i > 1){
              kindNames = kindNames + " / ";
            }
          }
          book.kindNames = kindNames;
        }
        dom.Element provider = doc.querySelector("div.provider > a");
        if(provider != null){
          book.provider = provider.text;
        }
        dom.Element wordCount = doc.querySelector("div.length-info > span");
        if(wordCount != null){
          book.wordCount = wordCount.text;
        }
        dom.Element abstract = doc.querySelector("section.section-abstract > div.bd");
        if(wordCount != null){
          book.abstract = abstract.text;
        }
        dom.Element priceElement = doc.querySelector("span.price-tag > span.prices-counts > span");
        if(priceElement != null){
          book.salesPrice = priceElement.text;
        }
        dom.Element score = doc.querySelector("div.rating.rating-light > span.score");
        if(score != null){
          book.rating = score.text;
        }
        dom.Element providerElement = doc.querySelector("div.provider > a");
        if(providerElement != null){
          providerUrl = providerElement.attributes['href'];
        }
        dom.Element bundle = doc.querySelector("section.section-works-list");
        if(bundle != null){
          List<dom.Element> bundleList = bundle.children;
          bundleTopic = bundleList[0].querySelector("div.hd > h3").text;
          List<dom.Element> ulList = bundleList[1].querySelector("div.bd > ul.ebook-list").children;
          for(dom.Element li in ulList){
            dom.Element a =  li.querySelector("div.cover > a");
            List urlArray = a.attributes['href'].split("/");
            bool isBundle = urlArray[1]=="bundle" ? true : false;
            String id = urlArray[2];
            String cover = a.querySelector("img").attributes["src"]??a.querySelector("img").attributes["data-src"];
            List<dom.Element> infoList = li.querySelector("div.info").children;
            String author = "";
            String kindNames = "";
            String score = "";
            String abstract = "";
            String subtitle = "";
            for(dom.Element info in infoList){
              if(info.localName == "p"){
                String name = info.querySelector("span > span.label").text;
                if(name == "作者"){
                  author = info.querySelector("span > span.labeled-text").text;
                } else if(name == "类别"){
                  kindNames = info.querySelector("span > span.labeled-text").text;
                }
              } else if(info.localName == "div"){
                if(info.text.contains("（更多）") || info.text.contains("(更多)")){
                  abstract = info.text.replaceAll("（更多）", "").replaceAll("(更多)", "");
                }
                dom.Element sub = info.querySelector("p.subtitle");
                if(sub != null){
                  subtitle = sub.text;
                }
                dom.Element desc = info.querySelector("div.article-desc-brief");
                if(desc != null){
                  abstract = desc.text;
                }

              }
            }
            String title = li.querySelector("div.info > div.title > a").text;
            Book book = Book(id, title, cover, author, isBundle);
            book.kindNames = kindNames;
            book.authors = author;
            book.rating = score;
            book.abstract = abstract;
            book.subTitle = subtitle;
            bundleBooks.add(book);
          }
        }
      });
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    book = widget.book;
    _getDetail();
    super.initState();
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
        body: buildSliverList(
          Column(
            children: <Widget>[
              getItem(),
              getInfos(),
              getSummary(),
              getBundleBooks(),
              Container(height:20.0,width:0.0)
            ],
          ),
        )
    );
  }

  Widget _displayProvider(){
    if(book.provider != null && book.provider != ''){
      return Row(
        children: <Widget>[
          Text(
            '提供方：',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => BookProviderListPage(providerUrl, providerCount)
              ));
            },
            child: Text(
              '${book?.provider??""} >>',
              style: TextStyle(
                  fontSize: 16,
                  color: detailPagePropLinkColor
              ),
            ),
          )
        ],
      );
    }
    return Container();
  }

  Widget _buildSwiper(){
    var con =  Container(
      height: 120,
      //width: MediaQuery.of(context).size.width/ 1.1,
      child: Swiper(
        itemWidth: 120.0,
        layout: SwiperLayout.STACK,
        //pagination: new SwiperPagination(margin: new EdgeInsets.all(1.0)),
        itemCount: _getBookCovers().length,
        autoplay: true,
        //autoplayDisableOnInteraction: true,
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (c, i) {
          return GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: _getBookCovers()[i],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MultiPhotoView(
                    images:imageList,
                    index: i,
                    heroTag: i.toString(),
                  )
              ));
            },
          );
        },
      ),
    );
    return con;
  }

  List<Widget> _getBookCovers(){
    if(imageList == null || imageList.length == 0){
      return List.generate(1, (index) {
        return Image.network(book?.cover??defaultBookImage,height: 100,);
      });
    }
    List<Image> list = List<Image>();
    for(int i=0; i<imageList.length; i++){
      list.add(Image.network(imageList[i],height: 100,));
    }
    return list;
  }

  // 获取书籍简介
  Widget getItem() {
    var row = Container(
      constraints: BoxConstraints(
        minHeight: ScreenUtil().setHeight(400),
        maxHeight: ScreenUtil().setHeight(420),
      ),
     // color: detailPageBGColor,
      //height: ScreenUtil().setHeight(440),
      margin: EdgeInsets.all(0.0),
      child: _buildSwiper(),
    );
    return row;
  }

  // 获取书籍内容概要
  Widget getInfos() {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" 详情  · · · · · ·",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: detailPageTitleTextColor
          )
        ),
        Container(
          child: Row(
            children: <Widget>[
              Text(
                '作者：',
                style: TextStyle(
                    fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AuthorBookListPage(book.authors)
                  ));
                },
                child: Text(
                  '${book?.authors??book.origAuthors??""}',
                  overflow: TextOverflow.ellipsis, maxLines: 3,
                  style: TextStyle(
                      fontSize: 16,
                      color: detailPagePropLinkColor
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Text(
            "类别：${book?.kindNames??""}",
            overflow: TextOverflow.ellipsis, maxLines: 2,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        _displayProvider(),
        Text(
          "字数：${book?.wordCount??""}",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          "价格：${book?.salesPrice??""}",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(5.0),
          child: column
        ),
        Container(height: 8),
      ],
    );
  }

  // 获取书籍内容概要
  Widget getSummary() {
    if(book.abstract == null || book.abstract == ""){
      return Container();
    }
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" 作品简介  · · · · · ·",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: detailPageTitleTextColor
          )
        ),
        ExpandableText(
          text: book?.abstract??"",
          maxLines: 5,
          style: TextStyle(fontSize: 16, ),
        ),
      ],
    );
    return Column(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(5.0),
            child: column
        ),
        Container(height: 8,),
      ],
    );
  }

  Widget getBundleBooks() {
    if(bundleBooks == null || bundleBooks.length == 0){
      return Container();
    }
    return ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("  $bundleTopic  · · · · · ·",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: detailPageTitleTextColor
                )
              ),
            ),
            Column(
              children: bundleBooks.map((b) => getBundleBookItem(b)).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget getBundleBookItem(Book book){
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(book?.cover??defaultBookImage),
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
                    '类别：${book.kindNames??""}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    book.abstract,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle( fontWeight: FontWeight.w600,),
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

}
