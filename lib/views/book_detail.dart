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
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../components/text_tag.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'book_provider_list.dart';
import 'author_book_list.dart';

// 图书详情页面
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
  bool isBundle = false;
  String providerUrl = "";
  String providerCount;
  List<String> authorList = List<String>();

  List<Book> relatedBooks=List<Book>.generate(0, (index){
    return Book("","",defaultBookImage,"", false);
  });

  List<String> tags=List<String>.generate(0, (index){
    return "";
  });

  _getDetail(){
    HttpClient.get(EBOOK_DETAIL_URL+widget.book.id, (result){
      if(mounted){
        setState(() {
          book.eBookId = widget.book.id;
          dom.Document doc = parse(result.toString());
          List<dom.Element> infoList = doc.querySelector("div.article-meta").children;
          for(dom.Element info in infoList){
            if(info.localName != "p"){
              continue;
            }
            String label = info.querySelector("p > span.label").text.trim();
            if(label == "作者"){
              List<dom.Element> aList = info.querySelector("span.labeled-text").children;
              for(dom.Element ele in aList){
                authorList.add(ele.text);
              }
              // book.authors = info.querySelector("span.labeled-text").text;
            } else if(label == "译者"){
              book.translators = info.querySelector("span.labeled-text").text;
            } else if(label == "类别"){
              book.kindNames = info.querySelector("span.labeled-text").text;
            } else if(label == "提供方"){
              dom.Element labelText = info.querySelector("span.labeled-text");
              book.provider = labelText.text;
              providerUrl = labelText.querySelector("a").attributes["href"];
            } else if(label == "出版社"){
              book.pubHouse = info.querySelector("span.labeled-text").text;
            } else if(label == "字数"){
              book.wordCount = info.querySelector("span.labeled-text").text;
            } else if(label == "ISBN"){
              book.isbn = info.querySelector("span.labeled-text").text;
            }
          }
          book.salesPrice = doc.querySelector("span.current-price-count").text;
          if(doc.querySelector("span.score") != null){
            book.rating = doc.querySelector("span.score").text;
          }
          dom.Element tag = doc.querySelector("div.bd > ul.tags");
          if(tag != null){
            List<dom.Element> tagList=tag.children;
            for(dom.Element e in tagList){
              tags.add(e.querySelector("a > span.tag-name").text);
            }
          }
          List<dom.Element> sectionList = doc.querySelector("section.article-profile-section").children;
          for(dom.Element info in sectionList){
            if(info.localName == "section"){
              String label = info.children[0].text.trim();
              if(label == "作品简介"){
                book.abstract = info.children[1].text;
                summary = book.abstract;
              } else if(label == "作品目录"){
                List<dom.Element> catalogList = info.querySelector("ol").children;
                for(dom.Element e in catalogList){
                  catalog += e.text +"\n";
                }
              } else if(label.contains("喜欢")){
                List<dom.Element> liList = info.children[1].children;
                for(dom.Element li in liList){
                  dom.Element a =  li.querySelector("div.cover > a");
                  List urlArray = a.attributes['href'].split("?")[0].split("/");
                  bool isBundle = urlArray[1]=="bundle" ? true : false;
                  String id = urlArray[2];
                  String cover = a.querySelector("img").attributes["src"];
                  String title = li.querySelector("div.info > h4.title").text;
                  String author = li.querySelector("div.info > div.author").text;
                  relatedBooks.add(Book(id, title, cover, author, isBundle));
                }
              }
            }else if(info.localName == "div"){ // 评论信息

            }
          }
          if(providerUrl == null || providerUrl == ""){
            dom.Element providerElement = doc.querySelector("div.author-info > h4 > a");
            if(providerElement != null){
              providerUrl = providerElement.attributes['href'];
            }
          }
          dom.Element providerCountElement = doc.querySelector("div.author-other-works > div > a");
          if(providerCountElement != null){
            providerCount = providerCountElement.text;
          }
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    book = widget.book;
    isBundle = book.isBundle;
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
              getTags(),
              getSummary(),
//              getAuthroIntro(),
//              Divider(height: 10.0,indent: 0.0,color: detailPageBGColor),
              getCatalog(),
              getRelatedBooks(),
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
      return Container(
        width: ScreenUtil().setWidth(400),
        child: Row(
          children: <Widget>[
            Text(
              '翻译：',
              style: TextStyle(
                  fontSize: 16,
                  color: detailPagePropTextColor
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AuthorBookListPage(book.translators)
                ));
              },
              child: Text(
                '${book?.translators??""}',
                overflow: TextOverflow.ellipsis, maxLines: 3,
                style: TextStyle(
                    fontSize: 16,
                    color: detailPagePropLinkColor
                ),
              ),
            )
          ],
        ),
      );
    }
    return Container();
  }

  Widget _displayPubHouse(){
    if(book.pubHouse != null && book.pubHouse != ''){
      return Text(
        '出版社：${book?.pubHouse??""}',
        style: TextStyle(
          fontSize: 16,
        ),
      );
    }
    return Container();
  }

  Widget _displayISBN(){
    if(book.isbn != null && book.isbn != ''){
      return Text(
        'ISBN：${book?.isbn??""}',
        style: TextStyle(
          fontSize: 16,
        ),
      );
    }
    return Container();
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

  List<Widget> _buildAuthorList(){
    List<Widget> list = List<Widget>();
    if(authorList == null || authorList.length == 0){
      return list;
    }
    for(String author in authorList){
      var widget = GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => AuthorBookListPage(author)
          ));
        },
        child: Text(
          '${author??""}',
          softWrap: true,
          overflow: TextOverflow.ellipsis, maxLines: 3,
          style: TextStyle(
              fontSize: 16,
              color: detailPagePropLinkColor
          ),
        ),
      );
      list.add(widget);
    }
    return list;
  }

  // 获取书籍简介
  Widget getItem() {
    var row = Container(
      constraints: BoxConstraints(
        minHeight: ScreenUtil().setHeight(400),
        maxHeight: ScreenUtil().setHeight(430),
      ),
      color: detailPageBGColor,
      //height: ScreenUtil().setHeight(440),
      margin: EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            //mainAxisSize:MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(400),
                child: Text(
                  book?.title??"",
                  overflow: TextOverflow.ellipsis, maxLines: 4,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: detailPagePropTextColor
                  ),
                ),
              ),
              _displayRating(),
              Container(
                width: ScreenUtil().setWidth(400),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      '作者：',
                      style: TextStyle(
                        fontSize: 16,
                        color: detailPagePropTextColor
                      ),
                    ),
                    Wrap(
                      children: _buildAuthorList(),
                    )
                  ],
                ),
              ),
              _displayTranslator(),
              _disoplayFreeReaderBtn()
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
            ],
          )
        ],
      ),
    );
    return row;
  }

  Widget _disoplayFreeReaderBtn(){
    if(book != null && isBundle){
      return Container();
    }
    String text = "免费试读";
    if(book.salesPrice == "免费"|| book.salesPrice == "￥0.00"|| book.salesPrice == "0"
        || book.salesPrice == "0.0" || book.salesPrice == "0.00"){
      text = "免费阅读";
    }
    return MaterialButton(
      minWidth: 110,
      colorBrightness: Brightness.dark,
      color: Colors.blue,
      textColor: Colors.white,
      child: new Text(text),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ReadEBookPage(book.eBookId, book.title)
        ));
      },
    );
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
          child: Text(
            "类别：${book?.kindNames??""}",
            overflow: TextOverflow.ellipsis, maxLines: 2,
            style: TextStyle(
                fontSize: 16,
            ),
          ),
        ),
        _displayPubHouse(),
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
        _displayISBN(),
          Container(height: 8),
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5.0),
        child: column
    );
  }

  // 获取书籍标签
  Widget getTags() {
    if(tags == null || tags.length==0){
      return Container();
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
              fontSize: 18.0,
              color: detailPageTitleTextColor
            )
          ),
          TextTags(list:this.tags, type: PageType.Book),
          Container(height: 8),
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
        Text(" 作品简介  · · · · · ·",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: detailPageTitleTextColor
          )
        ),
        ExpandableText(
          text: summary,
          maxLines: 5,
          style: TextStyle(fontSize: 16, ),
        ),
        Container(height: 8),
      ],
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5.0),
        child: column
    );
  }

  Widget getRelatedBooks(){
    if(relatedBooks == null || relatedBooks.length == 0){
      return Container();
    }
    List<Widget> list = List<Widget>();
    for(int index = 0; index < relatedBooks.length; index ++){
      var column = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(relatedBooks[index]?.cover??defaultCastImage,fit: BoxFit.cover, height: ScreenUtil().setHeight(260),width: ScreenUtil().setWidth(220),)
          ),
          Text(relatedBooks[index]?.title??"",overflow: TextOverflow.ellipsis,maxLines: 2),
        ],
      );
      var click = GestureDetector(
        child: Container(
          width: ScreenUtil().setWidth(220),
          height: ScreenUtil().setHeight(340),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: column,
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => BookDetailPage(relatedBooks[index])
          ));
        },
      );
      list.add(click);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 8),
        Container(
          child: Text(" 喜欢这本书的人也喜欢  · · · · · ·",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: detailPageTitleTextColor
              )
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: list,
            ),
          )
        ),
      ],
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
        Container(height: 8),
        Text(" 作者简介  · · · · · ·",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: detailPageTitleTextColor
          )
        ),
        ExpandableText(
          text: authorIntro,
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
              fontSize: 18.0,
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
