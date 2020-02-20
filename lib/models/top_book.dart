import 'book_kind.dart';

class TopBook {
  String searchId;//id值，用作查询使用
  String eBookId;//ebook id值
  String currentRank;//当前排行
  String title;//书名
  String authors;//作家
  String origAuthors;//原作家
  String image;//图片
  String wordCount;//字数
  List<BookKind> kinds;//类型
  String kindNames;//类型名称
  List<String> tags;//标签
  String rating;//评分
  String salesPrice;//这个价格不正确，要以searchbook中的价格为准
  bool isColumn;//false：works节点包含book子节点，也就是说可以找到book的id值，true:找不到book子节点
  bool isOrigin;//跟isColumn一起判断
  bool isBundle;//是否是套装
  String editorHighlight;//简介，主要在列表中显示
  String abstract;//摘要，主要在详情页中展示
  int voteCount;//推荐票

  TopBook(this.searchId,this.currentRank,this.title,this.authors,this.image,this.abstract);

  TopBook.fromJson(Map<String, dynamic> json){
    this.isColumn = json['works']['isColumn'];
    this.isOrigin = json['works']['isOrigin'];
    this.isBundle = json['works']['isBundle'];
    this.title = json['works']['title'];
    if(json['works']['book'] != null){
      this.searchId = json['works']['book']['url'].toString()
          .replaceAll("https://book.douban.com/subject/", "").replaceAll("/", "");
    }
    if(json['works']['id'] != null){
      this.eBookId = json['works']['id'];
    }
    if(json['works']['averageRating'] != null){
      this.rating = (json['works']['averageRating'] * 2).toString();
    }
    if(json['voteCount'] != null){
      this.voteCount = json['voteCount'];
    }
    this.currentRank = json['currentRank'].toString();
    this.salesPrice = json['salesPrice'].toString();
    if(json['works']['editorHighlight'] != null){
      this.editorHighlight = json['works']['editorHighlight'].toString();
    }
    List origAuthorList = json['works']['origAuthor'];
    if(origAuthorList != null && origAuthorList.length > 0){
      String name = "";
      for (int i=0; i < origAuthorList.length; i++) {
        name += origAuthorList[i]["name"].toString();
        if(origAuthorList.length - i > 1){
          name = name + "/";
        }
      }
      this.origAuthors = name;
    }
    List authorList = json['works']['author'];
    if(authorList != null && authorList.length > 0){
      String name = "";
      for (int i=0; i < authorList.length; i++) {
        name += authorList[i]["name"].toString().replaceAll("〔", "(").replaceAll("〕", ")");
        if(authorList.length - i > 1){
          name = name + "/";
        }
      }
      if (name != ""){
        this.authors = name;
      }
    }else if (this.origAuthors != null && this.origAuthors != "") {
      this.authors = this.origAuthors;
    }

    this.image = json['works']['cover'];
    this.abstract = json['works']['abstract'];
    this.wordCount = json['works']['wordCount'].toString() + " " + json['works']['wordCountUnit'];
    List kindList = json['works']['kinds'];
    if(kindList != null && kindList.length > 0){
      String name = "";
      kinds = List<BookKind>();
      for (int i=0; i < kindList.length; i++) {
        name += kindList[i]["shortName"].toString();
        if(kindList.length - i > 1){
          name = name + " | ";
        }
        kinds.add(BookKind(kindList[i]["id"],kindList[i]["shortName"]));
      }
      if (name != ""){
        this.kindNames = name;
      }
    }

    List tagList = json['works']['highlightTags'];
    if(tagList != null && tagList.length > 0){
      tags = List<String>();
      for (int i=0; i < tagList.length; i++) {
        tags.add(tagList[i]['name']);
      }
    }

  }
}

class TopBookList{
  List<TopBook> list;
  String name; //榜单名称
  String fullName; //榜单全名
  String type; //榜单类型
  String channel; //销售渠道
  TopBookList(this.list,this.name,this.fullName,this.type,this.channel);

  TopBookList.fromJson(Map<String, dynamic> json){
    this.name = json['name'];
    this.fullName = json['fullName'];
    this.type = json['type'];
    this.channel = json['channel'];
    if(json['list'] != null && json['list'].length > 0){
      this.list = List<TopBook>();
      json['list'].forEach((v) {
        this.list.add(TopBook.fromJson(v));
      });
    }
  }

}