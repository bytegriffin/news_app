//歌手
class Artist{
  String id;
  String name;
  String picUrl; // 人物头像
  int musicSize; // 单曲数量
  int albumSize; // 专辑数量
  int mvSize; //  拍摄mv数量
  String alias; // 别名
  String briefDesc; //简单介绍

  Artist(this.id,this.name,this.picUrl);

  Artist.fromJson(Map<String,dynamic> json){
    this.id = json['id'].toString();
    this.name = json['name'];
    if(json['picUrl'] != null && json['picUrl'] != ""){
      this.picUrl = json['picUrl'].toString()+"?param=177y177"??"";
    }
    if(json['musicSize'] != null){
      this.musicSize = json['musicSize'];
    }
    if(json['albumSize'] != null){
      this.albumSize = json['albumSize'];
    }
    if(json['mvSize'] != null){
      this.mvSize = json['mvSize'];
    }
    this.briefDesc = json['briefDesc']??"";
    List<dynamic> aliasList = json['alias'];
    if(aliasList != null){
      String name = "";
      for (int i=0; i < aliasList.length; i++) {
        name += aliasList[i].toString();
        if(aliasList.length - i > 1){
          name = name + "/";
        }
      }
      this.alias = name;
    }
  }
}


class ArtistList{
  int total;
  int code;
  List<Artist> artists;
  ArtistList(this.artists);

  ArtistList.fromJson(Map<String,dynamic> json){
    this.total = json['total']??0;
    this.code = json['code']??0;
    if(json['artists'] != null && json['artists'].length > 0){
      this.artists = List<Artist>();
      json['artists'].forEach((v) {
        this.artists.add(Artist.fromJson(v));
      });
    }
  }
}


// 歌手简介
class ArtistDesc{
  String ti1;
  String txt1;
  String ti2;
  String txt2;
  String ti3;
  String txt3;
  String ti4;
  String txt4;
  String ti5;
  String txt5;
  String briefDesc;

  ArtistDesc.fromJson(Map<String,dynamic> json){
    this.briefDesc = json['briefDesc'];
    List<dynamic> intros = json['introduction'];
    for(var i =0; i< intros.length; i ++){
      if(i == 0){
        ti1 = intros[i]['ti'];
        txt1 = intros[i]['txt'];
      } else if(i == 1){
        ti2 = intros[i]['ti'];
        txt2 = intros[i]['txt'];
      } else if(i == 2){
        ti3 = intros[i]['ti'];
        txt3 = intros[i]['txt'];
      } else if(i == 3){
        ti4 = intros[i]['ti'];
        txt4 = intros[i]['txt'];
      } else if(i == 4){
        ti5 = intros[i]['ti'];
        txt5 = intros[i]['txt'];
      }
    }
  }
}