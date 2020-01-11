import 'artist.dart';
import 'package:intl/intl.dart';

//专辑
class Album{
  String id;//专辑id
  String name;//专辑名称
  String picUrl;//专辑图片
  String company;//发信公司
  String type;//类型
  String subType;//录音室版
  String description;//描述
  String pubTime;//发布时间
  List<Artist> artists; // 参与的所有歌手
  String artistName;//专辑歌手

  Album(this.id,this.name,this.picUrl,this.company,this.type,this.subType,this.pubTime,this.artists);

  Album.fromJson(Map<String,dynamic> json){
    this.id = json['id'].toString();
    this.name = json['name']??"";
    if(json['picUrl'] != null){
      this.picUrl = json['picUrl']+"?param=177y177";
    }
    this.company = json['company']??"";
    this.type = json['type']??"";
    this.subType = json['subType']??"";
    this.description = json['description']??"";
    int pTime = json['publishTime'];
    if(pTime != null){
      DateTime dt = DateTime.fromMillisecondsSinceEpoch(pTime);
      this.pubTime = new DateFormat('yyyy-MM-dd').format(dt);
    }
    this.artists = ArtistList.fromJson(json).artists;
    if(artists != null){
      this.artistName = artists[0]?.name??"";
    }
  }

}

class AlbumList{
  int total;
  int code;
  List<Album> albums;
  AlbumList(this.albums);

  AlbumList.fromJson(Map<String,dynamic> json){
    this.total = json['total']??0;
    this.code = json['code']??0;
    if(json['albums'] != null && json['albums'].length > 0){
      this.albums = List<Album>();
      json['albums'].forEach((v) {
        this.albums.add(Album.fromJson(v));
      });
    }
  }

}

// 获得歌手专辑
class ArtistAlbum {

  List<Album> hotAlbums;
  int code;
  Artist artist;

  ArtistAlbum(this.hotAlbums,this.code,this.artist);

  ArtistAlbum.fromJson(Map<String, dynamic> json){
    this.code = json['code'];
    this.artist = Artist.fromJson(json['artist']);
    if(json['hotAlbums'] != null){
      this.hotAlbums = List<Album>();
      json['hotAlbums'].forEach((v) {
        this.hotAlbums.add(Album.fromJson(v));
      });
    }
  }

}