import 'package:intl/intl.dart';

class HaoKanVideo{
  String vid;//视频id
  String title;//视频名称
  String videoSrc;//视频地址
  String cover;//视频截图
  String thumbnails;//视频压缩后截图
  String author;//视频发布者
  String avator;//视频作者头像
  String duration;//视频长度
  String publishTime;//发布时间
  int fansCount;//粉丝数量
  int playCount;//播放次数
  int praiseCount;//点赞数量

  HaoKanVideo(this.title);

  HaoKanVideo.fromJson(Map<String, dynamic> json){
    this.vid = json['vid'].toString();
    this.title = json['title'];
    this.videoSrc = json['video_src'].toString();
    this.cover = json['cover_src'].toString();
    this.thumbnails = json['thumbnails'].toString();
    this.author = json["author"].toString();
    this.avator = json["author_icon"].toString();
    this.duration = json['duration'].toString();
    int pTime = json['publishTime'];
    if(pTime != null){
      DateTime dt = DateTime.fromMillisecondsSinceEpoch(pTime);
      this.publishTime = new DateFormat('yyyy-MM-dd').format(dt);
    }
    this.playCount = json['playcnt'];
    this.praiseCount = json['praiseNum'];
    this.fansCount = json['fansCnt'];
  }

}

class HaoKanVideoList{
  List<HaoKanVideo> list;
  HaoKanVideoList(this.list);

  HaoKanVideoList.fromJson(Map<String, dynamic> json){
    if(json['data'] != null && json['data']['list'] != null){
      this.list = List<HaoKanVideo>();
      json['data']['list'] .forEach((v) {
        this.list.add(HaoKanVideo.fromJson(v['content']));
      });
    }
  }

}