import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// 获取缓存图片
Widget getCachedImage(String imageSrc){
  return Container(
    child: CachedNetworkImage(
      width: 100,
      height: 150,
      fit: BoxFit.cover,
      imageUrl: imageSrc,
      placeholder: (context, url) => CircularProgressIndicator(

      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}

// 根据发布者获取精准的头像
String getAvatarPath(String source){
  String image_str;
  switch(source){
    case "CCTV":
      image_str = "assets/cctv.jpg";
      break;
    case "CCTV4":
      image_str = "assets/cctv4.jpg";
      break;
    case "央视网":
      image_str = "assets/cctv.jpg";
      break;
    case "央视网新闻":
      image_str = "assets/ysxw.jpg";
      break;
    case "央视新闻":
      image_str = "assets/ysxw.jpg";
      break;
    case "央视财经":
      image_str = "assets/yscj.jpg";
      break;
    case "新华网":
      image_str = "assets/xhw.jpg";
      break;
    case "新华网客户端":
      image_str = "assets/xhw.jpg";
      break;
    case "中国教育服务网":
      image_str = "assets/zgjyfww.jpg";
      break;
    case "新华社":
      image_str = "assets/xhw.jpg";
      break;
    case "新华社新媒体":
      image_str = "assets/xhw.jpg";
      break;
    case "新华社客户端":
      image_str = "assets/xhw.jpg";
      break;
    case "第一财经":
      image_str = "assets/dycj.jpg";
      break;
    case "中关村在线":
      image_str = "assets/zol.jpg";
      break;
    case "中国新闻网":
      image_str = "assets/zgxww.jpg";
      break;
    case "钱江晚报":
      image_str = "assets/qjwb.jpg";
      break;
    case "同花顺财经":
      image_str = "assets/thscj.jpg";
      break;
    case "华夏时报":
      image_str = "assets/hxsb.jpg";
      break;
    case "IT168":
      image_str = "assets/it168.jpg";
      break;
    case "人民日报":
      image_str = "assets/rmrb.jpg";
      break;
    case "人民日报海外网":
      image_str = "assets/rmrb.jpg";
      break;
    case "新京报":
      image_str = "assets/xjb.jpg";
      break;
    case "新京报评论":
      image_str = "assets/xjb.jpg";
      break;
    case "券商中国":
      image_str = "assets/jszg.jpg";
      break;
    case "大众日报":
      image_str = "assets/dzrb.jpg";
      break;
    case "AI财经社":
      image_str = "assets/aicjs.jpg";
      break;
    case "新浪财经":
      image_str = "assets/xlcj.jpg";
      break;
    case "封面新闻":
      image_str = "assets/fmxw.jpg";
      break;
    case "钛媒体APP":
      image_str = "assets/tmtpost.jpg";
      break;
    case "央广网":
      image_str = "assets/cnr.jpg";
      break;
    case "中国青年报":
      image_str = "assets/zgqnb.jpg";
      break;
    case "中国青年网":
      image_str = "assets/zgqnw.jpg";
      break;
    case "中国日报网":
      image_str = "assets/chinadaily.jpg";
      break;
    case "环球网":
      image_str = "assets/hqw.jpg";
      break;
    case "环球时报":
      image_str = "assets/hqsb.jpg";
      break;
    case "光明网":
      image_str = "assets/gmw.jpg";
      break;
    case "每日经济新闻":
      image_str = "assets/mrjjxw.jpg";
      break;
    case "经济之声":
      image_str = "assets/jjzs.jpg";
      break;
    case "看看新闻Knews":
      image_str = "assets/kkxw.jpg";
      break;
    case "人民政协网":
      image_str = "assets/rmzxw.jpg";
      break;
    case "人民网":
      image_str = "assets/rmw.jpg";
      break;
    case "cnBeta":
      image_str = "assets/cnbeta.jpg";
      break;
    case "证券之星":
      image_str = "assets/zjzx.jpg";
      break;
    case "北晚新视觉网":
      image_str = "assets/bwxsjw.jpg";
      break;
    case "极客公园":
      image_str = "assets/jkgy.jpg";
      break;
    case "雷锋网":
      image_str = "assets/lfw.jpg";
      break;
    case "浙江新闻":
      image_str = "assets/zjxw.jpg";
      break;
    case "经济日报":
      image_str = "assets/jjrb.jpg";
      break;
    case "中新经纬":
      image_str = "assets/zxjw.jpg";
      break;
    case "北京日报客户端":
      image_str = "assets/bjrb.jpg";
      break;
    case "经济观察报":
      image_str = "assets/jjgcb.jpg";
      break;
    case "澎湃新闻":
      image_str = "assets/ppxw.jpg";
      break;
    case "澎湃新闻2019":
      image_str = "assets/ppxw.jpg";
      break;
    case "金融界":
      image_str = "assets/jrj.jpg";
      break;
    case "上海发布":
      image_str = "assets/shfb.jpg";
      break;
    case "国际在线":
      image_str = "assets/gjzx.jpg";
      break;
    case "中国经济网":
      image_str = "assets/zgjjw.jpg";
      break;
    case "参考消息":
      image_str = "assets/ckxx.jpg";
      break;
    case "界面新闻":
      image_str = "assets/jm.jpg";
      break;
    case "证券时报":
      image_str = "assets/zjsb.jpg";
      break;
    case "旅游视界观":
      image_str = "assets/lysjg.jpg";
      break;
    case "爱范儿":
      image_str = "assets/ifanr.jpg";
      break;
    case "亿欧网":
      image_str = "assets/yo.jpg";
      break;
    case "红网":
      image_str = "assets/hw.jpg";
      break;
    case "新民晚报":
      image_str = "assets/xmwb.jpg";
      break;
    case "直播港澳台":
      image_str = "assets/zbgat.jpg";
      break;
    case "中国军视网":
      image_str = "assets/zgjsw.jpg";
      break;
    case "新华社体育":
      image_str = "assets/xhsty.jpg";
      break;
    default:
      image_str = "assets/avatar.jpg";
      break;
  }
  return image_str;
}