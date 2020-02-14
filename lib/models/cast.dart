import '../util/image_util.dart';
import 'cast_movie.dart';

//影人详情
class Cast{
  String id;//唯一id值
  String avatar;//头像
  String name;//影人名称
  String enName;//英文名
  String gender;//性别
  String professions;//职业
  String birthday;//生日
  String bornPlace;//出生地
  String constellation;//星座
  String info;//总共简介
  String summary;//人物简介
  List<String> photos;//照片
  List<RelatedMovie> relatedMovieList;//影人参与的影片

  Cast();

  Cast.fromJson(Map<String, dynamic> json){
    this.avatar = json['avatars']==null ? defaultCastImage :json['avatars']['small'];
    this.id = json['id'].toString()??"";
    this.name = json['name']??"";
    this.enName = json['name_en']??"";
    this.gender = json['gender']??"";
    this.birthday = json['birthday']??"";
    this.bornPlace = json['born_place']??"";
    this.constellation = json['constellation']??"";
    this.summary = json['summary']??"";
    List<dynamic> professionList = json['professions'];
    List<String> zzList;
    if(professionList != null){
      String name = "";
      zzList = List<String>();
      for (int i=0; i < professionList.length; i++) {
        if(professionList[i] == null || professionList[i].toString().trim() == ""){
          continue;
        }
        zzList.add(professionList[i].toString());
      }
      for (int i=0; i < zzList.length; i++) {
        name += zzList[i].toString();
        if(zzList.length - i > 1){
          name = name + " / ";
        }
      }
      this.professions = name;
    }
    List<dynamic> photoList = json['photos'];
    if(photoList != null){
      this.photos = List<String>();
      photoList.forEach((p) => this.photos.add(p['icon'].toString().replaceAll("img9", "img3")));
    }

    List<dynamic> subjectList = json['works'];
    if(subjectList != null){
      this.relatedMovieList = List<RelatedMovie>();
        subjectList.forEach((v) {
          var subject = v['subject'];
          this.relatedMovieList.add(
            RelatedMovie(subject['id'],subject['title'],subject['rating']['average'].toString(),
                subject['images']['small'].toString().replaceAll("img9", "img3")));
        });
    }
  }

}

class Casts{
  List<Cast> casts;
  Casts(this.casts);

  Casts.fromJson(List<dynamic> json){
    if(json != null){
      this.casts = List<Cast>();
      json.forEach((v) {
        this.casts.add(Cast.fromJson(v));
      });
    }
  }
}
