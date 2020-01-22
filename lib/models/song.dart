import 'album.dart';
import 'artist.dart';
// 歌曲
class Song {

  String id;//id
  String name;//歌名
  String picUrl;//歌图
  String company; //发行公司
  String duration;//时长
  Album album;//专辑
  List<Artist> artists;//歌手
  int mvid;//mv id
 // String albumId;//专辑id
  String artistName;//歌手名称
  String albumName;//所属专辑名称

  Song(this.id,this.name,this.picUrl);

  Song.fromJson(Map<String, dynamic> json){
    this.id = json['id'].toString();
    this.name = json['name'];
    if(json['picUrl'] != null && json['picUrl'] != ""){
      this.picUrl = json['picUrl'].toString()+"?param=177y177";
    }
    this.mvid = json['mvid']??json['mv']??0; // 为空或者=0时没有mv，其他则有
    if(json['song'] != null && json['song']['album'] != null){
      this.album = Album.fromJson(json['song']['album']);
      this.albumName = album.name;
      if(json['song']['artists'] != null && json['song']['artists'].length > 0){
        this.artists = List<Artist>();
        String name = "";
        for (int i=0; i < json['song']['artists'].length; i++) {
          var v = json['song']['artists'][i];
          name += v["name"].toString();
          this.artists.add(Artist(v['id'].toString(),v['name'],v['picUrl']));
          if(json['song']['artists'].length - i > 1){
            name = name + "/";
          }
        }
        this.artistName =name;
      }
    } else if(json['al'] != null){
      this.album = Album.fromJson(json['al']);
      this.albumName = album.name;
      if(json['ar'] != null){
        String name = "";
        this.artists = List<Artist>();
        for (int i=0; i < json['ar'].length; i++) {
          var v = json['ar'][i];
          name += v["name"].toString();
          this.artists.add(Artist(v['id'].toString(),v['name'],v['picUrl']??""));
          if(json['ar'].length - i > 1){
            name = name + "/";
          }
        }
        this.artistName =name;
      }
    }
    var dd;
    if(json['song'] != null && json['song']['duration'] != null){
      dd = json['song']['duration'];
    } else if(json['dt'] != null){
      dd = json['dt'];
    }
    var period = Duration(milliseconds: dd);
    var minute = period.inMinutes;
    var seconds = period.inSeconds;
    this.duration = minute.toString() + ":" + (seconds - minute * 60).toString();
    if(json['company'] != null){
      this.company = json['company'];
    } else if(album != null && album.company != null){
      this.company = album.company;
    }
  }
}

class SongList{
  List<Song> result;
  int code;
  int category;
  SongList(this.result,this.code,this.category);

  SongList.fromJson(Map<String, dynamic> json){
    this.category = json['category']??0;
    this.code = json['code']??0;
    if(json['result'] != null){
      this.result = List<Song>();
      json['result'].forEach((v) {
        this.result.add(Song.fromJson(v));
      });
    }
  }
}

class AlbumSong {

  List<Song> songs;
  int code;
  Album album;

  AlbumSong(this.songs,this.album,this.code);

  AlbumSong.fromJson(Map<String, dynamic> json){
    this.code = json['code'];
    this.album = Album.fromJson(json['album']);
    if(json['songs'] != null){
      this.songs = List<Song>();
      json['songs'].forEach((v) {
        this.songs.add(Song.fromJson(v));
      });
    }
  }
}

// 获得歌手单曲
class ArtistSong {

  List<Song> hotSongs;
  int code;
  Artist artist;

  ArtistSong(this.hotSongs,this.code,this.artist);

  ArtistSong.fromJson(Map<String, dynamic> json){
    this.code = json['code'];
    this.artist = Artist.fromJson(json['artist']);
    if(json['hotSongs'] != null){
      this.hotSongs = List<Song>();
      json['hotSongs'].forEach((v) {
        this.hotSongs.add(Song.fromJson(v));
      });
    }
  }

}
