import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// 默认书籍背景图
const String defaultBookImage = "https://cdn.pixabay.com/photo/2014/04/02/14/06/book-306178_960_720.png";
// 最新书籍背景图
const topNewBookImage = "assets/new_book.jpg";
// 畅销书籍背景图
const topSalesBookImage = "assets/sales_book.jpg";
// 畅销书籍背景图
const topRecBookImage = "assets/sales_book.jpg";
// 推荐书籍轮播图
const recBookImage = "assets/rec_book.jpg";
// 默认影人照片
const defaultCastImage = "https://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png";
// 搜索电影列表背景图
const searchMovieImage = "assets/search_movie.jpg";
// 首页电影列表背景图
const topMovieImage = "assets/top_movie.jpg";
// 经典电影列表背景图
const classicMovieImage = "assets/classic_movie.jpg";
// 好评电影列表背景图
const weeklyMovieImage = "assets/weekly_movie.jpg";


// 获取缓存图片
Widget getCachedImage(String imageSrc,{double width=100,double height=150}){
  return Container(
    child: CachedNetworkImage(
      width: width,
      height: height,
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
  String imageStr;
  switch(source){
    case "CCTV":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.2.97.97.180/c2b99825ly8fy5zxub7o2j202s02smwy.jpg";
      break;
    case "央视网":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.2.97.97.180/c2b99825ly8fy5zxub7o2j202s02smwy.jpg";
      break;
    case "CCTV4":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/79942c81ly8g804eweftrj20u00u0jsf.jpg";
      break;
    case "CCTV5体育新闻":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/685b6e37jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "央视网新闻":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.2.97.97.180/c2b99825ly8fy5zxub7o2j202s02smwy.jpg";
      break;
    case "央视新闻":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.624.624.180/9e5389bbly8g93bx8ug1tj20hc0hcq4l.jpg";
      break;
    case "央视财经":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.1024.1024.180/86a17422jw8f5teqphdovj20sg0sggo0.jpg";
      break;
    case "新华网":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.6.466.466.180/a782e4ably8fed1oss68hj20dw0dw0v2.jpg";
      break;
    case "新华网客户端":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.6.466.466.180/a782e4ably8fed1oss68hj20dw0dw0v2.jpg";
      break;
    case "中国教育服务网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/bfc630cdjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "新华社":
      imageStr = "https://tvax1.sinaimg.cn/crop.31.79.938.938.180/654b47daly8fmhwp1ajjbj20sa0sajw0.jpg";
      break;
    case "新华社新媒体":
      imageStr = "https://tvax1.sinaimg.cn/crop.31.79.938.938.180/654b47daly8fmhwp1ajjbj20sa0sajw0.jpg";
      break;
    case "新华社客户端":
      imageStr = "https://tvax1.sinaimg.cn/crop.31.79.938.938.180/654b47daly8fmhwp1ajjbj20sa0sajw0.jpg";
      break;
    case "新华社图片":
      imageStr = "https://tvax1.sinaimg.cn/crop.31.79.938.938.180/654b47daly8fmhwp1ajjbj20sa0sajw0.jpg";
      break;
    case "第一财经":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.758.758.180/65809478gy1fdeherxvctj20l40l4dho.jpg";
      break;
    case "中关村在线":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.500.500.180/6826f34bly1g4588h2v7sj20dw0dwt9p.jpg";
      break;
    case "中国新闻网":
      imageStr = "https://tva3.sinaimg.cn/crop.13.10.271.271.180/6a5ce645jw8f0pmtva9puj208c08cq3o.jpg";
      break;
    case "钱江晚报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.690.690.180/655eee23jw8ev8xgphpe2j20j60j6q5h.jpg";
      break;
    case "同花顺财经":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/be73d445jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "华夏时报":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/6d97eb17jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "IT168":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.299.299.180/4c342426jw1e83dhz8rawj208c08cjrr.jpg";
      break;
    case "人民日报":
      imageStr = "https://tva1.sinaimg.cn/crop.0.3.1018.1018.180/a716fd45gw1ev7q2k8japj20sg0sg779.jpg";
      break;
    case "人民日报海外网":
      imageStr = "https://tva1.sinaimg.cn/crop.0.3.1018.1018.180/a716fd45gw1ev7q2k8japj20sg0sg779.jpg";
      break;
    case "新京报":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.512.512.180/61ff32dejw8ev91yl3hkdj20e80e8jrt.jpg";
      break;
    case "新京报评论":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.512.512.180/61ff32dejw8ev91yl3hkdj20e80e8jrt.jpg";
      break;
    case "新京报经济新闻":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.1080.1080.180/c2cd8d7bly1fz63df1opnj20u00u0dm2.jpg";
      break;
    case "券商中国":
      imageStr = "https://tva1.sinaimg.cn/crop.5.0.282.282.180/006qbjoyjw8f1xour19iej308207ujs7.jpg";
      break;
    case "大众日报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.1190.1190.180/005TbsAFtw1eog2cy4zacj30x40xcdmf.jpg";
      break;
    case "AI财经社":
      imageStr = "https://tvax2.sinaimg.cn/crop.168.0.387.387.180/8e6f0a11ly8fqfwtbngb1j20ku0b44qp.jpg";
      break;
    case "新浪财经":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/61add7e3jw8elz207ln0lj2050050aad.jpg";
      break;
    case "封面新闻":
      imageStr = "https://tvax2.sinaimg.cn/crop.35.5.526.526.180/593793e5ly8g1r26yfg8gj20gq0f5dfo.jpg";
      break;
    case "钛媒体APP":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.458.458.180/aa0d937dly8floltvss8bj20cq0cqmxx.jpg";
      break;
    case "央广网":
      imageStr = "https://tva1.sinaimg.cn/crop.5.0.175.175.180/6457c157jw8ev743zc8z8j2050050gli.jpg";
      break;
    case "中国青年报":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.1080.1080.180/66eeadffly8g1so1kytefj20u00u0myf.jpg";
      break;
    case "中国青年网":
      imageStr = "http://d.youth.cn/images/youth_sjy_logo.png";
      break;
    case "中国日报网":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.996.996.180/7ece7745ly8g0ltxxsj6nj20ro0roq47.jpg";
      break;
    case "环球网":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.179.179.180/6486a91ajw1ev7ljghtbqj2050050jrc.jpg";
      break;
    case "环球时报":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.200.200.180/75b1a75fly1fmfz7qvv75j205k05kt8p.jpg";
      break;
    case "光明网":
      imageStr = "https://tva2.sinaimg.cn/crop.3.0.146.146.180/6879fe33jw8eswe3rxc90j2046046gln.jpg";
      break;
    case "每日经济新闻":
      imageStr = "https://tva1.sinaimg.cn/crop.17.13.195.195.180/624c6377gw1f2o7dkri5nj206d05vq38.jpg";
      break;
    case "经济之声":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.664.664.180/659d7b0bly8g8540q5nwgj20ig0ih74t.jpg";
      break;
    case "看看新闻Knews":
      imageStr = "https://tva1.sinaimg.cn/crop.11.11.162.162.180/6e05a6dagw1f4al1gu1jaj2050050mx6.jpg";
      break;
    case "人民政协网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.996.996.180/4295214dly8fu02ji1ld6j20ro0ro0te.jpg";
      break;
    case "人民政协报":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.996.996.180/4295214dly8fu02ji1ld6j20ro0ro0te.jpg";
      break;
    case "人民网":
      imageStr = "https://tvax1.sinaimg.cn/crop.191.213.616.616.180/884f7263ly8fx0hnmtt6nj20rs0rsab5.jpg";
      break;
    case "cnBeta":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.512.512.180/a5115c63jw8es8eqieaiaj20e80e80t8.jpg";
      break;
    case "证券之星":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/6e4eaaecly1g8qpwbhivlj20u00u0n15.jpg";
      break;
    case "北晚新视觉网":
      imageStr = "https://tva1.sinaimg.cn/crop.9.0.2027.2027.180/606580aegw1esysv0gfopj21kw1kwtff.jpg";
      break;
    case "极客公园":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/67728821ly8g5jzexcsbpj20u00u0mz5.jpg";
      break;
    case "雷锋网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.100.100.180/7e4980bcjw8f5qyrum4c7j202s02sjr7.jpg";
      break;
    case "浙江新闻":
      imageStr = "https://tvax3.sinaimg.cn/crop.48.50.195.195.180/8172644aly8fsbqbuu9j7j209r0990ss.jpg";
      break;
    case "经济日报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.512.512.180/b5094a1ejw8evv5vfl6wwj20e80e8gnl.jpg";
      break;
    case "中新经纬":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.1024.1024.180/006xCflSjw8f9drcgvq8mj30sg0sggom.jpg";
      break;
    case "北京日报客户端":
      imageStr = "https://tva2.sinaimg.cn/crop.5.5.170.170.180/70e2834djw8ev768osi2uj2050050dfv.jpg";
      break;
    case "经济观察报":
      imageStr = "https://tvax1.sinaimg.cn/crop.21.19.394.394.180/61d83ed4ly8fe4pkbgj7rj20c10c1wf2.jpg";
      break;
    case "澎湃新闻":
      imageStr = "https://tvax1.sinaimg.cn/crop.11.10.275.275.180/005vnhZYly8ftjmwo0bx4j308c08cq32.jpg";
      break;
    case "澎湃在线":
      imageStr = "https://tvax1.sinaimg.cn/crop.11.10.275.275.180/005vnhZYly8ftjmwo0bx4j308c08cq32.jpg";
      break;  
    case "澎湃新闻2019":
      imageStr = "https://tvax1.sinaimg.cn/crop.11.10.275.275.180/005vnhZYly8ftjmwo0bx4j308c08cq32.jpg";
      break;
    case "金融界":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.498.498.180/65928d0fly1flqr726ryaj20dv0dv754.jpg";
      break;
    case "上海发布":
      imageStr = "https://tva2.sinaimg.cn/crop.167.99.1610.1610.180/9764bb42jw8et23v9ytc6j21gh1ghgt8.jpg";
      break;
    case "国际在线":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.640.640.180/621778bbjw8evep35fh10j20hs0hswev.jpg";
      break;
    case "中国经济网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.511.511.180/6328b6bbly1fgjhxyyst3j20e80e8dgm.jpg";
      break;
    case "参考消息":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.1022.1022.180/8d90f0bbjw1ev7oijumy4j20sg0sg0v6.jpg";
      break;
    case "界面新闻":
      imageStr = "https://tva4.sinaimg.cn/crop.353.329.1327.1327.180/005EHRy1jw8ezcb0tieodj31jw1mr78d.jpg";
      break;
    case "证券时报":
      imageStr = "https://tvax1.sinaimg.cn/crop.155.95.310.310.180/633151d5ly8fu3j03idw9j20gk0ecade.jpg";
      break;
    case "旅游视界观":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.751.751.180/9d2ef8ffly8ftifudi708j20kv0kvaaj.jpg";
      break;
    case "爱范儿":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.300.300.180/61e9ece0ly1ftcum4pi1mj208c08c3yb.jpg";
      break;
    case "亿欧网":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.1024.1024.180/976b8e2cjw8f8xjyu074xj20sg0sgabp.jpg";
      break;
    case "红网":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.993.993.180/c875cd12jw8ejgzzdhzwcj20rl0rl75g.jpg";
      break;
    case "新民晚报":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.179.179.180/6793c6f2ly8fifv6uwl8bj2050050q2x.jpg";
      break;
    case "直播港澳台":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.200.200.180/477818b1jw8f3ozsgczsij205k05kmx5.jpg";
      break;
    case "中国军视网":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.200.200.180/005XDnEely8g5k9o44lwnj305k05kglq.jpg";
      break;
    case "新华社体育":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/672f8bf3jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "东方财富网":
      imageStr = "https://tvax2.sinaimg.cn/crop.53.0.586.586.180/6b608346ly8fo0xqf16upj20hs0hsjsm.jpg";
      break;
    case "东方财富快讯":
      imageStr = "https://tvax2.sinaimg.cn/crop.53.0.586.586.180/6b608346ly8fo0xqf16upj20hs0hsjsm.jpg";
      break;
    case "河北新闻网":
      imageStr = "https://tvax1.sinaimg.cn/crop.36.56.964.964.180/7a43b6fely8fqfndbj2vvj20sg0sggoe.jpg";
      break;
    case "中国经济周刊":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.301.301.180/67a31b1aly8fq7ondvzgrj208d08dn0c.jpg";
      break;
    case "虎嗅APP":
      imageStr = "https://tvax1.sinaimg.cn/crop.187.216.917.917.180/8c803935ly8fshge6o9h3j2104104td7.jpg";
      break;
    case "大众网":
      imageStr = "https://tva3.sinaimg.cn/crop.10.17.80.80.180/9c2b5f31jw8fabeazwrqqj202s02saad.jpg";
      break;
    case "广西日报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/d17e913ejw8ev7oukznigj2050050aa4.jpg";
      break;
    case "驱动中国":
      imageStr = "https://tvax3.sinaimg.cn/crop.88.16.295.295.180/7d246e9bly8g23gpquj2yj20cu0cja9y.jpg";
      break;
    case "观察者网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1002.1002.180/707e96d5ly8fy5w9o8sbdj20ru0ru75k.jpg";
      break;
    case "上观新闻":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.968.968.180/e5283560ly1fqejv07mnej20qw0qwwja.jpg";
      break;
    case "农视网":
      imageStr = "https://tva1.sinaimg.cn/crop.2.0.247.247.180/82ae80d3jw8ewth11w9eij206y06y3yy.jpg";
      break;
    case "太平洋电脑网":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.300.300.180/893a3388ly8ft5y6hshqaj208c08ct8u.jpg";
      break;
    case "PingWest品玩":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.828.828.180/a8e44e81ly8g45dyns6tpj20n00n0q3a.jpg";
      break;
    case "直新闻":
      imageStr = "https://tvax3.sinaimg.cn/crop.55.91.976.976.180/006N4ALSly8fxht0cdlh4j30u00wu76g.jpg";
      break;
    case "36氪":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.850.850.180/684ff39bly8fi57d6kk3oj20nm0nm75h.jpg";
      break;
    case "中国商网":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1024.1024.180/74b6b953ly8fzf3ty5qmbj20sg0sgwio.jpg";
      break;
    case "长江日报":
      imageStr = "https://tva4.sinaimg.cn/crop.50.10.464.464.180/712547e4gw1f7k6wp8pslj20fm0eo0uk.jpg";
      break;
    case "华声在线":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.178.178.180/88611984gw1ee1jlsf9jxj204z04z3yr.jpg";
      break;
    case "直播吧":
      imageStr = "https://tvax2.sinaimg.cn/crop.36.23.291.291.180/784fda03gy1fj8ry5o1flj20a4096aaj.jpg";
      break;
    case "红星新闻":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/006FcX4dly8g1r42pey91j30u00u0jsk.jpg";
      break;
    case "房天下":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.299.299.180/9b33b7e3jw1faridia035j208c08cmxq.jpg";
      break;
    case "哈尔滨新闻网":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.750.750.180/65f27d71jw8fdd4eqk065j20ku0kujsm.jpg";
      break;
    case "华尔街见闻":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.399.399.180/6fc2c0e5gw1ejdakew0dnj20b40b4t8t.jpg";
      break;
    case "DoNews":
      imageStr = "https://tva3.sinaimg.cn/crop.0.8.556.556.180/629924f5jw8faqa534sf1j20go0goq37.jpg";
      break;
    case "新浪科技":
      imageStr = "https://tvax1.sinaimg.cn/crop.118.42.486.486.180/61e89b74ly8foeu1q3orsj20jg0epdg6.jpg";
      break;
    case "手机中国网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.118.118.180/67931c2agw1emm2p7czkgj203b03ct8p.jpg";
      break;
    case "CNMO手机中国":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.118.118.180/67931c2agw1emm2p7czkgj203b03ct8p.jpg";
      break;
    case "三湘都市报":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.878.878.180/655546ecgy1fgn3h7nu75j20og0ogdg0.jpg";
      break;
    case "PP体育篮球":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1125.1125.180/007raNBoly8fwu6ao387lj30v90v93z9.jpg";
      break;
    case "政事儿":
      imageStr = "https://tva4.sinaimg.cn/crop.51.63.286.286.180/0069dJbDjw8etgle1aocuj30a90a8aab.jpg";
      break;
    case "政事儿News":
      imageStr = "https://tva4.sinaimg.cn/crop.51.63.286.286.180/0069dJbDjw8etgle1aocuj30a90a8aab.jpg";
      break;
    case "移民帮":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.149.149.180/00633FPegw1f8bedsfgqyj3046046glk.jpg";
      break;
    case "广州日报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.179.179.180/70856785gw1ezgct0epprj2050050q37.jpg";
      break;
    case "中原新闻网":
      imageStr = "https://tvax4.sinaimg.cn/crop.26.0.150.150.180/0076fVfTly8fqnvqhxb7bj305k046mxp.jpg";
      break;
    case "长安街知事":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1125.1125.180/652f5916ly8fugcf9wmppj20v90v9773.jpg";
      break;
    case "四川新闻网":
      imageStr = "https://tvax1.sinaimg.cn/crop.2.2.197.197.180/6530d487ly8g1rg93kyhwj205k05kt8k.jpg";
      break;
    case "信网":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.197.197.180/005LqB8Ltw1elbxd8dhncj305k05idfx.jpg";
      break;
    case "财经郎眼":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.512.512.180/62b57103ly8g4sh4kpp70j20e80e8wfv.jpg";
      break;
    case "懂个球":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.1933.1933.180/006aUGrcjw8euyn3ulaulj31kw1hpaea.jpg";
      break;
    case "青海新闻网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.122.219.219.180/006Duutjly1fecv044flhj30hs0dct9m.jpg";
      break;
    case "纵相新闻":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/007foqvhly8g64vo4l4wbj30u00u0jtc.jpg";
      break;
    case "快科技":
      imageStr = "https://tvax1.sinaimg.cn/crop.71.62.893.893.180/62ec2493ly8fs750zc17gj20sg0sggmn.jpg";
      break;
    case "驱动之家":
      imageStr = "https://tvax1.sinaimg.cn/crop.71.62.893.893.180/62ec2493ly8fs750zc17gj20sg0sggmn.jpg";
      break;
    case "掌上春城":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.132.132.180/005CSIZwjw8fanzgc8ps0j303o03oa9y.jpg";
      break;
    case "太平洋汽车网":
      imageStr = "https://tvax2.sinaimg.cn/crop.9.19.492.492.180/890574d1ly8g95u3brrkwj20e80e8n1z.jpg";
      break;
    case "体坛+":
      imageStr = "https://tvax1.sinaimg.cn/crop.79.45.870.870.180/006ppXykly8g50axldg8uj30sg0sg0tf.jpg";
      break;
    case "证券日报":
      imageStr = "https://tva2.sinaimg.cn/crop.7.8.134.134.180/89c03e60jw1ebmo60k0g0j2046046q2v.jpg";
      break;
    case "中国气象爱好者":
      imageStr = "https://tvax3.sinaimg.cn/crop.20.0.1202.1202.180/69226ed0ly8fn0whdqaogj20yi0xegna.jpg";
      break;
    case "上游新闻":
      imageStr = "https://tva2.sinaimg.cn/crop.3.0.743.743.180/6331ffd1jw8fa8sshjqxwj20ku0knaas.jpg";
      break;
    case "中国江西网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/8b8a27a6jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "金十数据":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.511.511.180/9c4fc2e9gw1f0ca230c2mj20e80e874t.jpg";
      break;
    case "金十数据快讯":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.511.511.180/9c4fc2e9gw1f0ca230c2mj20e80e874t.jpg";
      break;
    case "河北网信管理执法":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.500.500.180/77fe9959ly8g69lscyqtpj20dw0dwn2i.jpg";
      break;
    case "中国经济时报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/6848da0bjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "贵阳网":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.185.185.180/def14da7gw1ebgqv1yz0gj2056056t8z.jpg";
      break;
    case "全景网":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.661.661.180/6875c818ly8g4sfxvddp9j20id0iemxo.jpg";
      break;
    case "天眼新闻":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/007FMvXuly8g117edk2lxj30u00u0gr9.jpg";
      break;
    case "中国经营报":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/be8cde17jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "天极网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/6253056fjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "TechWeb":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/61e61e8cjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "今日商讯":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.179.179.180/006pGFAhgw1f1vgcwn522j30500503yg.jpg";
      break;
    case "红刊财经":
      imageStr = "https://tva4.sinaimg.cn/crop.49.62.891.891.180/006tP5Lbjw1f5ujetlm56j30rh0rhdkq.jpg";
      break;
    case "中青评论":
      imageStr = "https://tvax2.sinaimg.cn/crop.129.23.1009.1009.180/b82820e3ly1ff063x5cwuj20wt0wtwmb.jpg";
      break;
    case "量子位":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.200.200.180/006Fd7o3jw8fbw134ijknj305k05k3ye.jpg";
      break;
    case "时代周报":
      imageStr = "https://tvax2.sinaimg.cn/crop.5.3.624.624.180/61ff4496ly8g4vyi0blrhj20hs0hsta4.jpg";
      break;
    case "河南交通广播":
      imageStr = "https://tva4.sinaimg.cn/crop.232.134.1373.1373.180/674876fdjw8envfij2giyj21el1c8jzd.jpg";
      break;
    case "不看车":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/88443f33ly8g6d4xo8yusj20u00u0jtr.jpg";
      break;
    case "中国台湾网":
      imageStr = "https://tvax3.sinaimg.cn/crop.75.15.166.166.180/65e1a554ly8fy5z4glcw0j208c05kmxd.jpg";
      break;
    case "东哥知旅行":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.798.798.180/a79f80f8ly1fh7m0m96eyj20m80m80yd.jpg";
      break;
    case "全天候科技":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.577.577.180/006PbnLGgy1fgjkmvk8ggj30g20g2q3g.jpg";
      break;
    case "砍柴网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.500.500.180/88422986ly8g05yhgrw7jj20dw0dwmzu.jpg";
      break;
    case "前瞻网":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/9dd1888ajw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "新湖南":
      imageStr = "https://tva2.sinaimg.cn/crop.14.0.600.600.180/006q3UBKgw1fb6mhc49luj30hs0hsac9.jpg";
      break;
    case "解放军新闻传播中心":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.200.200.180/005XDnEely8g5k9o44lwnj305k05kglq.jpg";
      break;
    case "四川农村日报":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.180/7eb5640aly8g6otku61ffj20u00u075i.jpg";
      break;
    case "科技犬":
      imageStr = "https://tvax2.sinaimg.cn/crop.30.0.1075.1075.180/5657b866ly1fu3arh82mvj20vm0u0who.jpg";
      break;
    case "北青网":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.200.200.180/7c9ab006ly8fziybxvm2hj205k05kmxe.jpg";
      break;
    case "面包财经":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.1843.1843.180/bdb2a2f3jw8ex2xcszxc0j21f71f7wi7.jpg";
      break;
    case "读懂财经研究":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.640.640.180/007wWPkmly1fyjz5bii91j30hs0hst99.jpg";
      break;
    case "留学监理网服务":
      imageStr = "https://tva3.sinaimg.cn/crop.1.0.924.924.180/621853e7jw1e84vwtpka6j20pu0pvdlh.jpg";
      break;
    case "兵团日报":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.500.500.180/7750e095ly8ffu1zcr9eej20dw0dwtb8.jpg";
      break;
    case "闪电新闻":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1022.1022.180/006JlhVHly1fha6a0cj8vj30sg0sgwfs.jpg";
      break;
    case "黑龙江日报":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.399.399.180/a7d39f2dtw1et13f72sy1j20b40b4q42.jpg";
      break;
    case "南国都市报":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.547.547.180/74f38b61ly8ffplnxw8r2j20f70f8ac8.jpg";
      break;
    case "蓝鲸财经":
      imageStr = "https://tvax3.sinaimg.cn/crop.40.51.416.416.180/9d3f8b93gy1fg75zm4w80j20e80e83z0.jpg";
      break;
    case "国际艺术大观":
      imageStr = "https://tva4.sinaimg.cn/crop.41.29.551.551.180/9950220btw1eh3p0ywcj8j20hh0hhq4k.jpg";
      break;
    case "国际艺术之大观":
      imageStr = "https://tva4.sinaimg.cn/crop.41.29.551.551.180/9950220btw1eh3p0ywcj8j20hh0hhq4k.jpg";
      break;
    case "共青团中央":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1010.1010.180/eaaf2affly8fmfl4g5qe3j20s20s2wfw.jpg";
      break;
    case "人民论坛网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.179.179.180/d27db3a8tw1emv72xist7j2050050aa9.jpg";
      break;
    case "虎扑体育":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.2048.2048.180/73788edely8fir7dfzkdhj21kw1kwtby.jpg";
      break;
    case "易车":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.240.240.180/71fa320dly1fv6tsgo9pqj206o06o0ti.jpg";
      break;
    case "双姐旅游":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.480.480.180/007Uj1rYly8g55aocjt73j30dc0dcdhm.jpg";
      break;
    case "中宏网豫闻":
      imageStr = "https://tva1.sinaimg.cn/crop.4.0.95.95.180/006m4SMAjw8f05tbg6yj2j302s02sdfp.jpg";
      break;
    case "乐居财经":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.750.750.180/005w7Hxzly8fuhfn4ib1rj30ku0ku0tc.jpg";
      break;
    case "携程旅行":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.332.332.180/88a365d9tw1e8va3p2w0bj2099099dga.jpg";
      break;
    case "好厨网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.127.127.180/a1b82263gw1ej43oreo16j203k03k0sn.jpg";
      break;
    case "中国能源报":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.282.282.180/7f6e880fgw1ei6j7vu1nhj207v07v754.jpg";
      break;
    case "云掌财经":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.256.256.180/006d7Croly8fspi2y6zdbj3074074dg8.jpg";
      break;
    case "中国电力报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/8bb1fe75jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "中管院数字经济中心":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.180.180.180/007Ba72Sly1fzar0qp2ahj30500503z2.jpg";
      break;
    case "雷科技":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.241.241.180/005wwKz0gw1ek7jte4fqpj306q06qdg0.jpg";
      break;
    case "凤凰网房产":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.200.200.180/70b24e20ly1fq8wuotju0j205k05kaa3.jpg";
      break;
    case "凤凰网财经":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.800.800.180/768ab125ly8fnyil3a3klj20m80m8tcg.jpg";
      break;
    case "教育人陈志文":
      imageStr = "https://tvax2.sinaimg.cn/crop.157.252.355.355.180/954e09f4ly8ff7014pdpvj20hq0hsgne.jpg";
      break;
    case "文书车云":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1242.1242.180/61405330ly8ff13euwpbxj20yi0yigna.jpg";
      break;
    case "中国教育在线":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/9bc42bd9ly8fy60sg35rjj20u00u0jse.jpg";
      break;
    case "泡泡网":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.616.616.180/631385cfly8flz0nv5qjtj21kw235qkw.jpg";
      break;
    case "四川在线":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.179.179.180/70818cc9gw1ev7mqa8yn4j2050050gln.jpg";
      break;
    case "海报新闻":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.996.996.180/007uKMadly8fxx3s7c5blj30ro0rodge.jpg";
      break;
    case "e公司":
      imageStr = "https://tva1.sinaimg.cn/crop.33.36.287.287.180/0066Q9xwgw1fbnwrauo2tj30a00a074q.jpg";
      break;
    case "虎扑足球":
      imageStr = "https://tvax2.sinaimg.cn/crop.346.195.163.163.180/653d411ely8g2rjgb6btqj20ne0gk0sq.jpg";
      break;
    case "虎扑足球":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.200.200.180/007aYS2mly8fsbvl3v5pij305k05kq3h.jpg";
      break;
    case "IT之家":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.800.800.180/6cd6d028ly8fme7am50hlj20m80m83yq.jpg";
      break;
    case "渭南青年网":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.149.149.180/dc84152bjw1e7qq06aeq3j2046046mx9.jpg";
      break;
    case "中国网财经":
      imageStr = "https://tvax4.sinaimg.cn/crop.36.8.563.563.180/8db71a36ly1fjz24lbt2fj20go0goq4j.jpg";
      break;
    case "天文在线":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.996.996.180/6bcabf35ly8g3tywl3evqj20ro0ro0w1.jpg";
      break;
    case "巨丰投顾":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.664.664.180/006x0YQ4jw8f5xw5gud8vj30ig0ig3z3.jpg";
      break;
    case "西宁晚报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/7564a59bjw8ev8aqckc70j2050050mx2.jpg";
      break;
    case "马蜂窝":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.500.500.180/67289d66ly8fz1mafho2dj20dw0dwaai.jpg";
      break;
    case "米圣经":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.500.500.180/006YUQjply8fymppfcz6hj30dw0dwjtj.jpg";
      break;
    case "奎子侃球":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.240.240.180/007LQ5yJly8g2qyz6yco0j306o06owep.jpg";
      break;
    case "车壹圈":
      imageStr = "https://tva4.sinaimg.cn/crop.15.3.279.279.180/006CGiE6jw8f9rri01od5j308c08cglv.jpg";
      break;
    case "吴晓波频道":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.640.640.180/005DTzKqly8flwifq9wbxj30hs0hst9f.jpg";
      break;
    case "生活报":
      imageStr = "https://tva4.sinaimg.cn/crop.14.19.602.602.180/712eb195jw1ev8w0dlkrej20hs0hs0tw.jpg";
      break;
    case "四川农村日报":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.180/7eb5640aly8g6otku61ffj20u00u075i.jpg";
      break;
    case "东北网":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/640c4ec2jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "云南台都市条形码":
      imageStr = "https://tva1.sinaimg.cn/crop.2.0.177.177.180/63e9370dgw1ej8kpj1dm0j205004y0sq.jpg";
      break;
    case "半导体投资联盟":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1242.1242.180/006XhJ8Qly8fky96qfnucj30yi0yidh4.jpg";
      break;
    case "镁客网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.900.900.180/006hjnLujw8f02ht9ss0jj30p00p07c7.jpg";
      break;
    case "大摩财经":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1280.1280.180/0073XlYUly1fnu2bj73b2j30zk0zk75s.jpg";
      break;
    case "车域无疆":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.769.769.180/82d1e9a3gw1em2te23u1uj20lf0lfmz5.jpg";
      break;
    case "迷彩虎":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.512.512.180/006yljN9jw8f6vo9d34gmj30e80e8dhm.jpg";
      break;
    case "文汇报":
      imageStr = "https://tva2.sinaimg.cn/crop.3.17.261.261.180/7222c0c0jw8evexaaq8jqj207h07rq30.jpg";
      break;
    case "博科园":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.970.970.180/8413ac87ly8fdl9h4iwbdj20qy0qyx4r.jpg";
      break;
    case "政知见":
      imageStr = "https://mp-video.myzaker.com/image/201905/5cecaf1b7c274f20285e3425.jpg";
      break;
    case "新京报Fun娱乐":
      imageStr = "https://pic.rmb.bdstatic.com/dac739b8e540d54082775bd2fcb211d0.jpeg";
      break;
    case "互联网连线":
      imageStr = "https://pic.rmb.bdstatic.com/40d577cfb8158474d6843f60917b3ce3.jpeg";
      break;
    case "新青年文刊":
      imageStr = "https://pic.rmb.bdstatic.com/91071d1ac16c7187e1c6899fd29694e2.jpeg";
      break;
    case "书法田园":
      imageStr = "https://pic.rmb.bdstatic.com/d06eb97ba9a5ad981aaf36ec1605f419.jpeg";
      break;
    case "胖刘说体育":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=db7723833e2093dd5c5a769b9d5f2988&quality=100&size=b501_10057&cut_x=0&cut_y=2&cut_w=501&cut_h=501&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fa1ed3ceb2a5ed725f31da139d5915368.png";
      break;
    case "艾伦英语部落":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/631e69aaly8g5laquoylgj20u00u0q8x.jpg";
      break;
    case "贝克街探案官":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.180/007Y4Ae2ly8g6r3hwrudrj30u00u0js2.jpg";
      break;
    case "中国军网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/7c34a525jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "动点科技":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.299.299.180/6ffb18f9gw1fay4zfwtuoj208c08cjri.jpg";
      break;
    case "悟空财税官方资讯":
      imageStr = "https://tvax3.sinaimg.cn/crop.9.10.161.161.180/005z4Jvwly8flirx88t1cj3050050q32.jpg";
      break;
    case "股海重生2015":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.750.750.180/006h2s9Ajw8exp4oum5orj30ku0kv0u4.jpg";
      break;
    case "探旅":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.996.996.180/006y9jA7ly8fw1pa9lwf3j30ro0rpdgo.jpg";
      break;
    case "中国山东网":
      imageStr = "https://tvax2.sinaimg.cn/crop.2.0.197.197.180/64a82e50ly1fl2k8gzi2rj205k05kt8o.jpg";
      break;
    case "工人日报":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.180.180.180/e4ed7abfly1g1uyc9onnyj2050050t8u.jpg";
      break;
    case "中国财富网官方":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.833.833.180/006HdDhlly8ff096ziuj0j30n50n57b4.jpg";
      break;
    case "车动态":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.1328.1328.180/005AtOc1jw8f3trtu8f7dj310w10wjt8.jpg";
      break;
    case "余丰慧":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.1242.1242.180/45554c9ajw8f3rexuzxm9j20yi0yigpg.jpg";
      break;
    case "河南日报客户端":
      imageStr = "https://tva3.sinaimg.cn/crop.18.4.525.525.180/c40841edjw8ev80iqd0nqj20fa0faabq.jpg";
      break;
    case "长春教育八卦阵":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.130.773.773.180/006EjfPqly8ft76ctbfhwj31kw0sgthw.jpg";
      break;
    case "新通教育":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.70.600.600.180/52ede162ly1foyl5bks2lj20go0kkt9b.jpg";
      break;
    case "华舆":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.523.523.180/006ltCcwly8fj0mgolnllj30f60m8jsu.jpg";
      break;
    case "活力内蒙古":
      imageStr = "https://tva1.sinaimg.cn/crop.215.27.705.705.180/87572b25tw1efqg1jonm7j20wn0n3abo.jpg";
      break;
    case "哎呀足球":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.499.499.180/a7b515fbgy1fqo52cxrjxj20dw0dwjuv.jpg";
      break;
    case "杭州网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/3dcafcb4jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "机器之心Pro":
      imageStr = "https://tvax4.sinaimg.cn/crop.21.40.420.420.180/ee3b7d6cly8fdpy29sfxyj20ct0ctdfu.jpg";
      break;
    case "天天体育动态":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.252.252.180/007LLmI8ly8g2qz2h9eekj30at070q31.jpg";
      break;
    case "罗掌柜体育":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.279.279.180/006M6gPngy1fk9jpvc3fjj307s07s3yx.jpg";
      break;
    case "山西广播电视台融媒体":
      imageStr = "https://tvax1.sinaimg.cn/crop.95.108.690.690.180/a2f3c171ly8fsaz1r3hlcj20py0pmwig.jpg";
      break;
    case "环京津网":
      imageStr = "https://tvax3.sinaimg.cn/crop.111.113.277.277.180/e70f0680ly8g391mk22yxj20dw0dwa9y.jpg";
      break;
    case "环京津新闻网":
      imageStr = "https://tvax3.sinaimg.cn/crop.111.113.277.277.180/e70f0680ly8g391mk22yxj20dw0dwa9y.jpg";
      break;
    case "收藏推荐":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.750.750.180/877741ddjw8f1o0t27elnj20ku0kuac0.jpg";
      break;
    case "教育思享":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.600.600.180/0079mFiLly1fyqozgo2ikj30go0godho.jpg";
      break;
    case "汽车葫芦圈":
      imageStr = "https://tvax2.sinaimg.cn/crop.20.14.249.249.180/006D0Jfagy1ffab5exegaj307v07vdgb.jpg";
      break;
    case "香哈菜谱":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.500.500.180/7695f849jw8f3tvr2d3okj20dw0dwjs6.jpg";
      break;
    case "中国气象局":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.427.427.180/7e369e7ejw8f89defo49sj20bw0bvjtn.jpg";
      break;
    case "泽学家旅游":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.104.104.180/007ulqdfly1fxgkv7v44lj302x02xgll.jpg";
      break;
    case "郭施亮":
      imageStr = "https://tva4.sinaimg.cn/crop.0.17.226.226.180/9d38088agw1edtepf47p8j206c093mxw.jpg";
      break;
    case "FX168财经网":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.199.199.180/006MJihZgy1fhi1f59h2rj305k05kglq.jpg";
      break;
    case "雨融YUKON":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.1080.1080.180/6bbc76e3ly8g89qakczcij20u00u0ad4.jpg";
      break;
    case "RMB财经":
      imageStr = "https://tvax1.sinaimg.cn/crop.110.0.465.465.180/006pnhJmly8fwtpvdurj5j30k10cx74v.jpg";
      break;
    case "楚天都市报":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/6693ce84jw8f1m1dfr6sfj2050050aab.jpg";
      break;
    case "GPLP":
      imageStr = "https://tvax2.sinaimg.cn/crop.69.88.669.669.180/e959f708ly1g5d2mjytqmj20m80m80tr.jpg";
      break;
    case "明哥侃球":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.119.119.180/007wfJxzly1fy9trjlvysj303c03cmx5.jpg";
      break;
    case "文旅宣汉":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.512.512.180/e7c103ffly8g9paj3wo2hj20e80e8jrv.jpg";
      break;
    case "贵州中公教育":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.178.178.180/6727b875tw1ebnz9edogoj205104zt90.jpg";
      break;
    case "诗词桃花源":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.996.996.180/e1e9208ely8g4x2fvog24j20ro0rogot.jpg";
      break;
    case "中国农业新闻网":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/7d87b7b8jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "中国质量万里行":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/5102b21cjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "艺水彩":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1242.1242.180/006UK2v4ly8fphz9qh2cvj30yi0yi406.jpg";
      break;
    case "人人都是产品经理":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/946b9ee2jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "老方说":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.512.512.180/0065JqWply8g23by61yv6j30e80e8wfc.jpg";
      break;
    case "汽车人参考":
      imageStr = "https://tvax2.sinaimg.cn/crop.8.0.623.623.180/793671e8ly8fjhudlu8qfj20hs0hbmxm.jpg";
      break;
    case "新疆马南":
      imageStr = "https://tvax3.sinaimg.cn/crop.11.0.727.727.180/4a995517ly8flze4bc1llj20ku0k7755.jpg";
      break;
    case "新财知社":
      imageStr = "https://tvax4.sinaimg.cn/crop.44.68.731.731.180/006Vv4XGly8g75z69l3t8j30m80m80t7.jpg";
      break;
    case "IT人刘俊明":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1125.1125.180/006CDegJly8fx10sd8bluj30v90v9tay.jpg";
      break;
    case "安徽妇联":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.180/007Zb7XEly8g7uai1kc3tj30u00u0gng.jpg";
      break;
    case "科技小蜀黍":
      imageStr = "https://tvax3.sinaimg.cn/crop.11.0.984.984.180/006YxNOJly8fuph7eor9gj30ro0rp0un.jpg";
      break;
    case "羽度非凡":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.996.996.180/66460411ly8fn0s5h8cv6j20ro0rojti.jpg";
      break;
    case "世界邦旅行网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.750.750.180/b6f2f6cdly8g4efe7c3ghj20ku0kut95.jpg";
      break;
    case "安徽网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.296.296.180/6ba09194jw8elz29ivgmwj2088088mxg.jpg";
      break;
    case "中国搜索":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.919.919.180/005vofNuly8fy4xju80yrj30pk0pkjst.jpg";
      break;
    case "河南商报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.176.176.180/657fef28jw8eswl25wqxlj204w04wjrg.jpg";
      break;
    case "叮咚体坛":
      imageStr = "https://tva3.sinaimg.cn/crop.0.15.1242.1242.180/006ivIdqjw8fd48dytmaoj30yi0zdq4w.jpg";
      break;
    case "猎云网":
      imageStr = "https://tvax1.sinaimg.cn/crop.46.68.724.724.180/a8401473ly8fdi1v5y1n1j20m80m8dhq.jpg";
      break;
    case "锌刻度":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.424.2048.2048.180/4b72f345ly1fwtphhxue5j21kw28hh43.jpg";
      break;
    case "深响":
      imageStr = "https://tvax4.sinaimg.cn/crop.40.45.518.518.180/0075xkuFly1g8aj1c2sgkj30go0gomx5.jpg";
      break;
    case "17173游戏网":
      imageStr = "https://tva3.sinaimg.cn/crop.21.35.354.354.180/70e08490jw8f5q4z5ieucj20b40b4wep.jpg";
      break;
    case "大电竞":
      imageStr = "https://tvax2.sinaimg.cn/crop.1.0.509.509.180/006mEiMGly8fmvejoi57oj30e80e574f.jpg";
      break;
    case "游戏十三哥":
      imageStr = "https://tvax3.sinaimg.cn/crop.35.0.307.307.180/8e14313bly8fopk9pihivj20fd0d6djm.jpg";
      break;
    case "GameRes游资网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1024.1024.180/547f46d9ly8fet8ttboduj20sg0sgmya.jpg";
      break;
    case "极电竞":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.360.360.180/007VU6Qsly1g5osjhiayoj30a00a0wep.jpg";
      break;
    case "大象游媒":
      imageStr = "https://tvax4.sinaimg.cn/crop.8.0.591.591.180/007PZrBOly1g3w7f1jfvfj30go0gogmy.jpg";
      break;
    case "3DMGAME":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.500.500.180/80f256c3ly8foq7is27zvj20dw0dwmyc.jpg";
      break;
    case "叶子猪游戏网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/53a25401gw1e7bu6kv3efj2050050mx8.jpg";
      break;
    case "迅游游戏":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.594.594.180/007emlX1ly1fu29d98axbj30hs0hsq3r.jpg";
      break;
    case "搜狐财经":
      imageStr = "https://tvax3.sinaimg.cn/crop.52.0.400.400.180/738a0158ly8fz78gwkv04j20dw0b4t9t.jpg";
      break;
    case "科学网":
      imageStr = "https://tva4.sinaimg.cn/crop.9.9.159.159.180/670eab70jw8f51i1ee1smj205004zjrg.jpg";
      break;
    case "Tech星球":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.640.640.180/81c848f7ly1g6hqlnlv6lj20hs0hswfm.jpg";
      break;
    case "搜狐科技":
      imageStr = "https://tvax2.sinaimg.cn/crop.89.56.470.470.180/6b234a40ly8fwi8zgu754j20iq0frmxn.jpg";
      break;
    case "牛弹琴":
      imageStr = "https://tva3.sinaimg.cn/crop.1.12.240.240.180/4c1e905cjw1f74u83ab82j206u07kq42.jpg";
      break;
    case "北京商报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.830.830.180/768850e7jw8evym3xgylcj20n50n20wt.jpg";
      break;
    case "市界":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1575.1575.180/0073JeVely1fnsu14okc0j317r17rq72.jpg";
      break;
    case "脑洞历史观":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.512.512.180/407915b5ly8g7d5qdl8foj20e80e874k.jpg";
      break;
    case "游研社":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.996.996.180/9d0d09ably8foq7clnhjwj20ro0ro3yv.jpg";
      break;
    case "游戏攻略社":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.200.200.180/007oEoxcly8g1imcign21j305k05kdfz.jpg";
      break;
    case "正经说游戏":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.599.599.180/c466114bly1ga00aumf3fj20gn0gowf4.jpg";
      break;
    case "9分游戏":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.192.192.180/007yAV0aly8fz0kkhhoffj305g05dmx8.jpg";
      break;
    case "TapTap":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.512.512.180/006ww0fFjw8f5mq9n5jnuj30e80e80ta.jpg";
      break;
    case "18183手游网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/b96172c5jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "网上车市":
      imageStr = "https://tvax4.sinaimg.cn/crop.5.40.750.750.180/6a16e19bly1g89bt0je0aj20m80m8tap.jpg";
      break;
    case "autocarweekly":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.1242.1242.180/c8a5945cjw8f24qj6w163j20yi0yi0v9.jpg";
      break;
    case "当乐手游":
      imageStr = "https://tvax1.sinaimg.cn/crop.215.0.305.305.180/695c9405ly8g1h5jbwozsj20fa09jwha.jpg";
      break;
    case "车讯网":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.873.873.180/6fe7793fly8fq65kfit1fj20oa0oataf.jpg";
      break;
    case "虎搜体育":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.180.180.180/0074AXj6ly8fodmxo1v1xj3050050wel.jpg";
      break;
    case "中国社会科学网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.122.122.180/8334ccc6jw8f2v4xmpkz7j203f03fq2w.jpg";
      break;
    case "远景智联":
      imageStr = "http://inews.gtimg.com/newsapp_ls/0/10487507309_200200/0";
      break;
    case "达夫观察":
      imageStr = "https://pic.rmb.bdstatic.com/527e311b7122403f1cf8dbaea32b224f.jpeg";
      break;
    case "足球大人物":
      imageStr = "https://pic.rmb.bdstatic.com/f2477021f4ea39cd5f8ee04f6fbe958c.jpeg";
      break;
    case "楚天情报局":
      imageStr = "https://pic.rmb.bdstatic.com/6f80e2ca7d42ed9e4c4175c20cd0cd8c.jpeg";
      break;
    case "中国侨网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.179.179.180/005BFqhajw1ei54jq1tzwj3050050wen.jpg";
      break;
    case "深度解局":
      imageStr = "https://pic.rmb.bdstatic.com/1e72e01221d54a79dba7487d1184b2cc.jpeg";
      break;
    case "说语文":
      imageStr = "https://pic.rmb.bdstatic.com/cb0eb0be3e04c35daa3547352e2d4699.jpeg";
      break;
    case "春语美食":
      imageStr = "https://pic.rmb.bdstatic.com/2069101272fe474b9cfe787c7d7bd3cc.jpeg";
      break;
    case "小学生那些事":
      imageStr = "https://pic.rmb.bdstatic.com/add3733a45750187c559663c30866b7c.jpeg";
      break;
    case "高中数学应试":
      imageStr = "https://pic.rmb.bdstatic.com/957c0e8ba77d6e674684ad592ec8335c.jpeg";
      break;
    case "初衣胜雪":
      imageStr = "https://pic.rmb.bdstatic.com/9790aa3f5c7ab5b1a1b4114357128f03.jpeg";
      break;
    case "体坛哪些事儿":
      imageStr = "https://pic.rmb.bdstatic.com/7c50a83b4a40ad1f4ffd52c2455e3daf.jpeg";
      break;
    case "雷帝触网":
      imageStr = "https://pic.rmb.bdstatic.com/95126ed7b5eead8d4724dc0afe88e0b2.jpeg";
      break;
    case "潮闻知天下":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=88f3a04b524ba5e8dea521eff23a948b&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F152001063259d6cff6fc1fbfbe25f9e427b7c582cf.jpeg";
      break;
    case "天外居":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=26dfc95529c117366893c654118b5fec&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F3ba27d62fbf0925c8b9421a377a1c977.jpeg";
      break;
    case "留学益网":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=9e1f3ec1460c4a08f53e61ffddd53ac8&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F47984f9651efc6283269bd4d042d9f2c.jpeg";
      break;
    case "广州队联盟":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=2672ff79c872bb7592d06e8e871a9b22&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F2ed135ea2b4aadb2d1dfda28622bb35d.jpeg";
      break;
    case "遨游世界科学":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=3&sec=1439619614&autorotate=1&di=36bbf9cf5771c9e6850e5c297cb68476&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F8736839933ff6c7d969c7b972b6b9f06.png";
      break;
    case "球事百科":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=b83cd8d4927ec6c91fff27ffc36dadd0&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fa75eb583120cce5d969bcb7e4ac54c1d.jpeg";
      break;
    case "王者荣耀小塔TT":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=cb25c4f3c15b5775f662e171882d3c0c&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fa3ff52c7734c3cebff770c35db8e8b52.jpeg";
      break;
    case "大厨洪哥":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=fc4fe231bc9f14f7cde6f83e35fd70e2&quality=100&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F01fe3f8462f7ab1e52b7867b1f1db769.jpeg";
      break;
    case "中国雄安":
      imageStr = "https://cambrian-images.cdn.bcebos.com/baa565ab252160137098770ee62dec9a_1540258976633.jpeg";
      break;
    case "客车信息网":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=25f14719604946d1afb5af15ca414037&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fe0ffe32ddc4bcb04d605df29af444caf.jpeg";
      break;
    case "数码小妖精":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=5721b4d230a7514d6e3e8fe5c4d87259&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Fbe79dd5ffb261f26cdf91c9c197ead54.jpeg";
      break;
    case "村长游戏":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=e5cab82a95171ff3dbd332f1877f1d51&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ffbc2601feaabff6a8df950fae5d64563.png";
      break;
    case "大河旅游":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=919370b3b60d6a5c8549ebcae3bbf987&quality=100&size=b640_10097&cut_x=0&cut_y=0&cut_w=640&cut_h=640&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fedfc9fd8503f876384530b4dd6f9f911.png";
      break;
    case "1314书法绘画工作室":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=f12640a9b1862834e3f3958624366726&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fef2309a3b9ca9367d5fac1c281310d86.jpeg";
      break;
    case "中科院物理所":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=afff0145c23812426ea0066354986e9f&quality=100&size=b650_10076&cut_x=0&cut_y=0&cut_w=650&cut_h=650&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F61f0c3cfaee23bd41e8f617a000bb6dd.jpeg";
      break;
    case "校园教育":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=76b656f51e4a1b5bf782b0c678d37c73&quality=100&size=b650_10066&cut_x=0&cut_y=0&cut_w=650&cut_h=650&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fb4db2f35886ec1473786fad86a918ea4.jpeg";
      break;
    default:
      imageStr = "https://tvax1.sinaimg.cn/default/images/default_avatar_male_180.gif";
      break;
  }
  return imageStr;
}