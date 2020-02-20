import 'book_kind.dart';

class Book {
  String id;//id值，用作查询使用
  String title;//书名
  String subTitle;// 子书名
  String cover;//图片
  String eBookId;//ebook url
  String bundleId;//套装书id
  bool isBundle;//是否是套装
  String salesPrice;//售价
  String authors;//作家
  String origAuthors;//原作家
  String translators;//翻译
  String abstract;//摘要
  String wordCount;//字数
  List<BookKind> kinds;//种类
  String kindNames;//类型名称
  String onSaleTime;//上架日期
  String rating;//评分
  String pubHouse;//出版社
  String provider;//提供方
  String isbn;// ISBN

  Book(this.id, this.title,this.cover,this.authors, this.isBundle);

  Book.fromJson(Map<String, dynamic> json){
    this.id = json['id'].toString();
    this.title = json['title'];
    this.cover = json['cover'];
    this.isBundle = json['isBundle'];
    if(json['url'] != null){
      this.eBookId = json['url'].toString().replaceAll("/ebook/", "").replaceAll("/", "");
    }
    if(json['onSaleTime'] != null){
      this.onSaleTime = json['onSaleTime'];
    }
    if(json['averageRating'] != null){
      this.rating = (json['averageRating'] * 2).toString();
    }
    this.abstract = json['abstract'];
    this.wordCount = json['wordCount'].toString() + " " + json['wordCountUnit'].toString();
    if(json['salesPrice'] != null){
      this.salesPrice = (json['salesPrice'] / 100).toString();
    }
    List authors = json['author'];
    if(authors != null && authors.length > 0){
      String name = "";
      for (int i=0; i < authors.length; i++) {
        name += authors[i]["name"].toString();
        if(authors.length - i > 1){
          name = name + "/";
        }
      }
      if (name != ""){
        this.authors = name;
      }
    }

    List origAuthors = json['origAuthor'];
    if(origAuthors != null && origAuthors.length > 0){
      String name = "";
      for (int i=0; i < origAuthors.length; i++) {
        name += origAuthors[i]["name"].toString();
        if(origAuthors.length - i > 1){
          name = name + "/";
        }
      }
      this.origAuthors = name;
    }

    List translatorList = json['translator'];
    if(translatorList != null && translatorList.length > 0){
      String name = "";
      for (int i=0; i < translatorList.length; i++) {
        name += translatorList[i]["name"].toString();
        if(translatorList.length - i > 1){
          name = name + "/";
        }
      }
      this.translators = name;
    }

    List kindList = json['kinds'];
    if(kindList != null && kindList.length > 0){
      String name = "";
      kinds = List<BookKind>();
      for (int i=0; i < kindList.length; i++) {
        name += kindList[i]["shortName"].toString();
        if(kindList.length - i > 1){
          name = name + " / ";
        }
        kinds.add(BookKind(kindList[i]["id"],kindList[i]["shortName"]));
      }
      if (name != ""){
        this.kindNames = name;
      }
    }

  }
}

class BookList{
  List<Book> list;
  int total; //榜单名称

  BookList(this.total,this.list);

  BookList.fromJson(Map<String, dynamic> json){
    this.total = json['total'];
    if(json['list'] != null && json['list'].length > 0){
      this.list = List<Book>();
      json['list'].forEach((v) {
        this.list.add(Book.fromJson(v));
      });
    }
  }

}

// 首页上的动态book列表
class TopicBooks{
  String label;
  List<Book> list;

  TopicBooks(this.label,this.list);
}