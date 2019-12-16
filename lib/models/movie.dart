class Movie {
  String title;//电影名称
  String rating;//打分
  String casts; //演员
  String durations;//时长
  String directors;//导演
  String image;//电影图
  String pubdates;//发布时间
  String genres;//类型

  Movie(this.title,this.rating,this.casts,this.durations,
      this.directors,this.image,this.pubdates,this.genres);

  Movie.fromJson(Map<String, dynamic> json){
    this.title = json['title'];
    this.rating = json['rating']['average'].toString();
    this.genres = json["genres"]==null? "" :json["genres"].toString();
    this.durations = json['durations'].toString().replaceAll("[", "").replaceAll("]", "");
    this.image = json['images']['small'].toString();
    this.pubdates = json['pubdates'].toString();
    List<String> dlist = List<String>();
    json['directors'].forEach((v){
      dlist.add(v['name']);
    });
    if(dlist.length > 0){
      this.directors = dlist.toString().replaceAll("[", "").replaceAll("]", "");
    }
    List<String> clist = List<String>();
    json['casts'].forEach((v){
      clist.add(v['name']);
    });
    if(clist.length > 0){
      this.casts = clist.toString().replaceAll("[", "").replaceAll("]", "");
    }
  }
}

class MovieList{
  List<Movie> subjects;
  int start; //起始点
  int count; //本次总共查询数量
  int total; //书的总量
  MovieList(this.subjects,this.start,this.count,this.total);

  MovieList.fromJson(Map<String, dynamic> json){
    this.start = json['start'];
    this.count = json['count'];
    this.total = json['total'];
    if(json['subjects'] != null){
      this.subjects = List<Movie>();
      json['subjects'].forEach((v) {
        this.subjects.add(Movie.fromJson(v));
      });
    }
  }

}