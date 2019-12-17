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
    case "新华社图片":
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
    case "东方财富网":
      image_str = "assets/dfcfw.jpg";
      break;
    case "河北新闻网":
      image_str = "assets/hbxww.jpg";
      break;
    case "中国经济周刊":
      image_str = "assets/zgjjzk.jpg";
      break;
    case "虎嗅APP":
      image_str = "assets/hx.jpg";
      break;
    case "大众网":
      image_str = "assets/dzw.jpg";
      break;
    case "广西日报":
      image_str = "assets/gxrb.jpg";
      break;
    case "驱动中国":
      image_str = "assets/qdzg.jpg";
      break;
    case "观察者网":
      image_str = "assets/gczw.jpg";
      break;
    case "上观新闻":
      image_str = "assets/sgxw.jpg";
      break;
    case "农视网":
      image_str = "assets/nsw.jpg";
      break;
    case "太平洋电脑网":
      image_str = "assets/pconline.jpg";
      break;
    case "PingWest品玩":
      image_str = "assets/pingwest.jpg";
      break;
    case "直新闻":
      image_str = "assets/zhinews.jpg";
      break;
    case "36氪":
      image_str = "assets/36kr.jpg";
      break;
    case "中国商网":
      image_str = "assets/zgsw.jpg";
      break;
    case "长江日报":
      image_str = "assets/cjrb.jpg";
      break;
    case "华声在线":
      image_str = "assets/hszx.jpg";
      break;
    case "直播吧":
      image_str = "assets/zhibo8.jpg";
      break;
    case "红星新闻":
      image_str = "assets/hxxw.jpg";
      break;
    case "房天下":
      image_str = "assets/ftx.jpg";
      break;
    case "哈尔滨新闻网":
      image_str = "assets/my399.jpg";
      break;
    case "华尔街见闻":
      image_str = "assets/hejjw.jpg";
      break;
    case "DoNews":
      image_str = "assets/donews.jpg";
      break;
    case "新浪科技":
      image_str = "assets/xlkj.jpg";
      break;
    case "手机中国网":
      image_str = "assets/sjzgw.jpg";
      break;
    case "三湘都市报":
      image_str = "assets/sxdsb.jpg";
      break;
    case "PP体育篮球":
      image_str = "assets/pptylq.jpg";
      break;
    case "政事儿":
      image_str = "assets/zse.jpg";
      break;
    case "移民帮":
      image_str = "assets/ymb.jpg";
      break;
    case "广州日报":
      image_str = "assets/gzrb.jpg";
      break;
    case "长安街知事":
      image_str = "assets/cajzs.jpg";
      break;
    case "四川新闻网":
      image_str = "assets/scxww.jpg";
      break;
    case "信网":
      image_str = "assets/xw.jpg";
      break;
    case "财经郎眼":
      image_str = "assets/cjly.jpg";
      break;
    case "懂个球":
      image_str = "assets/dgq.jpg";
      break;
    case "青海新闻网":
      image_str = "assets/qhxww.jpg";
      break;
    case "纵相新闻":
      image_str = "assets/zxxw.jpg";
      break;
    case "快科技":
      image_str = "assets/kkj.jpg";
      break;
    case "掌上春城":
      image_str = "assets/zscc.jpg";
      break;
    case "太平洋汽车网":
      image_str = "assets/tpyqcw.jpg";
      break;
    case "体坛+":
      image_str = "assets/ttj.jpg";
      break;
    case "证券日报":
      image_str = "assets/zjrb.jpg";
      break;
    case "中国气象爱好者":
      image_str = "assets/zgqxahz.jpg";
      break;
    case "上游新闻":
      image_str = "assets/syxw.jpg";
      break;
    case "中国江西网":
      image_str = "assets/zgjxw.jpg";
      break;
    case "金十数据":
      image_str = "assets/jssj.jpg";
      break;
    case "河北网信管理执法":
      image_str = "assets/hbwx.jpg";
      break;
    case "中国经济时报":
      image_str = "assets/zgjjsb.jpg";
      break;
    case "贵阳网":
      image_str = "assets/gyw.jpg";
      break;
    case "全景网":
      image_str = "assets/qjw.jpg";
      break;
    default:
      image_str = "assets/avatar.jpg";
      break;
  }
  return image_str;
}