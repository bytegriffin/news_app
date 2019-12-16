import 'package:intl/intl.dart';

class Music {
  String name;//歌名
  String artists;//歌手
  String picUrl;//专辑图
  String type;//类型
  String company; //发行公司
  String publishTime;//发行时间

  Music(this.name,this.picUrl,this.type,this.company,this.publishTime);

  Music.fromJson(Map<String, dynamic> json){
    this.name = json['name'];
    this.picUrl = json['picUrl'];
    this.artists = json['song']['artists'][0]['name'].toString();
    this.type = json['song']['album']['type'].toString();
    this.company = json['song']['album']['company'].toString();
    int ptime = json['song']['album']['publishTime'];
    DateTime dt =DateTime.fromMillisecondsSinceEpoch(ptime);
    this.publishTime = new DateFormat('yyyy-MM-dd').format(dt);
  }
}

class MusicList{
  List<Music> result;
  int code;
  int category;
  MusicList(this.result,this.code,this.category);

  MusicList.fromJson(Map<String, dynamic> json){
    this.category = json['category'];
    this.code = json['code'];
    if(json['result'] != null){
      this.result = List<Music>();
      json['result'].forEach((v) {
        this.result.add(Music.fromJson(v));
      });
    }
  }

}