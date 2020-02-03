class FreeBookTag{
  String bid;
  String name;
  String url;
  FreeBookTag(this.bid,this.name,this.url);
}

class FreeBook {
  String id;//id值
  String name;//书籍名称
  String subName;//书籍副标题
  String author;//作者
  String pub;//出版社
  String pubDate;//发布日期
  String time;//出版日期
  String updateTime;//更新日期
  String price;//价格
  String desc;//描述
  String cover;//图片
  String isbn;//书号
  String words;//字数
  String category;//类别
  String catalog;//目录
  String serName;//系列名称
  List<String> pages;// 书页展示
  List<FreeBookTag> tags;//tag标签
  List<String> tagNames;//tag标签名称

  FreeBook.fromJson(Map<String, dynamic> json){
    if(json["numid"] != null){
      this.id = json["numid"].toString();
    } else if(json["bid"] != null){
      this.id = json['bid'].toString();
    }
    this.name = json['name'].toString().replaceAll("<em>", "").replaceAll("</em>", "");
    this.subName = json['subname'];
    this.author = json['author'].toString();
    this.pub = json['pub'].toString();
    this.pubDate = json['pubdate'].toString();
    this.price = json['price'].toString();
    this.desc = json['descript'];
    this.cover = json['coverurl'];
    this.words = json['words'];
    this.serName = json['ser_name'];
    this.isbn = json['isbn'];
    this.catalog = json['catalog'];
    this.category = json['category'];
    if(json['time'] != null){
      this.time = json['time'].toString().split(" ")[0];
    }
    if(json['date'] != null){
      this.time = json['date'].toString().split(" ")[0];
    }
    if(json['updt_time'] != null){
      this.updateTime = json['updt_time'].toString().split(" ")[0];
    }
    if(json['pages'] != null && json['pages'].runtimeType==List().runtimeType){
      this.pages = List<String>();
      json['pages'].forEach((v) {
        this.pages.add(v['pageimg']);
      });
    }
    List tagList = json['tags'];
    if(tagList != null && tagList.length > 0){
      tags = List<FreeBookTag>();
      tagNames = List<String>();
      for (int i=0; i < tagList.length; i++) {
        String name = tagList[i]["name"].toString();
        tagNames.add(name);
        tags.add(FreeBookTag(tagList[i]["bid"],name,tagList[i]["url"]));
      }
    }
  }
}

class FreeBookList{
  List<FreeBook> list;
  FreeBookList(this.list);

  FreeBookList.fromJson(Map<String, dynamic> json){
    if(json['data']['list'] != null){
      this.list = List<FreeBook>();
      json['data']['list'].forEach((v) {
        this.list.add(FreeBook.fromJson(v));
      });
    }
  }

}