//影人参与的相关电影
class RelatedMovie {
  String id;//id值
  String title;//电影名称
  String rate;//打分
  String image;//电影图

  RelatedMovie(this.id,this.title,this.rate,this.image);

  RelatedMovie.fromJson(Map<String, dynamic> json){
    this.title = json['title'];
    this.rate = json['rate'].toString();
    this.id = json["id"].toString();
    this.image = json['cover'].toString();

  }
}

class RelatedMovieList{
  List<RelatedMovie> subjects;
  RelatedMovieList(this.subjects);

  RelatedMovieList.fromJson(Map<String, dynamic> json){
    if(json['subjects'] != null){
      this.subjects = List<RelatedMovie>();
      json['subjects'].forEach((v) {
        this.subjects.add(RelatedMovie.fromJson(v));
      });
    }
  }

}