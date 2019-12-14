class News {

  String uniquekey; //唯一key值
  String title; //标题
  String desc; //内容简介
  String category; //分类
  String source; //来源
  String authorName; //作者
  String url; //详情页面url
  String image; //图片url
  String time; //发布时间
  int playCount;//播放次数

  News({this.uniquekey, this.title, this.desc, this.category, this.source,
    this.authorName, this.url, this.image, this.time, this.playCount});

  News.fromJson(Map<String, dynamic> json){
    this.uniquekey = json['rid'];
    this.title = json['title'];
    this.desc = json['desc'];
    this.source = json['source'];
    this.category = json['source'];
    this.authorName = json['ext']['doc_provider'];
    this.url = json['oldUrl'];
    this.image = json['img0'] == null ? json['img0_m'] : json['img0'];
    this.time = json['format_time'];
    this.playCount = json['playcnt'];
  }
}

class NewsList{
  List<News> result;
  int errorCode;
  String reason;

  NewsList({this.result,this.errorCode,this.reason});

  NewsList.fromJson(Map<String, dynamic> json) {
    this.errorCode = json['error_code'];
    this.reason = json['reason'];
    this.result = List<News>();
    if(json['data'] != null){
      json['data'].forEach((v) {
        this.result.add(new News.fromJson(v));
      });
    }
  }

}