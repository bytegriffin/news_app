import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/haokan_video.dart';
import '../util/image_util.dart';
import '../views/video_detail.dart';

class VideoTileCard extends StatelessWidget {
  final HaoKanVideo haoKanVideo;
  final double worksAspectRatio;

  VideoTileCard({this.haoKanVideo,this.worksAspectRatio});

  @override
  Widget build(BuildContext context) {
    var card =  Card(
      elevation: 1.0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: getCachedImage(haoKanVideo.cover??defaultMusicImage,width: ScreenUtil().setWidth(400), height: worksAspectRatio * 99),
              ),
              Positioned(
                left: 10,
                bottom: 40,
                right: 10,
                child: Text(haoKanVideo.title,
                  style: TextStyle(fontSize: ScreenUtil().setSp(35), fontWeight: FontWeight.bold, color: Colors.white),
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.remove_red_eye,color: Colors.white,),
                    Text(' ${haoKanVideo.playCount}',
                      style: TextStyle(fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.bold, color: Colors.white),
                      maxLines: 2,overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.thumb_up,color: Colors.white,),
                    Text(' ${haoKanVideo.praiseCount}',
                      style: TextStyle(fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.bold, color: Colors.white),
                      maxLines: 2,overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              )
            ],
          ),
        ],
      ),
    );
    return GestureDetector(
      child: card,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => VideoDetailPage(haoKanVideo)
        ));
      },
    );
  }

}
