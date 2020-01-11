import 'artist.dart';

class MV{
  String id;
  String name;//mv名称
  String cover;//mv图片
  String duration;//时长
  String playCount;//播放次数
  String artistName;//歌手
  String artistId;//歌手id
  String likeCount;//点赞数
  String shareCount;//分享次数
  String subCount;//收藏次数
  String commentCount;//讨论次数
  String publishTime;//发布时间
  List<Artist> artists;//参与歌手
  String desc;//mv描述
  Map<String, String> brs;//视频地址 key 码率 value地址
  String mv240;
  String mv480;
  String mv720;
  String mv1080;

  MV(this.id,this.name,this.cover,this.artistName);

  MV.fromJson(Map<String,dynamic> json){
    this.id = json['id'].toString();
    this.name = json['name'];
    this.cover = json['imgurl']??json['picUrl']??json['cover'];
    this.artistName = json['artistName'];
    var period = Duration(milliseconds: json['duration']);
    var minute = period.inMinutes;
    var seconds = period.inSeconds;
    this.duration = minute.toString() + ":" + (seconds - minute * 60).toString();
    this.playCount = json['playCount'].toString();
    if(json['artistId'] != null){
      artistId = json['artistId'].toString();
    }
    if(json['likeCount'] != null){
      this.likeCount = json['likeCount'].toString();
    }
    if(json['shareCount'] != null){
      this.shareCount = json['shareCount'].toString();
    }
    if(json['commentCount'] != null){
      this.commentCount = json['commentCount'].toString();
    }
    if(json['subCount'] != null){
      this.subCount = json['subCount'].toString();
    }
    if(json['publishTime'] != null){
      this.publishTime = json['publishTime'];
    }
    if(json['desc'] != null){
      this.desc = json['desc'];
    } else if(json['briefDesc'] != null) {
      this.desc = json['briefDesc'];
    }
    List<dynamic> artistList = json['artists'];
    if(artistList != null){
      this.artists = List<Artist>();
      artistList.forEach((v){
        this.artists.add(Artist.fromJson(v));
      });
    }
    Map<String,dynamic> map = json['brs'];
    if(map != null){
      mv240 = map['240']??"";
      mv480 = map['480']??"";
      mv720 = map['720']??"";
      mv1080 = map['1080']??"";
    }
  }
}

//mv详情
class MVDetail{
  int code;
  MV data;
  MVDetail(this.code,this.data);
  MVDetail.fromJson(Map<String,dynamic> json){
    if(json['data'] != null){
      this.data = MV.fromJson(json['data']);
    }
  }
}

//最新mv
class NewMV{
  List<MV> data;
  NewMV(this.data);

  NewMV.fromJson(Map<String,dynamic> json){
    if(json['data'] != null){
      this.data = List<MV>();
      json['data'].forEach((v) {
        this.data.add(MV.fromJson(v));
      });
    }
  }
}

//推荐mv
class RecMV{
  List<MV> result;

  RecMV.fromJson(Map<String,dynamic> json){
    if(json['result'] != null){
      this.result = List<MV>();
      json['result'].forEach((v) {
        this.result.add(MV.fromJson(v));
      });
    }
  }
}

//歌手mv / 相似MV
class ArtistMV{
  List<MV> mvs;

  ArtistMV.fromJson(Map<String,dynamic> json){
    if(json['mvs'] != null){
      this.mvs = List<MV>();
      json['mvs'].forEach((v) {
        this.mvs.add(MV.fromJson(v));
      });
    }
  }
}