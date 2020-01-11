class TopBook {
  String id;//id值，用作查询使用
  String currentRank;//当前排行
  String title;//书名
  String author;//作家
  String origAuthor;//原作家
  String image;//图片
  String abstract;//摘要
  String wordCount;//字数
  String kinds;//种类

  TopBook(this.id,this.currentRank,this.title,this.author,this.image,this.abstract,this.wordCount,this.kinds);

  TopBook.fromJson(Map<String, dynamic> json){
    this.title = json['works']['title'];
    this.id = json['works']['book']['url'].toString()
        .replaceAll("https://book.douban.com/subject/", "").replaceAll("/", "");
    this.currentRank = json['currentRank'].toString();
    List origAuthors = json['works']['origAuthor'];
    if(origAuthors != null && origAuthors.length > 0){
      String name = "";
      for (int i=0; i < origAuthors.length; i++) {
        name += origAuthors[i]["name"].toString().replaceAll("〔", "(").replaceAll("〕", ")");
        if(origAuthors.length - i > 1){
          name = name + ",";
        }
      }
      this.origAuthor = name;
    }
    List authors = json['works']['author'];
    if(authors != null && authors.length > 0){
      String name = "";
      for (int i=0; i < authors.length; i++) {
        name += authors[i]["name"].toString().replaceAll("〔", "(").replaceAll("〕", ")");
        if(authors.length - i > 1){
          name = name + ",";
        }
      }
      if (name != ""){
        this.author = name;
      }
    }else if (this.origAuthor != null && this.origAuthor != "") {
      this.author = this.origAuthor;
    }
    this.image = json['works']['cover'];
    this.abstract = json['works']['abstract'];
    this.wordCount = json['works']['wordCount'].toString() + " " + json['works']['wordCountUnit'];

    List kindList = json['works']['kinds'];
    if(kindList != null && kindList.length > 0){
      String name = "";
      for (int i=0; i < kindList.length; i++) {
        name += kindList[i]["shortName"].toString();
        if(kindList.length - i > 1){
          name = name + " | ";
        }
      }
      this.kinds = name;
    }else{
      this.kinds = "";
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