class SearchBook {
  String id;//查询id
  String eBookId;//ebook id值
  String title;//书名
  String rating;//打分
  String author;//作家
  String authorIntro;//作者简介
  List<dynamic> translator; //翻译
  String image;//书图片
  String price;//价格
  String subtitle;//副标题
  String pubDate;//发布时间
  String publisher;//出版社
  String summary="";//书简介
  List<String> tags;//标签
  String catalog;//目录

  SearchBook(this.id,this.title,this.rating,this.author,this.translator,this.authorIntro,this.catalog,
      this.image,this.price,this.subtitle,this.pubDate,this.publisher,this.summary,this.tags);

  SearchBook.fromJson(Map<String, dynamic> json){
    this.title = json['title']==null?json['subtitle']:json['title'];
    this.rating = json['rating']['average'].toString();
    this.translator = json['translator'];
    this.authorIntro = json['author_intro']??"";
    this.price = json['price']=="" ? "暂无" : json["price"];
    this.image = json['image'];
    this.pubDate = json['pubdate'];
    this.publisher = json['publisher'];
    this.subtitle = json['subtitle'];
    this.summary = json['summary']??"";
    this.catalog = json['catalog'];
    if(image.contains('img9')){
      this.image = image.replaceAll("img9", "img3");
    }
    if(json['ebook_url'] != null){
      this.eBookId = json['ebook_url'].toString().replaceAll("https://read.douban.com/ebook/", "").replaceAll("/", "");
    }
    List authorList = json['author'];
    if(authorList != null && authorList.length > 0){
      String name = "";
      for (int i=0; i < authorList.length; i++) {
        name += authorList[i].toString().replaceAll("〔", "(").replaceAll("〕", ")");
        if(authorList.length - i > 1){
          name = name + ",";
        }
      }
      this.author = name;
    }
    List tagList = json['tags'];
    if(tagList != null && tagList.length > 0){
      tags = List<String>();
      tagList.forEach((v){
        tags.add(v['name']);
      });
    }
  }
}

class SearchBookList{
  List<SearchBook> books;
  int start; //起始点
  int count; //本次总共查询数量
  int total; //书的总量
  SearchBookList(this.books,this.start,this.count,this.total);

  SearchBookList.fromJson(Map<String, dynamic> json){
    this.start = json['start'];
    this.count = json['count'];
    this.total = json['total'];
    if(json['books'] != null){
      this.books = List<SearchBook>();
      json['books'].forEach((v) {
        this.books.add(SearchBook.fromJson(v));
      });
    }
  }

}