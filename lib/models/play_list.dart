import 'track.dart';

// 歌单
class PlayList{
  String id;//id值
  String name;//歌单名名
  String description;//歌单说明
  String picUrl;//歌单图
  String playCount;//歌单总共播放次数
  String trackCount;//歌曲数
  String copywriter;//作者
  List<Track> tracks;//歌曲
  String duration;//时间

  PlayList(this.name, this.picUrl);

  PlayList.fromJson(Map<String, dynamic> json){
    this.id = json['id'].toString();
    this.name = json['name'];
    this.description = json['description'];
    if(json['coverImgUrl'] != null){
      this.picUrl = json['coverImgUrl']+"?param=177y177";
    } else if(json['picUrl'] != null){
      this.picUrl = json['picUrl']+"?param=177y177";
    }
    this.playCount = json['playCount'].toString().replaceAll(".0", "");
    this.trackCount = json['trackCount'] == null ? json['trackCount'] : json['trackCount'].toString().replaceAll(".0", "");
    this.copywriter = json['copywriter'];

    if(json['trackNumberUpdateTime'] != null) {
      var period = Duration(milliseconds: json['trackNumberUpdateTime']);
      var minute = period.inMinutes;
      var seconds = period.inSeconds;
      int hours = period.inHours;
      if(hours <= 0){
        this.duration = minute.toString() + ":" + (seconds - minute * 60).toString();
      } else {
        this.duration =  hours.toString() + ":" + minute.toString() + ":" + (seconds - minute * 60).toString();
      }
    }

    if(json['tracks'] != null && json['tracks'].length > 0){
      this.tracks = List<Track>();
      json['tracks'].forEach((v) {
        this.tracks.add(Track.fromJson(v));
      });
    }
  }
}

// 推荐歌单
class PersonalPlayLists{
  List<PlayList> result;
  PersonalPlayLists(this.result);

  PersonalPlayLists.fromJson(Map<String,dynamic> json){
    if(json['result'] != null && json['result'].length > 0){
      this.result = List<PlayList>();
      json['result'].forEach((v) {
        this.result.add(PlayList.fromJson(v));
      });
    }
  }
}

// 网友最新歌单
class NewPlayLists{
  List<PlayList> playlists;
  NewPlayLists(this.playlists);

  NewPlayLists.fromJson(Map<String,dynamic> json){
    if(json['playlists'] != null && json['playlists'].length > 0){
      this.playlists = List<PlayList>();
      json['playlists'].forEach((v) {
        this.playlists.add(PlayList.fromJson(v));
      });
    }
  }
}
