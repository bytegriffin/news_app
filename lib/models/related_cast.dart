import '../util/image_util.dart';
//影片相关影人
class RelatedCast{
  String id;//唯一id值
  String avatar;//头像
  String name;//影人名称
  String enName;//英文名

  RelatedCast(this.id,this.avatar,this.name,this.enName);

  RelatedCast.fromJson(Map<String, dynamic> json){
    this.avatar = json['avatars']==null ? defaultCastImage :json['avatars']['small'];
    this.id = json['id'];
    this.name = json['name'];
    this.enName = json['name_en'];
  }

}

class RelatedCasts{
  List<RelatedCast> casts;
  RelatedCasts(this.casts);

  RelatedCasts.fromJson(List<dynamic> json){
    if(json != null){
      this.casts = List<RelatedCast>();
      json.forEach((v) {
        this.casts.add(RelatedCast.fromJson(v));
      });
    }
  }
}
