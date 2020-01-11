import 'package:intl/intl.dart';

class SimilarSong{
  String name;//歌名
  String artists;//歌手
  String picUrl;//专辑图
  String type;//类型
  String company; //发行公司
  String publishTime;//发行时间
  String duration;//时长

  SimilarSong(this.name,this.picUrl,this.type,this.company,this.publishTime,this.duration);

  SimilarSong.fromJson(Map<String, dynamic> json){
    this.name = json['name'];
    this.picUrl = json['picUrl'];
    this.artists = json['song']['artists'][0]['name'].toString();
    this.type = json['song']['album']['type'].toString();
    this.company = json['song']['album']['company'].toString();
    int pTime = json['song']['album']['publishTime'];
    DateTime dt =DateTime.fromMillisecondsSinceEpoch(pTime);
    this.publishTime = new DateFormat('yyyy-MM-dd').format(dt);
  }

}