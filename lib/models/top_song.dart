import '../models/track.dart';

//排行榜
class TopSong{
  String name;//榜单名名
  String description;//榜单说明
  String picUrl;//榜单图
  int playCount;//榜单总共播放次数
  List<Track> tracks;//歌曲

  TopSong(this.name);

  TopSong.fromJson(Map<String, dynamic> json){
    this.name = json['name'];
    this.description = json['description'];
    if(json['coverImgUrl'] != null){
      this.picUrl = json['coverImgUrl']+"?param=177y177";
    }
    this.playCount = json['playCount'];
    if(json['tracks'] != null && json['tracks'].length > 0){
      this.tracks = List<Track>();
      json['tracks'].forEach((v) {
        this.tracks.add(Track.fromJson(v));
      });
    }
  }
}
