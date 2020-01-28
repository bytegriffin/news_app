//免费电影
class FreeMovie {
  String id;//id值
  String name;//电影名称
  String playUrl;//电影地址
  String image;//电影图
  String desc;//电影介绍
  String duration;//电影时长
  String pubTime;//上映日期
  List<String> tags;//标签
  List<FreeCast> directors;//导演
  List<FreeCast> actors;//演员
  List<FreeCast> writers;//编剧

  FreeMovie.fromJson(Map<String, dynamic> json){
    this.id = json['docId'];
    this.name = json['name'];
    this.playUrl = json['playUrl'];
    this.image = json["imageUrl"];
    this.duration = json['duration'];
    this.desc = json['description'];
    this.pubTime = json['formatPeriod'];
    if(json['categories'] != null){
      this.tags = List<String>();
      json['categories'].forEach((v) {
        this.tags.add(v['name']);
      });
    }
    if(json['cast'] != null && json['cast']['director'] != null){
      this.directors = List<FreeCast>();
      json['cast']['director'].forEach((v) {
        this.directors.add(FreeCast(v['id'],v['name'],v['image_url']));
      });
    }
    if(json['cast'] != null && json['cast']['screen_writer'] != null){
      this.writers = List<FreeCast>();
      json['cast']['screen_writer'].forEach((v) {
        this.writers.add(FreeCast(v['id'],v['name'],v['image_url']));
      });
    }
    if(json['cast'] != null && json['cast']['main_charactor'] != null){
      this.actors = List<FreeCast>();
      json['cast']['main_charactor'].forEach((v) {
        this.actors.add(FreeCast(v['id'],v['name'],v['image_url']));
      });
    }
  }
}

class FreeCast{
  int id;
  String name;
  String image;
  FreeCast(this.id,this.name,this.image);
}

class FreeMovieList{
  List<FreeMovie> list;
  FreeMovieList(this.list);

  FreeMovieList.fromJson(Map<String, dynamic> json){
    if(json['data'] != null && json['data']['list'] != null){
      this.list = List<FreeMovie>();
      json['data']['list'] .forEach((v) {
        if(v['name'] != null && v['name'] != ''){
          this.list.add(FreeMovie.fromJson(v));
        }
      });
    }
  }

}