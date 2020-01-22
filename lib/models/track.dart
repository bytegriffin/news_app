import 'artist.dart';
import 'song.dart';

Song trackToSong(Track tarck){
  return Song(tarck.songId,tarck.songName,tarck.albumPic);
}

// 歌曲 song
class Track{
  String songId;
  String songName;
  String artistNames;//所有歌手
  String albumId;
  String albumName;
  String albumPic;
  List<Artist> ar;

  Track(this.artistNames,this.songName);

  Track.fromJson(Map<String, dynamic> json){
    this.songId = json['id'].toString();
    this.songName = json['name'];
    List<dynamic> arList = json['ar'];
    if(arList != null){
      String name = "";
      ar = List<Artist>();
      for (int i=0; i < arList.length; i++) {
        var v = arList[i];
        name += v["name"].toString();
        this.ar.add(Artist.fromJson(v));
        if(arList.length - i > 1){
          name = name + "/";
        }
      }
      this.artistNames = name;
    }
    if(json['al'] != null){
      this.albumId = json['al']['id'].toString();
      this.albumName = json['al']['name'];
      if(json['al']['picUrl'] != null){
        this.albumPic = json['al']['picUrl']+"?param=177y177";
      }
    }
  }

}