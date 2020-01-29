class News {

  String rid; //唯一key值
  String title; //标题
  String desc; //内容简介
  String source; //来源
  String authorName; //作者
  String url; //详情页面url
  String image0; //图片url
  String image1; //图片url
  String image2; //图片url
  String time; //发布时间
  int playCount;//播放次数
  String tplName;//oneImg noneImg moreImg gallery video
  String dataType;//article gallery video

  News.fromJson(Map<String, dynamic> json){
    this.rid = json['rid'];
    this.title = json['title'];
    this.desc = json['desc'];
    this.tplName = json['tplName'];
    this.dataType = json['dataType'];
    this.source = json['source'];
    this.authorName = json['ext']['doc_provider'];
    this.url = json['oldUrl'];
    this.image0 = json['img0'] == null ? json['img0_m'] : json['img0'];
    this.image1 = json['img1'] == null ? json['img1_m'] : json['img1'];
    this.image2 = json['img2'] == null ? json['img2_m'] : json['img2'];
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