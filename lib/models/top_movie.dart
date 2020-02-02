enum TopMovieType {
  NewMovie,
  TV,
  Ent,
  Comic,
  Doc,
  Sort
}

class TopMovie {
  String id;//id值
  String title;//电影名称
  String rate;//打分
  String image;//电影图
  List<String> directors;//导演
  List<String> casts;//演员

  TopMovie(this.id,this.title,this.rate,this.image);

  TopMovie.fromJson(Map<String, dynamic> json){
    this.title = json['title'];
    this.rate = json['rate'].toString();
    this.id = json["id"].toString();
    this.image = json['cover'].toString();
    if(json['directors'] != null){
      this.directors = List<String>();
      json['directors'].forEach((v) {
        this.directors.add(v.toString());
      });
    }
    if(json['casts'] != null){
      this.casts = List<String>();
      json['casts'].forEach((v) {
        this.casts.add(v.toString());
      });
    }
  }
}

class NewMovieList{
  List<TopMovie> data;
  NewMovieList(this.data);

  NewMovieList.fromJson(Map<String, dynamic> json){
    if(json['data'] != null){
      this.data = List<TopMovie>();
      json['data'].forEach((v) {
        this.data.add(TopMovie.fromJson(v));
      });
    }
  }

}

class TopMovieList{
  List<TopMovie> subjects;
  TopMovieList(this.subjects);

  TopMovieList.fromJson(Map<String, dynamic> json){
    if(json['subjects'] != null){
      this.subjects = List<TopMovie>();
      json['subjects'].forEach((v) {
        this.subjects.add(TopMovie.fromJson(v));
      });
    }
  }

}