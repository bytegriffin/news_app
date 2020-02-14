import 'related_cast.dart';
// 预告片
class Trailer{
  String id;//id
  String image;//预览图片
  String name;//预告片名称
  String duration;//预告片时长
  String url;//预告片地址
  Trailer(this.id, this.name, this.image, this.duration, this.url);
}

// movie详情
class SearchMovie {
  String id;//id值
  String title;//电影名称
  String originalTitle;//电影原名
  String rating;//打分
  List<RelatedCast> casts; //演员
  List<RelatedCast> directors;//导演
  List<RelatedCast> writers; //编剧
  String directorNames;// 导演名称
  String castNames;//演员名称
  String durations;//时长
  String image;//电影图
  String pubDate;//发布时间
  String type;//类型
  String language;//语言
  String country;//国家
  List<String> tags;//标签
  String summary;//电影简介
  List<String> trailerUrls;//预告片
  String year;//上映年份
  List<Trailer>  trailers;//预告片列表
  List<String>  photos;//影片截图
  String info;//新片榜/经典影片简介

  SearchMovie(this.id, this.title, this.image);

  SearchMovie.fromJson(Map<String, dynamic> json){
    this.id = json['id'].toString();
    this.title = json['title'];
    this.year = json['year'];
    this.originalTitle = json['original_title'];
    this.casts = RelatedCasts.fromJson(json['casts']).casts;
    this.directors = RelatedCasts.fromJson(json['directors']).casts;
    this.writers = RelatedCasts.fromJson(json['writers']).casts;
    this.rating = json['rating']==null ? "":json['rating']['average'].toString()??"";
    this.image = json['images']==null? "":json['images']['small']??"";
    if(image.contains('img9')){
      this.image = image.replaceAll("img9", "img3");
    }
    this.pubDate = json['pubdates'].toString().replaceAll("[", "").replaceAll("]", "");
    this.type = json["genres"].toString().replaceAll("[", "").replaceAll("]", "");
    this.durations = json['durations'].toString().replaceAll("[", "").replaceAll("]", "");
    this.summary = json['summary'].toString().replaceAll("©豆瓣", "");
    this.language = json['languages'].toString().replaceAll("[", "").replaceAll("]", "");
    this.country = json['countries'].toString().replaceAll("[", "").replaceAll("]", "");
    List<dynamic> tagList = json['tags'];
    if(tagList != null){
      this.tags = List<String>();
      tagList.forEach((v) => this.tags.add(v.toString()));
    }
    //this.trailerUrls = json['trailer_urls'];
  }
}

class SearchMovieList{
  List<SearchMovie> subjects;
  int start; //起始点
  int count; //本次总共查询数量
  int total; //电影的总量
  SearchMovieList(this.subjects,this.start,this.count,this.total);

  SearchMovieList.fromJson(Map<String, dynamic> json){
    this.start = json['start']??0;
    this.count = json['count']??0;
    this.total = json['total']??0;
    if(json['subjects'] != null){
      this.subjects = List<SearchMovie>();
      json['subjects'].forEach((v) {
        this.subjects.add(SearchMovie.fromJson(v));
      });
    }
  }
}

//北美票房榜 json格式不一致 因此要特殊写
class UsBoxMovieList{
  List<SearchMovie> subjects;
  String date;
  String title;
  UsBoxMovieList(this.date,this.title,this.subjects);

  UsBoxMovieList.fromJson(Map<String, dynamic> json){
    this.date = json['date']??"";
    this.title = json['title']??"";
    if(json['subjects'] != null){
      this.subjects = List<SearchMovie>();
      json['subjects'].forEach((v) {
        this.subjects.add(SearchMovie.fromJson(v['subject'] ));
      });
    }
  }
}
