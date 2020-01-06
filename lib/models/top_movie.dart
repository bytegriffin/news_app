class TopMovie {
  String id;//id值
  String title;//电影名称
  String rate;//打分
  String image;//电影图

  TopMovie(this.id,this.title,this.rate,this.image);

  TopMovie.fromJson(Map<String, dynamic> json){
    this.title = json['title'];
    this.rate = json['rate'].toString();
    this.id = json["id"].toString();
    this.image = json['cover'].toString();

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