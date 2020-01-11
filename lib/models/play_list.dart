import 'track.dart';

// 歌单
class PlayList{
  String id;//id值
  String name;//歌单名名
  String description;//歌单说明
  String picUrl;//歌单图
  int playCount;//歌单总共播放次数
  List<Track> tracks;//歌曲

  PlayList(this.name);

  PlayList.fromJson(Map<String, dynamic> json){
    this.id = json['id'].toString();
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

// 网友最新歌单
class PlayLists{
  List<PlayList> playlists;
  PlayLists(this.playlists);

  PlayLists.fromJson(Map<String,dynamic> json){
    if(json['playlists'] != null && json['playlists'].length > 0){
      this.playlists = List<PlayList>();
      json['playlists'].forEach((v) {
        this.playlists.add(PlayList.fromJson(v));
      });
    }
  }
}
