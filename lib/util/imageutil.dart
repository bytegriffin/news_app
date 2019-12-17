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
      image_str = "https://tvax4.sinaimg.cn/crop.0.2.97.97.180/c2b99825ly8fy5zxub7o2j202s02smwy.jpg";
      break;
    case "央视网":
      image_str = "https://tvax4.sinaimg.cn/crop.0.2.97.97.180/c2b99825ly8fy5zxub7o2j202s02smwy.jpg";
      break;
    case "CCTV4":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/79942c81ly8g804eweftrj20u00u0jsf.jpg";
      break;
    case "CCTV5体育新闻":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/685b6e37jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "央视网新闻":
      image_str = "https://tvax4.sinaimg.cn/crop.0.2.97.97.180/c2b99825ly8fy5zxub7o2j202s02smwy.jpg";
      break;
    case "央视新闻":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.624.624.180/9e5389bbly8g93bx8ug1tj20hc0hcq4l.jpg";
      break;
    case "央视财经":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.1024.1024.180/86a17422jw8f5teqphdovj20sg0sggo0.jpg";
      break;
    case "新华网":
      image_str = "https://tvax2.sinaimg.cn/crop.0.6.466.466.180/a782e4ably8fed1oss68hj20dw0dw0v2.jpg";
      break;
    case "新华网客户端":
      image_str = "https://tvax2.sinaimg.cn/crop.0.6.466.466.180/a782e4ably8fed1oss68hj20dw0dw0v2.jpg";
      break;
    case "中国教育服务网":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/bfc630cdjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "新华社":
      image_str = "https://tvax1.sinaimg.cn/crop.31.79.938.938.180/654b47daly8fmhwp1ajjbj20sa0sajw0.jpg";
      break;
    case "新华社新媒体":
      image_str = "https://tvax1.sinaimg.cn/crop.31.79.938.938.180/654b47daly8fmhwp1ajjbj20sa0sajw0.jpg";
      break;
    case "新华社客户端":
      image_str = "https://tvax1.sinaimg.cn/crop.31.79.938.938.180/654b47daly8fmhwp1ajjbj20sa0sajw0.jpg";
      break;
    case "新华社图片":
      image_str = "https://tvax1.sinaimg.cn/crop.31.79.938.938.180/654b47daly8fmhwp1ajjbj20sa0sajw0.jpg";
      break;
    case "第一财经":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.758.758.180/65809478gy1fdeherxvctj20l40l4dho.jpg";
      break;
    case "中关村在线":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.500.500.180/6826f34bly1g4588h2v7sj20dw0dwt9p.jpg";
      break;
    case "中国新闻网":
      image_str = "https://tva3.sinaimg.cn/crop.13.10.271.271.180/6a5ce645jw8f0pmtva9puj208c08cq3o.jpg";
      break;
    case "钱江晚报":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.690.690.180/655eee23jw8ev8xgphpe2j20j60j6q5h.jpg";
      break;
    case "同花顺财经":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/be73d445jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "华夏时报":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/6d97eb17jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "IT168":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.299.299.180/4c342426jw1e83dhz8rawj208c08cjrr.jpg";
      break;
    case "人民日报":
      image_str = "https://tva1.sinaimg.cn/crop.0.3.1018.1018.180/a716fd45gw1ev7q2k8japj20sg0sg779.jpg";
      break;
    case "人民日报海外网":
      image_str = "https://tva1.sinaimg.cn/crop.0.3.1018.1018.180/a716fd45gw1ev7q2k8japj20sg0sg779.jpg";
      break;
    case "新京报":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.512.512.180/61ff32dejw8ev91yl3hkdj20e80e8jrt.jpg";
      break;
    case "新京报评论":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.512.512.180/61ff32dejw8ev91yl3hkdj20e80e8jrt.jpg";
      break;
    case "新京报经济新闻":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.1080.1080.180/c2cd8d7bly1fz63df1opnj20u00u0dm2.jpg";
      break;
    case "券商中国":
      image_str = "https://tva1.sinaimg.cn/crop.5.0.282.282.180/006qbjoyjw8f1xour19iej308207ujs7.jpg";
      break;
    case "大众日报":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.1190.1190.180/005TbsAFtw1eog2cy4zacj30x40xcdmf.jpg";
      break;
    case "AI财经社":
      image_str = "https://tvax2.sinaimg.cn/crop.168.0.387.387.180/8e6f0a11ly8fqfwtbngb1j20ku0b44qp.jpg";
      break;
    case "新浪财经":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/61add7e3jw8elz207ln0lj2050050aad.jpg";
      break;
    case "封面新闻":
      image_str = "https://tvax2.sinaimg.cn/crop.35.5.526.526.180/593793e5ly8g1r26yfg8gj20gq0f5dfo.jpg";
      break;
    case "钛媒体APP":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.458.458.180/aa0d937dly8floltvss8bj20cq0cqmxx.jpg";
      break;
    case "央广网":
      image_str = "https://tva1.sinaimg.cn/crop.5.0.175.175.180/6457c157jw8ev743zc8z8j2050050gli.jpg";
      break;
    case "中国青年报":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.1080.1080.180/66eeadffly8g1so1kytefj20u00u0myf.jpg";
      break;
    case "中国青年网":
      image_str = "http://d.youth.cn/images/youth_sjy_logo.png";
      break;
    case "中国日报网":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.996.996.180/7ece7745ly8g0ltxxsj6nj20ro0roq47.jpg";
      break;
    case "环球网":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.179.179.180/6486a91ajw1ev7ljghtbqj2050050jrc.jpg";
      break;
    case "环球时报":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.200.200.180/75b1a75fly1fmfz7qvv75j205k05kt8p.jpg";
      break;
    case "光明网":
      image_str = "https://tva2.sinaimg.cn/crop.3.0.146.146.180/6879fe33jw8eswe3rxc90j2046046gln.jpg";
      break;
    case "每日经济新闻":
      image_str = "https://tva1.sinaimg.cn/crop.17.13.195.195.180/624c6377gw1f2o7dkri5nj206d05vq38.jpg";
      break;
    case "经济之声":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.664.664.180/659d7b0bly8g8540q5nwgj20ig0ih74t.jpg";
      break;
    case "看看新闻Knews":
      image_str = "https://tva1.sinaimg.cn/crop.11.11.162.162.180/6e05a6dagw1f4al1gu1jaj2050050mx6.jpg";
      break;
    case "人民政协网":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.996.996.180/4295214dly8fu02ji1ld6j20ro0ro0te.jpg";
      break;
    case "人民政协报":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.996.996.180/4295214dly8fu02ji1ld6j20ro0ro0te.jpg";
      break;
    case "人民网":
      image_str = "https://tvax1.sinaimg.cn/crop.191.213.616.616.180/884f7263ly8fx0hnmtt6nj20rs0rsab5.jpg";
      break;
    case "cnBeta":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.512.512.180/a5115c63jw8es8eqieaiaj20e80e80t8.jpg";
      break;
    case "证券之星":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/6e4eaaecly1g8qpwbhivlj20u00u0n15.jpg";
      break;
    case "北晚新视觉网":
      image_str = "https://tva1.sinaimg.cn/crop.9.0.2027.2027.180/606580aegw1esysv0gfopj21kw1kwtff.jpg";
      break;
    case "极客公园":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/67728821ly8g5jzexcsbpj20u00u0mz5.jpg";
      break;
    case "雷锋网":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.100.100.180/7e4980bcjw8f5qyrum4c7j202s02sjr7.jpg";
      break;
    case "浙江新闻":
      image_str = "https://tvax3.sinaimg.cn/crop.48.50.195.195.180/8172644aly8fsbqbuu9j7j209r0990ss.jpg";
      break;
    case "经济日报":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.512.512.180/b5094a1ejw8evv5vfl6wwj20e80e8gnl.jpg";
      break;
    case "中新经纬":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.1024.1024.180/006xCflSjw8f9drcgvq8mj30sg0sggom.jpg";
      break;
    case "北京日报客户端":
      image_str = "https://tva2.sinaimg.cn/crop.5.5.170.170.180/70e2834djw8ev768osi2uj2050050dfv.jpg";
      break;
    case "经济观察报":
      image_str = "https://tvax1.sinaimg.cn/crop.21.19.394.394.180/61d83ed4ly8fe4pkbgj7rj20c10c1wf2.jpg";
      break;
    case "澎湃新闻":
      image_str = "https://tvax1.sinaimg.cn/crop.11.10.275.275.180/005vnhZYly8ftjmwo0bx4j308c08cq32.jpg";
      break;
    case "澎湃新闻2019":
      image_str = "https://tvax1.sinaimg.cn/crop.11.10.275.275.180/005vnhZYly8ftjmwo0bx4j308c08cq32.jpg";
      break;
    case "金融界":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.498.498.180/65928d0fly1flqr726ryaj20dv0dv754.jpg";
      break;
    case "上海发布":
      image_str = "https://tva2.sinaimg.cn/crop.167.99.1610.1610.180/9764bb42jw8et23v9ytc6j21gh1ghgt8.jpg";
      break;
    case "国际在线":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.640.640.180/621778bbjw8evep35fh10j20hs0hswev.jpg";
      break;
    case "中国经济网":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.511.511.180/6328b6bbly1fgjhxyyst3j20e80e8dgm.jpg";
      break;
    case "参考消息":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.1022.1022.180/8d90f0bbjw1ev7oijumy4j20sg0sg0v6.jpg";
      break;
    case "界面新闻":
      image_str = "https://tva4.sinaimg.cn/crop.353.329.1327.1327.180/005EHRy1jw8ezcb0tieodj31jw1mr78d.jpg";
      break;
    case "证券时报":
      image_str = "https://tvax1.sinaimg.cn/crop.155.95.310.310.180/633151d5ly8fu3j03idw9j20gk0ecade.jpg";
      break;
    case "旅游视界观":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.751.751.180/9d2ef8ffly8ftifudi708j20kv0kvaaj.jpg";
      break;
    case "爱范儿":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.300.300.180/61e9ece0ly1ftcum4pi1mj208c08c3yb.jpg";
      break;
    case "亿欧网":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.1024.1024.180/976b8e2cjw8f8xjyu074xj20sg0sgabp.jpg";
      break;
    case "红网":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.993.993.180/c875cd12jw8ejgzzdhzwcj20rl0rl75g.jpg";
      break;
    case "新民晚报":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.179.179.180/6793c6f2ly8fifv6uwl8bj2050050q2x.jpg";
      break;
    case "直播港澳台":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.200.200.180/477818b1jw8f3ozsgczsij205k05kmx5.jpg";
      break;
    case "中国军视网":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.200.200.180/005XDnEely8g5k9o44lwnj305k05kglq.jpg";
      break;
    case "新华社体育":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/672f8bf3jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "东方财富网":
      image_str = "https://tvax2.sinaimg.cn/crop.53.0.586.586.180/6b608346ly8fo0xqf16upj20hs0hsjsm.jpg";
      break;
    case "东方财富快讯":
      image_str = "https://tvax2.sinaimg.cn/crop.53.0.586.586.180/6b608346ly8fo0xqf16upj20hs0hsjsm.jpg";
      break;
    case "河北新闻网":
      image_str = "https://tvax1.sinaimg.cn/crop.36.56.964.964.180/7a43b6fely8fqfndbj2vvj20sg0sggoe.jpg";
      break;
    case "中国经济周刊":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.301.301.180/67a31b1aly8fq7ondvzgrj208d08dn0c.jpg";
      break;
    case "虎嗅APP":
      image_str = "https://tvax1.sinaimg.cn/crop.187.216.917.917.180/8c803935ly8fshge6o9h3j2104104td7.jpg";
      break;
    case "大众网":
      image_str = "https://tva3.sinaimg.cn/crop.10.17.80.80.180/9c2b5f31jw8fabeazwrqqj202s02saad.jpg";
      break;
    case "广西日报":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/d17e913ejw8ev7oukznigj2050050aa4.jpg";
      break;
    case "驱动中国":
      image_str = "https://tvax3.sinaimg.cn/crop.88.16.295.295.180/7d246e9bly8g23gpquj2yj20cu0cja9y.jpg";
      break;
    case "观察者网":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.1002.1002.180/707e96d5ly8fy5w9o8sbdj20ru0ru75k.jpg";
      break;
    case "上观新闻":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.968.968.180/e5283560ly1fqejv07mnej20qw0qwwja.jpg";
      break;
    case "农视网":
      image_str = "https://tva1.sinaimg.cn/crop.2.0.247.247.180/82ae80d3jw8ewth11w9eij206y06y3yy.jpg";
      break;
    case "太平洋电脑网":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.300.300.180/893a3388ly8ft5y6hshqaj208c08ct8u.jpg";
      break;
    case "PingWest品玩":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.828.828.180/a8e44e81ly8g45dyns6tpj20n00n0q3a.jpg";
      break;
    case "直新闻":
      image_str = "https://tvax3.sinaimg.cn/crop.55.91.976.976.180/006N4ALSly8fxht0cdlh4j30u00wu76g.jpg";
      break;
    case "36氪":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.850.850.180/684ff39bly8fi57d6kk3oj20nm0nm75h.jpg";
      break;
    case "中国商网":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.1024.1024.180/74b6b953ly8fzf3ty5qmbj20sg0sgwio.jpg";
      break;
    case "长江日报":
      image_str = "https://tva4.sinaimg.cn/crop.50.10.464.464.180/712547e4gw1f7k6wp8pslj20fm0eo0uk.jpg";
      break;
    case "华声在线":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.178.178.180/88611984gw1ee1jlsf9jxj204z04z3yr.jpg";
      break;
    case "直播吧":
      image_str = "https://tvax2.sinaimg.cn/crop.36.23.291.291.180/784fda03gy1fj8ry5o1flj20a4096aaj.jpg";
      break;
    case "红星新闻":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/006FcX4dly8g1r42pey91j30u00u0jsk.jpg";
      break;
    case "房天下":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.299.299.180/9b33b7e3jw1faridia035j208c08cmxq.jpg";
      break;
    case "哈尔滨新闻网":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.750.750.180/65f27d71jw8fdd4eqk065j20ku0kujsm.jpg";
      break;
    case "华尔街见闻":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.399.399.180/6fc2c0e5gw1ejdakew0dnj20b40b4t8t.jpg";
      break;
    case "DoNews":
      image_str = "https://tva3.sinaimg.cn/crop.0.8.556.556.180/629924f5jw8faqa534sf1j20go0goq37.jpg";
      break;
    case "新浪科技":
      image_str = "https://tvax1.sinaimg.cn/crop.118.42.486.486.180/61e89b74ly8foeu1q3orsj20jg0epdg6.jpg";
      break;
    case "手机中国网":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.118.118.180/67931c2agw1emm2p7czkgj203b03ct8p.jpg";
      break;
    case "CNMO手机中国":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.118.118.180/67931c2agw1emm2p7czkgj203b03ct8p.jpg";
      break;
    case "三湘都市报":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.878.878.180/655546ecgy1fgn3h7nu75j20og0ogdg0.jpg";
      break;
    case "PP体育篮球":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1125.1125.180/007raNBoly8fwu6ao387lj30v90v93z9.jpg";
      break;
    case "政事儿":
      image_str = "https://tva4.sinaimg.cn/crop.51.63.286.286.180/0069dJbDjw8etgle1aocuj30a90a8aab.jpg";
      break;
    case "政事儿News":
      image_str = "https://tva4.sinaimg.cn/crop.51.63.286.286.180/0069dJbDjw8etgle1aocuj30a90a8aab.jpg";
      break;
    case "移民帮":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.149.149.180/00633FPegw1f8bedsfgqyj3046046glk.jpg";
      break;
    case "广州日报":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.179.179.180/70856785gw1ezgct0epprj2050050q37.jpg";
      break;
    case "中原新闻网":
      image_str = "https://tvax4.sinaimg.cn/crop.26.0.150.150.180/0076fVfTly8fqnvqhxb7bj305k046mxp.jpg";
      break;
    case "长安街知事":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.1125.1125.180/652f5916ly8fugcf9wmppj20v90v9773.jpg";
      break;
    case "四川新闻网":
      image_str = "https://tvax1.sinaimg.cn/crop.2.2.197.197.180/6530d487ly8g1rg93kyhwj205k05kt8k.jpg";
      break;
    case "信网":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.197.197.180/005LqB8Ltw1elbxd8dhncj305k05idfx.jpg";
      break;
    case "财经郎眼":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.512.512.180/62b57103ly8g4sh4kpp70j20e80e8wfv.jpg";
      break;
    case "懂个球":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.1933.1933.180/006aUGrcjw8euyn3ulaulj31kw1hpaea.jpg";
      break;
    case "青海新闻网":
      image_str = "https://tvax3.sinaimg.cn/crop.0.122.219.219.180/006Duutjly1fecv044flhj30hs0dct9m.jpg";
      break;
    case "纵相新闻":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/007foqvhly8g64vo4l4wbj30u00u0jtc.jpg";
      break;
    case "快科技":
      image_str = "https://tvax1.sinaimg.cn/crop.71.62.893.893.180/62ec2493ly8fs750zc17gj20sg0sggmn.jpg";
      break;
    case "驱动之家":
      image_str = "https://tvax1.sinaimg.cn/crop.71.62.893.893.180/62ec2493ly8fs750zc17gj20sg0sggmn.jpg";
      break;
    case "掌上春城":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.132.132.180/005CSIZwjw8fanzgc8ps0j303o03oa9y.jpg";
      break;
    case "太平洋汽车网":
      image_str = "https://tvax2.sinaimg.cn/crop.9.19.492.492.180/890574d1ly8g95u3brrkwj20e80e8n1z.jpg";
      break;
    case "体坛+":
      image_str = "https://tvax1.sinaimg.cn/crop.79.45.870.870.180/006ppXykly8g50axldg8uj30sg0sg0tf.jpg";
      break;
    case "证券日报":
      image_str = "https://tva2.sinaimg.cn/crop.7.8.134.134.180/89c03e60jw1ebmo60k0g0j2046046q2v.jpg";
      break;
    case "中国气象爱好者":
      image_str = "https://tvax3.sinaimg.cn/crop.20.0.1202.1202.180/69226ed0ly8fn0whdqaogj20yi0xegna.jpg";
      break;
    case "上游新闻":
      image_str = "https://tva2.sinaimg.cn/crop.3.0.743.743.180/6331ffd1jw8fa8sshjqxwj20ku0knaas.jpg";
      break;
    case "中国江西网":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/8b8a27a6jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "金十数据":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.511.511.180/9c4fc2e9gw1f0ca230c2mj20e80e874t.jpg";
      break;
    case "金十数据快讯":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.511.511.180/9c4fc2e9gw1f0ca230c2mj20e80e874t.jpg";
      break;
    case "河北网信管理执法":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.500.500.180/77fe9959ly8g69lscyqtpj20dw0dwn2i.jpg";
      break;
    case "中国经济时报":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/6848da0bjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "贵阳网":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.185.185.180/def14da7gw1ebgqv1yz0gj2056056t8z.jpg";
      break;
    case "全景网":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.661.661.180/6875c818ly8g4sfxvddp9j20id0iemxo.jpg";
      break;
    case "天眼新闻":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/007FMvXuly8g117edk2lxj30u00u0gr9.jpg";
      break;
    case "中国经营报":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/be8cde17jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "天极网":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/6253056fjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "TechWeb":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/61e61e8cjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "今日商讯":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.179.179.180/006pGFAhgw1f1vgcwn522j30500503yg.jpg";
      break;
    case "红刊财经":
      image_str = "https://tva4.sinaimg.cn/crop.49.62.891.891.180/006tP5Lbjw1f5ujetlm56j30rh0rhdkq.jpg";
      break;
    case "中青评论":
      image_str = "https://tvax2.sinaimg.cn/crop.129.23.1009.1009.180/b82820e3ly1ff063x5cwuj20wt0wtwmb.jpg";
      break;
    case "量子位":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.200.200.180/006Fd7o3jw8fbw134ijknj305k05k3ye.jpg";
      break;
    case "时代周报":
      image_str = "https://tvax2.sinaimg.cn/crop.5.3.624.624.180/61ff4496ly8g4vyi0blrhj20hs0hsta4.jpg";
      break;
    case "河南交通广播":
      image_str = "https://tva4.sinaimg.cn/crop.232.134.1373.1373.180/674876fdjw8envfij2giyj21el1c8jzd.jpg";
      break;
    case "不看车":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/88443f33ly8g6d4xo8yusj20u00u0jtr.jpg";
      break;
    case "中国台湾网":
      image_str = "https://tvax3.sinaimg.cn/crop.75.15.166.166.180/65e1a554ly8fy5z4glcw0j208c05kmxd.jpg";
      break;
    case "东哥知旅行":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.798.798.180/a79f80f8ly1fh7m0m96eyj20m80m80yd.jpg";
      break;
    case "全天候科技":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.577.577.180/006PbnLGgy1fgjkmvk8ggj30g20g2q3g.jpg";
      break;
    case "砍柴网":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.500.500.180/88422986ly8g05yhgrw7jj20dw0dwmzu.jpg";
      break;
    case "前瞻网":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/9dd1888ajw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "新湖南":
      image_str = "https://tva2.sinaimg.cn/crop.14.0.600.600.180/006q3UBKgw1fb6mhc49luj30hs0hsac9.jpg";
      break;
    case "解放军新闻传播中心":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.200.200.180/005XDnEely8g5k9o44lwnj305k05kglq.jpg";
      break;
    case "四川农村日报":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.180/7eb5640aly8g6otku61ffj20u00u075i.jpg";
      break;
    case "科技犬":
      image_str = "https://tvax2.sinaimg.cn/crop.30.0.1075.1075.180/5657b866ly1fu3arh82mvj20vm0u0who.jpg";
      break;
    case "北青网":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.200.200.180/7c9ab006ly8fziybxvm2hj205k05kmxe.jpg";
      break;
    case "面包财经":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.1843.1843.180/bdb2a2f3jw8ex2xcszxc0j21f71f7wi7.jpg";
      break;
    case "读懂财经研究":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.640.640.180/007wWPkmly1fyjz5bii91j30hs0hst99.jpg";
      break;
    case "留学监理网服务":
      image_str = "https://tva3.sinaimg.cn/crop.1.0.924.924.180/621853e7jw1e84vwtpka6j20pu0pvdlh.jpg";
      break;
    case "兵团日报":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.500.500.180/7750e095ly8ffu1zcr9eej20dw0dwtb8.jpg";
      break;
    case "闪电新闻":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.1022.1022.180/006JlhVHly1fha6a0cj8vj30sg0sgwfs.jpg";
      break;
    case "黑龙江日报":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.399.399.180/a7d39f2dtw1et13f72sy1j20b40b4q42.jpg";
      break;
    case "南国都市报":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.547.547.180/74f38b61ly8ffplnxw8r2j20f70f8ac8.jpg";
      break;
    case "蓝鲸财经":
      image_str = "https://tvax3.sinaimg.cn/crop.40.51.416.416.180/9d3f8b93gy1fg75zm4w80j20e80e83z0.jpg";
      break;
    case "国际艺术大观":
      image_str = "https://tva4.sinaimg.cn/crop.41.29.551.551.180/9950220btw1eh3p0ywcj8j20hh0hhq4k.jpg";
      break;
    case "国际艺术之大观":
      image_str = "https://tva4.sinaimg.cn/crop.41.29.551.551.180/9950220btw1eh3p0ywcj8j20hh0hhq4k.jpg";
      break;
    case "共青团中央":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1010.1010.180/eaaf2affly8fmfl4g5qe3j20s20s2wfw.jpg";
      break;
    case "人民论坛网":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.179.179.180/d27db3a8tw1emv72xist7j2050050aa9.jpg";
      break;
    case "虎扑体育":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.2048.2048.180/73788edely8fir7dfzkdhj21kw1kwtby.jpg";
      break;
    case "易车":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.240.240.180/71fa320dly1fv6tsgo9pqj206o06o0ti.jpg";
      break;
    case "双姐旅游":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.480.480.180/007Uj1rYly8g55aocjt73j30dc0dcdhm.jpg";
      break;
    case "中宏网豫闻":
      image_str = "https://tva1.sinaimg.cn/crop.4.0.95.95.180/006m4SMAjw8f05tbg6yj2j302s02sdfp.jpg";
      break;
    case "乐居财经":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.750.750.180/005w7Hxzly8fuhfn4ib1rj30ku0ku0tc.jpg";
      break;
    case "携程旅行":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.332.332.180/88a365d9tw1e8va3p2w0bj2099099dga.jpg";
      break;
    case "好厨网":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.127.127.180/a1b82263gw1ej43oreo16j203k03k0sn.jpg";
      break;
    case "中国能源报":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.282.282.180/7f6e880fgw1ei6j7vu1nhj207v07v754.jpg";
      break;
    case "云掌财经":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.256.256.180/006d7Croly8fspi2y6zdbj3074074dg8.jpg";
      break;
    case "中国电力报":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/8bb1fe75jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "中管院数字经济中心":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.180.180.180/007Ba72Sly1fzar0qp2ahj30500503z2.jpg";
      break;
    case "雷科技":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.241.241.180/005wwKz0gw1ek7jte4fqpj306q06qdg0.jpg";
      break;
    case "凤凰网房产":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.200.200.180/70b24e20ly1fq8wuotju0j205k05kaa3.jpg";
      break;
    case "教育人陈志文":
      image_str = "https://tvax2.sinaimg.cn/crop.157.252.355.355.180/954e09f4ly8ff7014pdpvj20hq0hsgne.jpg";
      break;
    case "文书车云":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.1242.1242.180/61405330ly8ff13euwpbxj20yi0yigna.jpg";
      break;
    case "中国教育在线":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/9bc42bd9ly8fy60sg35rjj20u00u0jse.jpg";
      break;
    case "泡泡网":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.616.616.180/631385cfly8flz0nv5qjtj21kw235qkw.jpg";
      break;
    case "四川在线":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.179.179.180/70818cc9gw1ev7mqa8yn4j2050050gln.jpg";
      break;
    case "海报新闻":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.996.996.180/007uKMadly8fxx3s7c5blj30ro0rodge.jpg";
      break;
    case "e公司":
      image_str = "https://tva1.sinaimg.cn/crop.33.36.287.287.180/0066Q9xwgw1fbnwrauo2tj30a00a074q.jpg";
      break;
    case "虎扑足球":
      image_str = "https://tvax2.sinaimg.cn/crop.346.195.163.163.180/653d411ely8g2rjgb6btqj20ne0gk0sq.jpg";
      break;
    case "虎扑足球":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.200.200.180/007aYS2mly8fsbvl3v5pij305k05kq3h.jpg";
      break;
    case "IT之家":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.800.800.180/6cd6d028ly8fme7am50hlj20m80m83yq.jpg";
      break;
    case "渭南青年网":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.149.149.180/dc84152bjw1e7qq06aeq3j2046046mx9.jpg";
      break;
    case "中国网财经":
      image_str = "https://tvax4.sinaimg.cn/crop.36.8.563.563.180/8db71a36ly1fjz24lbt2fj20go0goq4j.jpg";
      break;
    case "天文在线":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.996.996.180/6bcabf35ly8g3tywl3evqj20ro0ro0w1.jpg";
      break;
    case "巨丰投顾":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.664.664.180/006x0YQ4jw8f5xw5gud8vj30ig0ig3z3.jpg";
      break;
    case "西宁晚报":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/7564a59bjw8ev8aqckc70j2050050mx2.jpg";
      break;
    case "马蜂窝":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.500.500.180/67289d66ly8fz1mafho2dj20dw0dwaai.jpg";
      break;
    case "米圣经":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.500.500.180/006YUQjply8fymppfcz6hj30dw0dwjtj.jpg";
      break;
    case "奎子侃球":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.240.240.180/007LQ5yJly8g2qyz6yco0j306o06owep.jpg";
      break;
    case "车壹圈":
      image_str = "https://tva4.sinaimg.cn/crop.15.3.279.279.180/006CGiE6jw8f9rri01od5j308c08cglv.jpg";
      break;
    case "吴晓波频道":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.640.640.180/005DTzKqly8flwifq9wbxj30hs0hst9f.jpg";
      break;
    case "生活报":
      image_str = "https://tva4.sinaimg.cn/crop.14.19.602.602.180/712eb195jw1ev8w0dlkrej20hs0hs0tw.jpg";
      break;
    case "四川农村日报":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.180/7eb5640aly8g6otku61ffj20u00u075i.jpg";
      break;
    case "东北网":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/640c4ec2jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "云南台都市条形码":
      image_str = "https://tva1.sinaimg.cn/crop.2.0.177.177.180/63e9370dgw1ej8kpj1dm0j205004y0sq.jpg";
      break;
    case "半导体投资联盟":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.1242.1242.180/006XhJ8Qly8fky96qfnucj30yi0yidh4.jpg";
      break;
    case "镁客网":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.900.900.180/006hjnLujw8f02ht9ss0jj30p00p07c7.jpg";
      break;
    case "大摩财经":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1280.1280.180/0073XlYUly1fnu2bj73b2j30zk0zk75s.jpg";
      break;
    case "车域无疆":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.769.769.180/82d1e9a3gw1em2te23u1uj20lf0lfmz5.jpg";
      break;
    case "迷彩虎":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.512.512.180/006yljN9jw8f6vo9d34gmj30e80e8dhm.jpg";
      break;
    case "文汇报":
      image_str = "https://tva2.sinaimg.cn/crop.3.17.261.261.180/7222c0c0jw8evexaaq8jqj207h07rq30.jpg";
      break;
    case "博科园":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.970.970.180/8413ac87ly8fdl9h4iwbdj20qy0qyx4r.jpg";
      break;
    case "政知见":
      image_str = "https://mp-video.myzaker.com/image/201905/5cecaf1b7c274f20285e3425.jpg";
      break;
    case "新京报Fun娱乐":
      image_str = "https://pic.rmb.bdstatic.com/dac739b8e540d54082775bd2fcb211d0.jpeg";
      break;
    case "互联网连线":
      image_str = "https://pic.rmb.bdstatic.com/40d577cfb8158474d6843f60917b3ce3.jpeg";
      break;
    case "新青年文刊":
      image_str = "https://pic.rmb.bdstatic.com/91071d1ac16c7187e1c6899fd29694e2.jpeg";
      break;
    case "书法田园":
      image_str = "https://pic.rmb.bdstatic.com/d06eb97ba9a5ad981aaf36ec1605f419.jpeg";
      break;
    case "胖刘说体育":
      image_str = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=db7723833e2093dd5c5a769b9d5f2988&quality=100&size=b501_10057&cut_x=0&cut_y=2&cut_w=501&cut_h=501&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fa1ed3ceb2a5ed725f31da139d5915368.png";
      break;
    case "艾伦英语部落":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/631e69aaly8g5laquoylgj20u00u0q8x.jpg";
      break;
    case "贝克街探案官":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.180/007Y4Ae2ly8g6r3hwrudrj30u00u0js2.jpg";
      break;
    case "中国军网":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/7c34a525jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "动点科技":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.299.299.180/6ffb18f9gw1fay4zfwtuoj208c08cjri.jpg";
      break;
    case "悟空财税官方资讯":
      image_str = "https://tvax3.sinaimg.cn/crop.9.10.161.161.180/005z4Jvwly8flirx88t1cj3050050q32.jpg";
      break;
    case "股海重生2015":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.750.750.180/006h2s9Ajw8exp4oum5orj30ku0kv0u4.jpg";
      break;
    case "探旅":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.996.996.180/006y9jA7ly8fw1pa9lwf3j30ro0rpdgo.jpg";
      break;
    case "中国山东网":
      image_str = "https://tvax2.sinaimg.cn/crop.2.0.197.197.180/64a82e50ly1fl2k8gzi2rj205k05kt8o.jpg";
      break;
    case "工人日报":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.180.180.180/e4ed7abfly1g1uyc9onnyj2050050t8u.jpg";
      break;
    case "中国财富网官方":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.833.833.180/006HdDhlly8ff096ziuj0j30n50n57b4.jpg";
      break;
    case "车动态":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.1328.1328.180/005AtOc1jw8f3trtu8f7dj310w10wjt8.jpg";
      break;
    case "余丰慧":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.1242.1242.180/45554c9ajw8f3rexuzxm9j20yi0yigpg.jpg";
      break;
    case "河南日报客户端":
      image_str = "https://tva3.sinaimg.cn/crop.18.4.525.525.180/c40841edjw8ev80iqd0nqj20fa0faabq.jpg";
      break;
    case "长春教育八卦阵":
      image_str = "https://tvax1.sinaimg.cn/crop.0.130.773.773.180/006EjfPqly8ft76ctbfhwj31kw0sgthw.jpg";
      break;
    case "新通教育":
      image_str = "https://tvax1.sinaimg.cn/crop.0.70.600.600.180/52ede162ly1foyl5bks2lj20go0kkt9b.jpg";
      break;
    case "华舆":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.523.523.180/006ltCcwly8fj0mgolnllj30f60m8jsu.jpg";
      break;
    case "活力内蒙古":
      image_str = "https://tva1.sinaimg.cn/crop.215.27.705.705.180/87572b25tw1efqg1jonm7j20wn0n3abo.jpg";
      break;
    case "哎呀足球":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.499.499.180/a7b515fbgy1fqo52cxrjxj20dw0dwjuv.jpg";
      break;
    case "杭州网":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/3dcafcb4jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "机器之心Pro":
      image_str = "https://tvax4.sinaimg.cn/crop.21.40.420.420.180/ee3b7d6cly8fdpy29sfxyj20ct0ctdfu.jpg";
      break;
    case "天天体育动态":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.252.252.180/007LLmI8ly8g2qz2h9eekj30at070q31.jpg";
      break;
    case "罗掌柜体育":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.279.279.180/006M6gPngy1fk9jpvc3fjj307s07s3yx.jpg";
      break;
    case "山西广播电视台融媒体":
      image_str = "https://tvax1.sinaimg.cn/crop.95.108.690.690.180/a2f3c171ly8fsaz1r3hlcj20py0pmwig.jpg";
      break;
    case "环京津网":
      image_str = "https://tvax3.sinaimg.cn/crop.111.113.277.277.180/e70f0680ly8g391mk22yxj20dw0dwa9y.jpg";
      break;
    case "环京津新闻网":
      image_str = "https://tvax3.sinaimg.cn/crop.111.113.277.277.180/e70f0680ly8g391mk22yxj20dw0dwa9y.jpg";
      break;
    case "收藏推荐":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.750.750.180/877741ddjw8f1o0t27elnj20ku0kuac0.jpg";
      break;
    case "教育思享":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.600.600.180/0079mFiLly1fyqozgo2ikj30go0godho.jpg";
      break;
    case "汽车葫芦圈":
      image_str = "https://tvax2.sinaimg.cn/crop.20.14.249.249.180/006D0Jfagy1ffab5exegaj307v07vdgb.jpg";
      break;
    case "香哈菜谱":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.500.500.180/7695f849jw8f3tvr2d3okj20dw0dwjs6.jpg";
      break;
    case "中国气象局":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.427.427.180/7e369e7ejw8f89defo49sj20bw0bvjtn.jpg";
      break;
    case "泽学家旅游":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.104.104.180/007ulqdfly1fxgkv7v44lj302x02xgll.jpg";
      break;
    case "郭施亮":
      image_str = "https://tva4.sinaimg.cn/crop.0.17.226.226.180/9d38088agw1edtepf47p8j206c093mxw.jpg";
      break;
    case "FX168财经网":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.199.199.180/006MJihZgy1fhi1f59h2rj305k05kglq.jpg";
      break;
    case "雨融YUKON":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.1080.1080.180/6bbc76e3ly8g89qakczcij20u00u0ad4.jpg";
      break;
    case "RMB财经":
      image_str = "https://tvax1.sinaimg.cn/crop.110.0.465.465.180/006pnhJmly8fwtpvdurj5j30k10cx74v.jpg";
      break;
    case "楚天都市报":
      image_str = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/6693ce84jw8f1m1dfr6sfj2050050aab.jpg";
      break;
    case "GPLP":
      image_str = "https://tvax2.sinaimg.cn/crop.69.88.669.669.180/e959f708ly1g5d2mjytqmj20m80m80tr.jpg";
      break;
    case "明哥侃球":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.119.119.180/007wfJxzly1fy9trjlvysj303c03cmx5.jpg";
      break;
    case "文旅宣汉":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.512.512.180/e7c103ffly8g9paj3wo2hj20e80e8jrv.jpg";
      break;
    case "贵州中公教育":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.178.178.180/6727b875tw1ebnz9edogoj205104zt90.jpg";
      break;
    case "诗词桃花源":
      image_str = "https://tvax1.sinaimg.cn/crop.0.0.996.996.180/e1e9208ely8g4x2fvog24j20ro0rogot.jpg";
      break;
    case "中国农业新闻网":
      image_str = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/7d87b7b8jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "中国质量万里行":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/5102b21cjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "艺水彩":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.1242.1242.180/006UK2v4ly8fphz9qh2cvj30yi0yi406.jpg";
      break;
    case "人人都是产品经理":
      image_str = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/946b9ee2jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "老方说":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.512.512.180/0065JqWply8g23by61yv6j30e80e8wfc.jpg";
      break;
    case "汽车人参考":
      image_str = "https://tvax2.sinaimg.cn/crop.8.0.623.623.180/793671e8ly8fjhudlu8qfj20hs0hbmxm.jpg";
      break;
    case "新疆马南":
      image_str = "https://tvax3.sinaimg.cn/crop.11.0.727.727.180/4a995517ly8flze4bc1llj20ku0k7755.jpg";
      break;
    case "新财知社":
      image_str = "https://tvax4.sinaimg.cn/crop.44.68.731.731.180/006Vv4XGly8g75z69l3t8j30m80m80t7.jpg";
      break;
    case "IT人刘俊明":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.1125.1125.180/006CDegJly8fx10sd8bluj30v90v9tay.jpg";
      break;
    case "安徽妇联":
      image_str = "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.180/007Zb7XEly8g7uai1kc3tj30u00u0gng.jpg";
      break;
    case "科技小蜀黍":
      image_str = "https://tvax3.sinaimg.cn/crop.11.0.984.984.180/006YxNOJly8fuph7eor9gj30ro0rp0un.jpg";
      break;
    case "羽度非凡":
      image_str = "https://tvax4.sinaimg.cn/crop.0.0.996.996.180/66460411ly8fn0s5h8cv6j20ro0rojti.jpg";
      break;
    case "世界邦旅行网":
      image_str = "https://tvax3.sinaimg.cn/crop.0.0.750.750.180/b6f2f6cdly8g4efe7c3ghj20ku0kut95.jpg";
      break;
    case "远景智联":
      image_str = "http://inews.gtimg.com/newsapp_ls/0/10487507309_200200/0";
      break;
    case "达夫观察":
      image_str = "https://pic.rmb.bdstatic.com/527e311b7122403f1cf8dbaea32b224f.jpeg";
      break;
    case "足球大人物":
      image_str = "https://pic.rmb.bdstatic.com/f2477021f4ea39cd5f8ee04f6fbe958c.jpeg";
      break;
    case "楚天情报局":
      image_str = "https://pic.rmb.bdstatic.com/6f80e2ca7d42ed9e4c4175c20cd0cd8c.jpeg";
      break;
    case "中国侨网":
      image_str = "https://tva3.sinaimg.cn/crop.0.0.179.179.180/005BFqhajw1ei54jq1tzwj3050050wen.jpg";
      break;
    case "深度解局":
      image_str = "https://pic.rmb.bdstatic.com/1e72e01221d54a79dba7487d1184b2cc.jpeg";
      break;
    case "说语文":
      image_str = "https://pic.rmb.bdstatic.com/cb0eb0be3e04c35daa3547352e2d4699.jpeg";
      break;
    case "春语美食":
      image_str = "https://pic.rmb.bdstatic.com/2069101272fe474b9cfe787c7d7bd3cc.jpeg";
      break;
    case "小学生那些事":
      image_str = "https://pic.rmb.bdstatic.com/add3733a45750187c559663c30866b7c.jpeg";
      break;
    case "高中数学应试":
      image_str = "https://pic.rmb.bdstatic.com/957c0e8ba77d6e674684ad592ec8335c.jpeg";
      break;
    case "初衣胜雪":
      image_str = "https://pic.rmb.bdstatic.com/9790aa3f5c7ab5b1a1b4114357128f03.jpeg";
      break;
    case "体坛哪些事儿":
      image_str = "https://pic.rmb.bdstatic.com/7c50a83b4a40ad1f4ffd52c2455e3daf.jpeg";
      break;
    case "天外居":
      image_str = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=26dfc95529c117366893c654118b5fec&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F3ba27d62fbf0925c8b9421a377a1c977.jpeg";
      break;
    case "留学益网":
      image_str = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=9e1f3ec1460c4a08f53e61ffddd53ac8&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F47984f9651efc6283269bd4d042d9f2c.jpeg";
      break;
    case "广州队联盟":
      image_str = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=2672ff79c872bb7592d06e8e871a9b22&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F2ed135ea2b4aadb2d1dfda28622bb35d.jpeg";
      break;
    case "遨游世界科学":
      image_str = "https://timg01.bdimg.com/timg?pacompress=&imgtype=3&sec=1439619614&autorotate=1&di=36bbf9cf5771c9e6850e5c297cb68476&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F8736839933ff6c7d969c7b972b6b9f06.png";
      break;
    case "球事百科":
      image_str = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=b83cd8d4927ec6c91fff27ffc36dadd0&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fa75eb583120cce5d969bcb7e4ac54c1d.jpeg";
      break;
    case "王者荣耀小塔TT":
      image_str = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=cb25c4f3c15b5775f662e171882d3c0c&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fa3ff52c7734c3cebff770c35db8e8b52.jpeg";
      break;
    case "大厨洪哥":
      image_str = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=fc4fe231bc9f14f7cde6f83e35fd70e2&quality=100&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F01fe3f8462f7ab1e52b7867b1f1db769.jpeg";
      break;
    case "中国雄安":
      image_str = "https://cambrian-images.cdn.bcebos.com/baa565ab252160137098770ee62dec9a_1540258976633.jpeg";
      break;
    case "客车信息网":
      image_str = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=25f14719604946d1afb5af15ca414037&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fe0ffe32ddc4bcb04d605df29af444caf.jpeg";
      break;
    case "数码小妖精":
      image_str = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=5721b4d230a7514d6e3e8fe5c4d87259&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Fbe79dd5ffb261f26cdf91c9c197ead54.jpeg";
      break;
    case "村长游戏":
      image_str = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=e5cab82a95171ff3dbd332f1877f1d51&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ffbc2601feaabff6a8df950fae5d64563.png";
      break;
    case "大河旅游":
      image_str = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=919370b3b60d6a5c8549ebcae3bbf987&quality=100&size=b640_10097&cut_x=0&cut_y=0&cut_w=640&cut_h=640&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fedfc9fd8503f876384530b4dd6f9f911.png";
      break;
    case "1314书法绘画工作室":
      image_str = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=f12640a9b1862834e3f3958624366726&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fef2309a3b9ca9367d5fac1c281310d86.jpeg";
      break;
    case "中科院物理所":
      image_str = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=afff0145c23812426ea0066354986e9f&quality=100&size=b650_10076&cut_x=0&cut_y=0&cut_w=650&cut_h=650&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F61f0c3cfaee23bd41e8f617a000bb6dd.jpeg";
      break;
    case "校园教育":
      image_str = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=76b656f51e4a1b5bf782b0c678d37c73&quality=100&size=b650_10066&cut_x=0&cut_y=0&cut_w=650&cut_h=650&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fb4db2f35886ec1473786fad86a918ea4.jpeg";
      break;
    default:
      image_str = "https://tvax1.sinaimg.cn/default/images/default_avatar_male_180.gif";
      break;
  }
  return image_str;
}