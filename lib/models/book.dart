class Book {
  String title;//书名
  Map<String, dynamic> rating;//打分
  String author;//作家
  List<dynamic> translator; //翻译
  String image;//图书图片
  String price;//价格
  String subtitle;//副标题
  String pubdate;//发布时间
  String publisher;//出版社

  Book(this.title,this.rating,this.author,this.translator,
      this.image,this.price,this.subtitle,this.pubdate,this.publisher);

  Book.fromJson(Map<String, dynamic> json){
    this.title = json['title']==null?json['subtitle']:json['title'];
    this.rating = json['rating'];
    this.author = json["author"]==null? json["author"] :json["author"].toString();
    this.translator = json['translator'];
    this.price = json['price'];
    this.image = json['image'];
    this.pubdate = json['pubdate'];
    this.publisher = json['publisher'];
    this.subtitle = json['subtitle'];
    if(image.contains('img9')){
      this.image = image.replaceAll("img9", "img3");
    }
  }
}

class BookList{
  List<Book> books;
  int start; //起始点
  int count; //本次总共查询数量
  int total; //书的总量
  BookList(this.books,this.start,this.count,this.total);

  BookList.fromJson(Map<String, dynamic> json){
    this.start = json['start'];
    this.count = json['count'];
    this.total = json['total'];
    if(json['books'] != null){
      this.books = List<Book>();
      json['books'].forEach((v) {
        this.books.add(Book.fromJson(v));
      });
    }
  }

}