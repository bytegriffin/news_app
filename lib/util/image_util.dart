import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


// 默认书籍背景图
const String defaultBookImage = "https://img3.doubanio.com/f/ark/fcf839063281097eb229b77eddfdbb03d0ec8a5e/pics/app/default-cover.png";
// 最新书籍背景图
const topNewBookImage = "assets/new_book.jpg";
// 畅销书籍背景图
const topSalesBookImage = "assets/sales_book.jpg";
// 畅销书籍背景图
const topRecBookImage = "assets/sales_book.jpg";
// 推荐书籍轮播图
const recBookImage = "assets/rec_book.jpg";
// 热门英文书籍轮播图
const hotEnglishBookImage = "assets/hot_english_book.jpg";
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
// 默认音乐图片
const defaultMusicImage = defaultCastImage;
// 最新音乐背景图
const topNewMusicImage = "assets/new_music.jpg";

// 获取缓存图片
Widget getCachedImage(String imageSrc,{double width=100,double height=150}){
  return Container(
    child: CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.cover,
      imageUrl: imageSrc,
//      placeholder: (context, url) => CircularProgressIndicator(
//
//      ),
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
    case "新京报官微":
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
    case "电玩巴士":
      imageStr = "https://tvax3.sinaimg.cn/crop.91.125.805.805.180/bd012302ly8g72ayhlincj20rs0rsgpc.jpg";
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
    case "荔枝新闻":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.751.751.180/6b0e1e9dly8g9w55vahltj20kv0kvju6.jpg";
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
    case "中国新闻周刊":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.179.179.180/61e6c012gw1ev930c1e5sj2050050t8w.jpg";
      break;
    case "三言财经":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1002.1002.180/0074jgZUly8g0hnj8r19vj30ru0ruaba.jpg";
      break;
    case "中国长安网":
      imageStr = "http://pic.rmb.bdstatic.com/dcc360cabeab23744cbe60d5254e86ec.jpeg";
      break;
    case "武汉交通广播":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.512.512.180/72260dd3ly8fx9yg2dr3ej20e80e8q3d.jpg";
      break;
    case "吉林日报":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.430.430.180/c14917b7jw8ew4a6vlovyj20by0bywf9.jpg";
      break;
    case "网信天津":
      imageStr = "https://tvax4.sinaimg.cn/crop.200.0.500.500.180/006ntL7Dly8fzgfnz9xi1j30p00dwt98.jpg";
      break;
    case "百度":
      imageStr = "https://tvax4.sinaimg.cn/crop.30.17.398.398.180/968408a0ly8g5s8ini53rj20ce0cf75h.jpg";
      break;
    case "潇湘晨报官方":
      imageStr = "http://pic.rmb.bdstatic.com/a51d142ac7625feda1002f0c739ae255.jpeg";
      break;
    case "畅娱网络":
      imageStr = "https://pic.rmb.bdstatic.com/2cde6568749a78fbe4f94f60b7ba1c3d.jpeg";
      break;
    case "南方新闻网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/b7246b83jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "缅甸中文网":
      imageStr = "http://pic.rmb.bdstatic.com/e0700a40ccce2aaa67a06fa418df0f7a.jpeg";
      break;
    case "野球帝侃球":
      imageStr = "https://pic.rmb.bdstatic.com/b97e97f96170dddae930e278b41735f9.png";
      break;
    case "足坛平头哥":
      imageStr = "https://pic.rmb.bdstatic.com/363830d4e46e14e16536a9e2aa75d6b4.jpeg";
      break;
    case "长江号外":
      imageStr = "https://pic.rmb.bdstatic.com/5ca82dfca22a550593bb2a1962c05981.jpeg@s_2,w_272,h_272,q_80";
      break;
    case "长安观察":
      imageStr = "https://wx1.sinaimg.cn/large/70e2834dly1g3a2ip3rx9j209d09dmxx.jpg";
      break;
    case "西安日报":
      imageStr = "https://tvax4.sinaimg.cn/crop.7.7.172.172.180/70be0d54ly8g0vgcrf9xpj2050050jrj.jpg?KID=imgbed,tva&Expires=1580300190&ssig=B3LEfnyJAo";
      break;
    case "多特体育":
      imageStr = "https://pic.rmb.bdstatic.com/409ebb0fb533cde552940f5da53268da.jpeg";
      break;
    case "紫禁城":
      imageStr = "http://pic.rmb.bdstatic.com/3fb55b78001c0cdb0dfc9d73e48284de.jpeg";
      break;
    case "健康时报客户端":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.199.199.180/006bdjQZjw1f557ifwmrwj305k05kq3d.jpg";
      break;
    case "燕赵都市报":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/6797d866tw1esxjvtcelaj2050050aa7.jpg";
      break;
    case "齐鲁壹点":
      imageStr = "http://pic.rmb.bdstatic.com/5bf4df2227438a9c089abab05ed14995.jpeg";
      break;
    case "平安中原":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/755a7935jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "四川观察":
      imageStr = "http://pic.rmb.bdstatic.com/add0408778c51d4b0970bfb80e1e2af5.png";
      break;
    case "沈阳网警巡查执法":
      imageStr = "https://himg.bdimg.com/sys/portrait/item/c169e6b288e998b3e7bd91e8ada6e172.jpg";
      break;
    case "北京吃货小分队":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/7f03c225jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "马继华":
      imageStr = "https://pic.rmb.bdstatic.com/e0aafce70370ba8d4448d1e4b6286b96.jpeg";
      break;
    case "益阳日报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/7e60d327jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "内蒙古日报":
      imageStr = "https://tvax4.sinaimg.cn/crop.237.2.1394.1394.180/e9a06574ly1fey6ezuaquj21b812w0zn.jpg";
      break;
    case "中国网地产":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.180.180.180/71fa4b07ly8fmtyy23rynj2050050weh.jpg";
      break;
    case "福州新闻网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/9834e914jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "希财网":
      imageStr = "https://pic.rmb.bdstatic.com/bf8e6b89febe13436775f38c16170c64.jpeg";
      break;
    case "花果科技":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/9bf41753ly8g4425vpki2j20u00u0jsi.jpg";
      break;
    case "孟永辉":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.996.996.180/4b4d206bly8g12nl89typj20ro0rowgh.jpg";
      break;
    case "星球日报":
      imageStr = "https://pic.rmb.bdstatic.com/2a1b49ca7ba7c44c7eec31ca4f77038f.jpeg";
      break;
    case "兰州新闻网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.179.179.180/c055b1fbtw1e781r83qfcj2050050mxb.jpg";
      break;
    case "C114通信网":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.300.300.180/70cd5db9ly1fuif4x6y5vj208c08cjrb.jpg";
      break;
    case "XCiOS俱乐部":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.1000.1000.180/e194ff99ly8g64z9g1m8xj20rs0rs7hw.jpg";
      break;
    case "CDA数据分析师":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.850.850.180/da02ca44ly8ga6mx3g86cj20nm0nmn09.jpg";
      break;
    case "雨果网":
      imageStr = "https://tvax3.sinaimg.cn/crop.35.38.241.241.180/c16fceb8ly8g11agrjc9mj208c08cjrx.jpg";
      break;
    case "电商报":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.499.499.180/74a0e24egw1f7l4sni6t1j20dw0dwq4e.jpg";
      break;
    case "证券市场红周刊":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.179.179.180/6248f657ly1g59lqbe048j20500503ym.jpg";
      break;
    case "福布斯中国":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.2048.2048.180/006yYeT0jw8f9rm0t8c5gj31kw1kwdks.jpg";
      break;
    case "电网头条":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.945.945.180/006ncSK8jw8f1afmgkd4yj30q90q9wg5.jpg";
      break;
    case "链得得APP":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.512.512.180/007518f9ly8foytx0w9jgj30e80e80vp.jpg";
      break;
    case "贵州都市报":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1006.1006.180/75a34701ly8fmv9jtd1yaj20ry0ryaav.jpg";
      break;
    case "西安发布":
      imageStr = "https://tvax3.sinaimg.cn/crop.23.33.355.355.180/dff1d1efly8fyqbr5nd1jj20b40b4mxs.jpg";
      break;
    case "江苏新闻":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/4d997b7cly8g9w2hzmo47j20u00u03zw.jpg";
      break;
    case "蜂鸟网":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/4d997b7cly8g9w2hzmo47j20u00u03zw.jpg";
      break;
    case "中国普法":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/d3792935jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "福州新闻网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/9834e914jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "郑州晚报":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.750.750.180/7941ad24ly8gbz9eo37uaj20ku0ku0tw.jpg";
      break;
    case "大河网":
      imageStr = "https://pic.rmb.bdstatic.com/02dc534e0bba9a71cf6088530b0c4e51.jpeg";
      break;
    case "人民邮电报":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.833.833.180/70df6ccfly8fn1zuiainzj20n60n60ub.jpg";
      break;
    case "呼和浩特日报":
      imageStr = "https://pic.rmb.bdstatic.com/d4c3b834d969d36d30710ac797fb0b00.jpeg";
      break;
    case "大白财经观察":
      imageStr = "https://tvax3.sinaimg.cn/crop.176.108.480.480.180/0080Mg1Uly1g9ce3mm12xj30m80jdjst.jpg";
      break;
    case "新京报外事儿":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.640.640.180/007aap7Rly8fruh8uxfqqj30hs0hsjso.jpg";
      break;
    case "河北青年报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.179.179.180/65802539tw1ef04f4ct1jj20500500su.jpg";
      break;
    case "全国能源信息平台":
      imageStr = "https://pic.rmb.bdstatic.com/2bdb7375eb7ee940a25133b0e765aa07.jpeg";
      break;
    case "河南都市频道":
      imageStr = "https://pic.rmb.bdstatic.com/a73d63d5d6a5b94de60853a8bd4045bd.jpeg";
      break;
    case "陕西法制网":
      imageStr = "https://pic.rmb.bdstatic.com/7337cde7e7c57514e71355e8f395eef7.jpeg";
      break;
    case "呼伦贝尔发布":
      imageStr = "https://tva4.sinaimg.cn/crop.0.1.954.954.180/90448215jw1ev7rrol19xj20qp0qo0xk.jpg";
      break;
    case "陕西中公教育":
      imageStr = "https://pic.rmb.bdstatic.com/a6963799b80b3184c8c581a367ebcff9.jpeg";
      break;
    case "与欧洲有关的一切":
      imageStr = "https://pic.rmb.bdstatic.com/f22ca44560ac175a68fa7c86526f7766.jpeg";
      break;
    case "人民湖北":
      imageStr = "https://pic.rmb.bdstatic.com/80d5cb87fba4d923438fca0a291158d4.jpeg";
      break;
    case "生态环境部":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.180.180.180/006C3CYZly8fpmipe9b4sj3050050mxd.jpg";
      break;
    case "网易航空":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1000.1000.180/bf7cb792ly8gc315epnv1j20rs0rsab9.jpg";
      break;
    case "网易航空航天":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1000.1000.180/bf7cb792ly8gc315epnv1j20rs0rsab9.jpg";
      break;
    case "凤凰金融":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.640.640.180/005OiUTely8fqowkh1mezj30hs0hsaan.jpg";
      break;
    case "凤凰金融官方微博":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.640.640.180/005OiUTely8fqowkh1mezj30hs0hsaan.jpg";
      break;
    case "潇湘晨报":
      imageStr = "https://pic.rmb.bdstatic.com/a51d142ac7625feda1002f0c739ae255.jpeg";
      break;
    case "大观新闻":
      imageStr = "https://tvax1.sinaimg.cn/crop.116.100.307.307.180/006Zd6d0ly8flbtf92fhaj30fe0efgos.jpg";
      break;
    case "长春发布":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/c2ed86dfjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "极客网FromGeek":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.515.515.180/006y2GX1jw8f6outtabdfj30eb0ebmxi.jpg";
      break;
    case "美食天下":
      imageStr = "https://cambrian-images.cdn.bcebos.com/af9b5e52ac4d5fb45d9cbdd9755be2ee_1516095545023.jpeg";
      break;
    case "销客巴巴":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.100.100.180/007BlTWWly8g04uy1fow7j302s02s0sy.jpg";
      break;
    case "米拍摄影":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.440.440.180/005EoSally8g0n5latkxzj30c80c8a9z.jpg";
      break;
    case "米拍摄影社区":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.440.440.180/005EoSally8g0n5latkxzj30c80c8a9z.jpg";
      break;
    case "会计网":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.800.800.180/89d13d66ly8ga7rsocyqej20m80m8aar.jpg";
      break;
    case "说教育":
      imageStr = "https://pic.rmb.bdstatic.com/6988afa662bb888760e8055859409e4c.jpeg";
      break;
    case "股市布道者":
      imageStr = "https://pic.rmb.bdstatic.com/d5c319492081dd89b55855dbe6f0689d.jpeg";
      break;
    case "肆客足球":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.500.500.180/006dtEpDly1fmt1j5amlzj30dw0dwq41.jpg";
      break;
    case "肆客足球App":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.500.500.180/006dtEpDly1fmt1j5amlzj30dw0dwq41.jpg";
      break;
    case "睿宸智辉":
      imageStr = "https://pic.rmb.bdstatic.com/3b38730863cb8c8d853541bc92c7ef0b.jpeg";
      break;
    case "格隆汇":
      imageStr = "https://bkimg.cdn.bcebos.com/pic/11385343fbf2b211da68beffc78065380cd78e38";
      break;
    case "排球黄金眼":
      imageStr = "https://tvax1.sinaimg.cn/crop.57.74.166.166.180/007VR5QRly8g63vy14xd5j308c08cq49.jpg";
      break;
    case "海南日报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.1024.1024.180/bf0518fajw8fb6ay2k1nej20sg0sg77q.jpg";
      break;
    case "国是直通车":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.996.996.180/006FSgCbly8gbqk9dmfwej30ro0rowfr.jpg";
      break;
    case "人民日报评论":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.750.750.180/6e142e12jw8f29dh6zyrij20ku0kumxs.jpg";
      break;
    case "健康时报社":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/665781cejw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "游娱大事件":
      imageStr = "https://pic.rmb.bdstatic.com/6b4b0f5d318c72f8cd41b9312d6afe76.jpeg";
      break;
    case "财经宋建文":
      imageStr = "https://pic.rmb.bdstatic.com/7a6edd8e6b4f3854710244dc81b76e0f.jpeg";
      break;
    case "庐阳发布":
      imageStr = "https://pic.rmb.bdstatic.com/992e5b3988c40c61f7198cf3d2a57e76.jpeg";
      break;
    case "中国科协":
      imageStr = "https://pic.rmb.bdstatic.com/2fe2f598622726dd8f7991de5e8a153a.jpeg";
      break;
    case "黑子侃体育":
      imageStr = "http://pic.rmb.bdstatic.com/7dfb452c169be3ec62d96b7df459d92f.jpeg";
      break;
    case "中商情报网":
      imageStr = "https://pic.rmb.bdstatic.com/c2fd4b56f7025a548e16d0a4b3a0c3ae.jpeg";
      break;
    case "欧洲时报官方":
      imageStr = "https://tva4.sinaimg.cn/crop.358.0.1361.1361.180/691a9bd0jw8fax0wswvzgj21kw14747z.jpg";
      break;
    case "健康中国":
      imageStr = "https://cambrian-images.cdn.bcebos.com/b608d95a0275d1998a4c74846fafadd0_1516254338419.jpeg";
      break;
    case "国资小新":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.600.600.180/a40e3d09jw8eyc305y7z5j20go0godgy.jpg";
      break;
    case "超哥爱侃球":
      imageStr = "https://pic.rmb.bdstatic.com/9580e2ee91f36c6ccef6f0caeaa217a6.jpeg";
      break;
    case "舌尖计":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.512.512.180/006RD02Cly8g8zcnpvdcdj30e80e8mxb.jpg";
      break;
    case "舌尖计美食":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.512.512.180/006RD02Cly8g8zcnpvdcdj30e80e8mxb.jpg";
      break;
    case "艾辽篮":
      imageStr = "https://pic.rmb.bdstatic.com/420520306ba7466f2c1ac35bdff5f968.jpeg";
      break;
    case "田园美食记":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.664.664.180/007P2S6Tly8gadujqurgfj30ig0igaai.jpg";
      break;
    case "新高考风向标":
      imageStr = "https://pic.rmb.bdstatic.com/3b6f37f3d61ce424254507c851fe8833.jpeg";
      break;
    case "山川文社":
      imageStr = "https://pic.rmb.bdstatic.com/9a9cb5c2e44562859ae48fbc9dd24e97.png";
      break;
    case "中国高校在路上":
      imageStr = "https://pic.rmb.bdstatic.com/649568d2fa6a20cbd1fde7cf6adedd7b.jpeg";
      break;
    case "教育思辨":
      imageStr = "https://pic.rmb.bdstatic.com/f79a8e08c25159f3fc1ff00fe71957fa.jpeg";
      break;
    case "教育是一场修行":
      imageStr = "https://pic.rmb.bdstatic.com/f9554ac6cc90f37284e2e0cc1100f4ad.jpeg";
      break;
    case "教育需要时间":
      imageStr = "https://pic.rmb.bdstatic.com/c867ef7e8d1c9af06dab8831e34fbc54.jpeg";
      break;
    case "万军9752":
      imageStr = "https://pic.rmb.bdstatic.com/f7548827ae7010cc20e6cf97152f28fe.jpeg";
      break;
    case "超级替补":
      imageStr = "https://pic.rmb.bdstatic.com/0a1ce04b11c221bec81a5fa606e6a787.jpeg";
      break;
    case "内蒙古新闻网":
      imageStr = "https://tvax3.sinaimg.cn/crop.18.18.480.480.180/ed1b2ce7ly1ffib3o0o48g20dw0dwdga.gif";
      break;
    case "舌尖探美食":
      imageStr = "https://pic.rmb.bdstatic.com/e39214d0fd797036144b978fecd2adde.jpeg";
      break;
    case "西藏女性":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.512.512.180/007P5JkAly8g3j6vmes3dj30e80e8gly.jpg";
      break;
    case "汽车生活官号":
      imageStr = "https://tva2.sinaimg.cn/crop.6.1.1021.1021.180/810e53c4gw1ej43n3661tj20sm0slaeu.jpg";
      break;
    case "在家学摄影":
      imageStr = "https://pic.rmb.bdstatic.com/b4aed097b159305412186fd1fc107a67.jpeg";
      break;
    case "工信微报":
      imageStr = "https://pic.rmb.bdstatic.com/9b6b7f1f84326fb3d005ef220a81d512.jpeg";
      break;
    case "度看荆楚":
      imageStr = "https://pic.rmb.bdstatic.com/9558d2374808f7924c1a9558e3fc3237.jpeg";
      break;
    case "第一管理学派":
      imageStr = "https://pic.rmb.bdstatic.com/80744e941b3c5a05d542f3797ec099ed.png";
      break;
    case "直击书画":
      imageStr = "https://pic.rmb.bdstatic.com/856dab0b10b757cc4cf854f48f3f50e2.jpeg";
      break;
    case "中央政法委长安剑":
      imageStr = "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3181996839,398679772&fm=173&app=49&f=JPEG";
      break;
    case "强哥说财会":
      imageStr = "https://pic.rmb.bdstatic.com/da3f102cd11857bd927f687a54b2d1fc.png";
      break;
    case "南生说财经":
      imageStr = "https://pic.rmb.bdstatic.com/564d08d37fb6b1e3b471cde0e2e6bf3b.png";
      break;
    case "新闻晨报":
      imageStr = "https://tva4.sinaimg.cn/crop.49.65.610.610.180/4e5b54d8jw8ev7lxmkc5nj20j60isq4r.jpg";
      break;
    case "高校专业那些事":
      imageStr = "https://pic.rmb.bdstatic.com/ac63e12150e33fdf15c45af4b08e6965.jpeg";
      break;
    case "新文化报":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.1152.1152.180/a1d921eejw8esx64n9uooj20w00w0tai.jpg";
      break;
    case "合肥交通广播":
      imageStr = "https://tva4.sinaimg.cn/crop.24.0.486.486.180/6854478cgw1enx7rm1mwkj20et0dljsa.jpg";
      break;
    case "民生大参考":
      imageStr = "https://tva4.sinaimg.cn/crop.146.28.480.480.180/72b66d3fjw1ewiar0enotj20m80es0ut.jpg";
      break;
    case "沈阳公共频道":
      imageStr = "https://pic.rmb.bdstatic.com/d68d627ef4f918a40dcea35d290586ee.jpeg";
      break;
    case "美食杰减肥课堂":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.389.389.180/007MNLgvly8g2xwnj8hzdj30at0atdid.jpg";
      break;
    case "生命时报":
      imageStr = "https://tva1.sinaimg.cn/crop.37.40.952.952.180/69bdf737gw1f31srbdbqnj20sg0sg42l.jpg";
      break;
    case "平安湖北":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.664.664.180/7249b69cly8g4j3axzpzbj20ig0iht9p.jpg";
      break;
    case "汇通财经":
      imageStr = "https://tva1.sinaimg.cn/crop.26.28.120.120.180/70017753gw1f38t6xlgqgj2050050mx6.jpg";
      break;
    case "海关发布":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.497.497.180/006mHPfHjw1f0concprf3j30dw0dxwg1.jpg";
      break;
    case "东奥会计在线":
      imageStr = "https://tvax3.sinaimg.cn/crop.11.16.172.172.180/5daf1211ly8flpoddinvij205k05kq2z.jpg";
      break;
    case "BT财经V":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.300.300.180/7c715141ly8ga3bsdvngxj208c08c413.jpg";
      break;
    case "环球出国":
      imageStr = "https://tvax3.sinaimg.cn/crop.183.84.876.876.180/7b90a595ly8g04u6yo2irj20y00u0n0s.jpg";
      break;
    case "第一冲锋号":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.119.119.180/007z2osaly1fz1gx6u7zmj303c03ct8m.jpg";
      break;
    case "武器装备":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.150.150.180/0076CCwBly8fuu0k46ipjj3046046wee.jpg";
      break;
    case "中油网":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/aa5608e5jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "英姐游记":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.996.996.180/006ROokCly8g247uxr0g2j30ro0ro417.jpg";
      break;
    case "高等教育研究员":
      imageStr = "https://pic.rmb.bdstatic.com/29827856f5c74e8d4516e651dd359a11.jpeg";
      break;
    case "时代之声V":
      imageStr = "https://pic.rmb.bdstatic.com/fec3525fd987ab9bed4a6f102153c9f6.jpeg";
      break;
    case "晓妹世界观":
      imageStr = "https://pic.rmb.bdstatic.com/e7c318e06b606eb7d6e8fb747d628532.jpeg";
      break;
    case "TripAdvisor猫途鹰":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.100.100.180/628a04bfly8fj9o4ndkkcj202s02s747.jpg";
      break;
    case "财联社":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.300.300.180/aafc85c3jw8f0cv3o5ozrj208c08ct8v.jpg";
      break;
    case "亿邦动力网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1242.1242.180/65a8fe05ly8fhxenofbyoj20yi0yi404.jpg";
      break;
    case "InfoQ":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.401.401.180/68147f68jw8ezff3h1n0ij20b50b5weq.jpg";
      break;
    case "CSDN":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.185.185.180/6b37299fly1fh268tyvnsj2055055dfv.jpg";
      break;
    case "小谦":
      imageStr = "https://pic.rmb.bdstatic.com/23b65c344e4bc93414b0f9f7f656f5ec.jpeg";
      break;
    case "Java从零开始":
      imageStr = "https://pic.rmb.bdstatic.com/b295fdd55014f839cdae07e5701faadd.jpeg";
      break;
    case "良言科技":
      imageStr = "https://pic.rmb.bdstatic.com/c913216b81257cff0c0aaa2b647c77d3.jpeg";
      break;
    case "中外管理杂志":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/6abb79d9jw8eswdellan3j2050050t96.jpg";
      break;
    case "龚进辉":
      imageStr = "https://pic.rmb.bdstatic.com/4254f664355d058cf415a18e6c4d2029.jpeg";
      break;
    case "华为":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.709.709.180/986ab35fly1fx8kdylytej20jp0jpwhg.jpg";
      break;
    case "华为中国":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.709.709.180/986ab35fly1fx8kdylytej20jp0jpwhg.jpg";
      break;
    case "微观学社":
      imageStr = "https://pic.rmb.bdstatic.com/fead687fb1af85e7d80789207c6db657.jpeg";
      break;
    case "南方杂志":
      imageStr = "https://pic.rmb.bdstatic.com/2eb85fd8c70eb589e452b997d456c15c.jpeg";
      break;
    case "中国江苏网":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.512.512.180/7a915c1aly8g9vxidveeij20e80e8jrh.jpg";
      break;
    case "DT财经":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.180.180.180/006fvKw9ly1fzgdk1p04pj3050050dfn.jpg";
      break;
    case "南国早报":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.1022.1022.180/713ef051gw1f0pvwrl28tj20sg0sgacr.jpg";
      break;
    case "中国文化网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.592.592.180/6591f698jw1efioy7tb7rj20go0go0u7.jpg";
      break;
    case "汽车之家":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.996.996.180/6901e2b9ly8fnu7pkuco4j20ro0roq3t.jpg";
      break;
    case "南方健康":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1080.1080.180/007e4uTyly8fzntv95qajj30u00u075z.jpg";
      break;
    case "羊聪食记":
      imageStr = "https://cambrian-images.cdn.bcebos.com/2819f433987994deab9dd4768bff09f0_1582252330457.jpeg";
      break;
    case "大凯体育":
      imageStr = "https://pic.rmb.bdstatic.com/7c44b143e3b239cf63abc0f300530b4d.jpeg";
      break;
    case "呼和浩特晚报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/c18ed9fcjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "海报时尚网":
      imageStr = "https://pic.rmb.bdstatic.com/7bd0ae033f8d464ca3097e9fb5b4eb16.jpeg";
      break;
    case "中国商务新闻网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/9c14ea7ajw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "国防时报排头兵":
      imageStr = "https://pic.rmb.bdstatic.com/f88ee8afafcd6449fb34383098816745.jpeg";
      break;
    case "文都考研头条":
      imageStr = "https://cambrian-images.cdn.bcebos.com/f19729f470d1c0e0abc697cc6885b121_1560322791004.jpeg";
      break;
    case "大唐申策君":
      imageStr = "https://pic.rmb.bdstatic.com/3f864df16540e11116e2dbcc283c75ec.png";
      break;
    case "融媒观察":
      imageStr = "https://pic.rmb.bdstatic.com/04f3786b54c4430d1db58a09b6be97e1.jpeg";
      break;
    case "聚富财经":
      imageStr = "https://cambrian-images.cdn.bcebos.com/ecb1e3c5e7537374f173000eded191d4_1528428958681.jpeg";
      break;
    case "智通财经":
      imageStr = "https://tvax3.sinaimg.cn/crop.133.19.333.333.180/006rYsrmly8fed431d4lqj30go0ac403.jpg";
      break;
    case "范博讲主力行为":
      imageStr = "https://tvax2.sinaimg.cn/crop.34.0.328.328.50/053b8e3fly8fdoyy2s276j20a70awagw.jpg";
      break;
    case "交易者日记":
      imageStr = "https://pic.rmb.bdstatic.com/da6a7dbef9d52bd9690ddc599bb9dc1f.jpeg";
      break;
    case "历史这点儿小细节":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.996.996.180/a51a6781ly8fi2824vfouj20ro0rowgb.jpg";
      break;
    case "阿胜说历史":
      imageStr = "https://pic.rmb.bdstatic.com/2df1d8a5607665d34b8ba35976a95b09.jpeg";
      break;
    case "掌上图文":
      imageStr = "https://pic.rmb.bdstatic.com/ae9d3f57bcb62e9d342b3f7b750aa848.jpeg";
      break;
    case "海峡生活汇":
      imageStr = "https://pic.rmb.bdstatic.com/53ada2d3d0fc2265846146add2472778.jpeg";
      break;
    case "迷彩虎历史":
      imageStr = "https://pic.rmb.bdstatic.com/acf9a212d8e04030401675659e61c9f3.jpeg";
      break;
    case "第一电动网":
      imageStr = "https://tva2.sinaimg.cn/crop.37.49.396.396.180/49bc42aajw1f2vzselr2fj20dm0dkdg8.jpg";
      break;
    case "车镖局":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.6.793.793.180/006RIi7tly8g2inskji5gj30m80m8my3.jpg";
      break;
    case "车场风云":
      imageStr = "https://pic.rmb.bdstatic.com/0d4ca6be58cf358019228a0813aa4060.jpeg";
      break;
    case "爱卡汽车":
      imageStr = "https://tvax2.sinaimg.cn/crop.4.0.200.200.180/673b2b23ly8g5se9ufn7zj205p05kwf4.jpg";
      break;
    case "言言说车":
      imageStr = "https://pic.rmb.bdstatic.com/0f581ebceea23d0972ebfdafaf72a29f.jpeg";
      break;
    case "品味车道":
      imageStr = "https://pic.rmb.bdstatic.com/af3426e8a201ae5d813ce179b593a971.jpeg";
      break;
    case "网球之家":
      imageStr = "https://pic.rmb.bdstatic.com/94ca41b80212cfdff7430010ef591903.jpeg";
      break;
    case "激扬体坛":
      imageStr = "https://pic.rmb.bdstatic.com/6a1de7c1ed72442f1a40b4cfa88dc55a.jpeg";
      break;
    case "先锋乒羽":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.172.172.180/64e260a1gw1evfu9u2m5zj20500500st.jpg";
      break;
    case "体坛周报":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.512.512.180/005Q5bWPly8ftdxt6drehj30e80e80t0.jpg";
      break;
    case "足球报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/664dd32bjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "爱活网":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.349.349.180/62bf1f1fjw8f9exj0qo4sj209q09q3yl.jpg";
      break;
    case "古月说游戏":
      imageStr = "https://pic.rmb.bdstatic.com/7907d20f6710d80ac7d8967b850f2969.jpeg";
      break;
    case "新浪娱乐":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.440.440.180/61e7f4aajw8ev79nvbx40j20c80c875l.jpg";
      break;
    case "时尚芭莎":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.180/65d26b38ly8gbwv34fgy7j20u00u041r.jpg";
      break;
    case "时尚COSMO":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.996.996.180/5a899759ly8g6ulxa4xxjj20ro0romxo.jpg";
      break;
    case "腕表之家":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.199.199.180/87411493gw1emg3ab2dloj205k05kdg2.jpg";
      break;
    case "美依lady":
      imageStr = "https://tvax3.sinaimg.cn/crop.128.128.384.384.180/9454c602ly1gbtnetfw4mj20hs0hswey.jpg";
      break;
    case "财经下午茶":
      imageStr = "https://tva2.sinaimg.cn/crop.35.108.253.253.180/75b26a3dgw1e7jpojm70nj20lc0g0wjl.jpg";
      break;
    case "爱豆APP":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.850.850.180/005x4ZVjjw8etkrxv7jc9j30nm0nm75f.jpg";
      break;
    case "FASHION日报":
      imageStr = "https://pic.rmb.bdstatic.com/d138473c144ff118f5b6708e35ff811a.jpeg";
      break;
    case "中国商务新闻网":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/9c14ea7ajw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "旅图君":
      imageStr = "https://pic.rmb.bdstatic.com/380bb31ee4947b6c30715772860aa630.jpeg";
      break;
    case "博雅燕园":
      imageStr = "https://pic.rmb.bdstatic.com/44ecd5b6fa5b755ff74f0d3e5a701d88.jpeg";
      break;
    case "i黑马":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.180.180.180/94bec68bjw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "华商韬略":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.998.998.180/8acc9d89ly1fikl9dklv4j20rs0rs0w8.jpg";
      break;
    case "张书乐":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.996.996.180/53923f00jw8f3ra674nrej20ro0rowgx.jpg";
      break;
    case "山西晚报":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.178.178.180/4970af6ejw8f062nsbicgj204y04y74j.jpg";
      break;
    case "天津妇联":
      imageStr = "https://tva1.sinaimg.cn/crop.9.11.171.171.180/d6e9ba72jw1evaa1dbcn5j20550553ys.jpg";
      break;
    case "江西日报":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.600.600.180/76ae208bjw8fa4g1y6ep8j20go0goju8.jpg";
      break;
    case "甘州在线":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.180.180.180/7f865f07jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "选股宝":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1024.1024.180/0063NKlSly8fxntnhp3ynj30sg0sgamm.jpg";
      break;
    case "游戏日报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.750.750.180/006tj9UJjw8f67ump82wtj30ku0kugm1.jpg";
      break;
    case "中国天气网":
      imageStr = "https://tvax2.sinaimg.cn/crop.85.71.836.836.180/594fb883ly1fu2an764y0j20sg0sgac4.jpg";
      break;
    case "健康时报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.600.600.180/541ca444jw8eyz4wr96d6j20go0gotag.jpg";
      break;
    case "沈阳晚报":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.996.996.180/4c582bffly8flwmjk8ntuj20ro0rojsk.jpg";
      break;
    case "易车网":
      imageStr = "https://cambrian-images.cdn.bcebos.com/d6c0a03199732d4e366dff448785a840_1538659367511.jpeg";
      break;
    case "51CTO":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.500.500.180/65d922fcjw8euu3s17hlej20dw0dwtao.jpg";
      break;
    case "AI科技大本营":
      imageStr = "https://tva1.sinaimg.cn/crop.0.0.2000.2000.180/006DuBEdjw8fazq0aity8j31jk1jkwhl.jpg";
      break;
    case "有钱花":
      imageStr = "https://tvax4.sinaimg.cn/crop.6.3.189.189.180/006yCyC0ly8g9n400uttsj305k05k0su.jpg";
      break;
    case "弱电智能化工程2018":
      imageStr = "https://pic.rmb.bdstatic.com/e0dc7130bb27b2b2cfe6835553a16e06.jpeg";
      break;
    case "牛科技网":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.250.250.180/006KffOYly8ff88sq3awtj306y06yjsb.jpg";
      break;
    case "云科技时代":
      imageStr = "https://pic.rmb.bdstatic.com/3f813eea42aae3a4a287cab0000ef228.jpeg";
      break;
    case "王智远":
      imageStr = "https://cambrian-images.cdn.bcebos.com/b263e14235f4c7ffec9fc7c6ecadb741_1539677826740.jpeg";
      break;
    case "老蔡看市":
      imageStr = "https://pic.rmb.bdstatic.com/f307afcf515cb89c636d893f84ecf309.jpeg";
      break;
    case "21世纪经济报道":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.399.399.180/626ece26tw1e7cvq3vd41j20b40b4mxt.jpg";
      break;
    case "中国金融信息网":
      imageStr = "https://tvax4.sinaimg.cn/crop.0.0.791.791.180/6d3988f2ly8g1p6ochh92j20lz0m8abk.jpg";
      break;
    case "中国水利网":
      imageStr = "https://pic.rmb.bdstatic.com/c101709b5ef138637d7a391140691d80.jpeg";
      break;
    case "浙江在线":
      imageStr = "https://tva1.sinaimg.cn/crop.37.53.310.310.180/77c0a2b8gw1eledfn29x4j20b40b4jrp.jpg";
      break;
    case "女性之声":
      imageStr = "https://tvax3.sinaimg.cn/crop.75.16.356.356.180/a33ae70bly8g8fd9h4612j20dw0avdh5.jpg";
      break;
    case "西城数据":
      imageStr = "https://pic.rmb.bdstatic.com/096517ce33cb0523d8c4abd964a34e94.jpeg";
      break;
    case "凤凰大健康":
      imageStr = "https://tvax3.sinaimg.cn/crop.12.12.1068.1068.180/0081eK7xly8g9ifwlce3kj30u00u0atk.jpg";
      break;
    case "快点温州":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.921.921.180/006Zcny2ly8gbh4xq9zw6j30pl0plwun.jpg";
      break;
    case "安徽海豚播报":
      imageStr = "https://pic.rmb.bdstatic.com/72174fd2e7dbc70a32153c6bedbc2f98.jpeg";
      break;
    case "人民网安徽":
      imageStr = "https://tva4.sinaimg.cn/crop.0.0.179.179.180/bfa357e7gw1eswnxa46xzj2050050jrn.jpg";
      break;
    case "公安主持人":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/654a7245jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "公安主持人":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/654a7245jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "经讯":
      imageStr = "https://pic.rmb.bdstatic.com/a7620e7a323af69e1df96b7465df9cdd.png";
      break;
    case "求是网":
      imageStr = "https://tvax2.sinaimg.cn/crop.0.0.500.500.180/b1489af7ly8fs3jv7bgw3j20dw0dw0u5.jpg";
      break;
    case "行车视线":
      imageStr = "https://tvax1.sinaimg.cn/crop.0.0.1242.1242.180/0075ZvfIly8fsph0x38ojj30yi0yin04.jpg";
      break;
    case "柏铭":
      imageStr = "https://pic.rmb.bdstatic.com/bb757d41e611fb7634962cd6092fa997.jpeg";
      break;
    case "笨笨侃体育":
      imageStr = "https://pic.rmb.bdstatic.com/ef1c744a394e868240a3633e107155f1.png";
      break;
    case "深几度":
      imageStr = "https://pic.rmb.bdstatic.com/85080634bfb2ba5490ce1ad3762d6642.jpeg";
      break;
    case "西西侃球":
      imageStr = "https://pic.rmb.bdstatic.com/9c19ad23732b23ae0d625b4b5bf71c3d.jpeg";
      break;
    case "西安大交通发布":
      imageStr = "https://pic.rmb.bdstatic.com/9643b1d005feafbd76541da1f34997db.jpeg";
      break;
    case "李成东":
      imageStr = "https://pic.rmb.bdstatic.com/1a007cfa736e02068b4dd8746735c60e.jpeg";
      break;
    case "辽宁卫视":
      imageStr = "https://tva3.sinaimg.cn/crop.25.0.228.228.180/6a9a5967jw8ez1fk2vh7wj207u06ct8t.jpg";
      break;
    case "图说汽车":
      imageStr = "https://tvax3.sinaimg.cn/crop.0.0.1002.1002.180/006tOzNjly8fyfs83y1ixj30ru0ruwfz.jpg";
      break;
    case "市井觅食记":
      imageStr = "https://pic.rmb.bdstatic.com/e8ad1110a0c5634fc7918e55537ef817.jpeg";
      break;
    case "推哥说科技":
      imageStr = "https://pic.rmb.bdstatic.com/5649afe80e97fc590b680954979110e9.jpeg";
      break;
    case "仰卧撑":
      imageStr = "https://pic.rmb.bdstatic.com/685ed2754070888200f6cc6314855f61.png";
      break;
    case "李俊慧":
      imageStr = "https://pic.rmb.bdstatic.com/8946d4bd246a991c35b761f004f971d1.jpeg";
      break;
    case "北京丰台官方发布":
      imageStr = "https://cambrian-images.cdn.bcebos.com/a2a1bdcb0570e65c69c02c5da1efa5a1_1530079872351.jpeg";
      break;
    case "孙永杰":
      imageStr = "https://tva3.sinaimg.cn/crop.51.153.568.568.180/4cab48bajw8evn5550u3rj20iz0sgjui.jpg";
      break;
    case "燃财经":
      imageStr = "https://tvax3.sinaimg.cn/crop.239.240.601.601.180/0078kWaWly8g0qrhm5je2j30u00u2aas.jpg";
      break;
    case "红星深度":
      imageStr = "https://pic.rmb.bdstatic.com/d882b8d93b19c5220605ed18162fa5a0.png";
      break;
    case "福州发布":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.179.179.180/9d4c645dgw1evevihy0caj2050050glu.jpg";
      break;
    case "北京海淀":
      imageStr = "https://cambrian-images.cdn.bcebos.com/7bb8c0ab2c0e6c618c905bfd280ee622_1537419583565.jpeg";
      break;
    case "戴建业":
      imageStr = "https://himg.bdimg.com/sys/portrait/item/a6546461696a69616e796535361461.jpg";
      break;
    case "温州发布":
      imageStr = "https://cambrian-images.cdn.bcebos.com/c9f49c848e3d4030fa4625a21e6ab52f_1521601162700.jpeg";
      break;
    case "中国科普网":
      imageStr = "https://tvax3.sinaimg.cn/crop.168.18.444.444.180/d193c628ly8franjat5gaj20m80dwt8x.jpg";
      break;
    case "李迅雷":
      imageStr = "https://tva3.sinaimg.cn/crop.0.0.180.180.180/6b840657jw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "芒果TV":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&di=b91e3348ca39b552d882074d9c2f3ebf&quality=90&size=b870_10000&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F854703dac1fa2b761789b726ec3e2845.jpeg";
      break;
    case "婚姻与家庭":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=4aed4e8121b59937551ebf909fe778e2&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F407b006246212ad2e850d67eaed4a92e.jpeg";
      break;
    case "四川妇联":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=b21925d6da2ea6666d9d3c56756fce5d&quality=100&size=b204_10008&cut_x=0&cut_y=0&cut_w=204&cut_h=204&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fce34f78b2e22f75f212e6556a3426416.jpeg";
      break;
    case "新京报传媒研究":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=27b8e38de64a63ea218b65a4ff90995d&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F815154e63275cf033c0de9c2cf0f6ec8.jpeg";
      break;
    case "天天汽车APP":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=c8668d4550fdfce0aef00a7ccba1f8b8&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F02f223ec4c28ea0545883dcbb44a9ec0.jpeg";
      break;
    case "军工圈":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=65c311f1c7db0cf7a94d4df7a47e4122&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F9cf6da782c67c14e86ac46d068a25465.jpeg";
      break;
    case "BWC中文网":
      imageStr = "https://timg01.bdimg.com/timg?%3Fpa=&imgtype=3&sec=1439619614&di=a2cf027a34003ba9d750874d482b7b68&quality=100&size=f200_200&src=http%3A%2F%2Fmsp.baidu.com%2Fv1%2Fmediaspot%2Fa14628f0-e211-11e6-a93b-7bd5c037ab74.png";
      break;
    case "冰川思想库":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&di=4957141888d12fdc147c8e57bb2b601c&quality=90&size=b870_10000&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F2bd02f05cba5a4184a405c6398a5537a.jpeg";
      break;
    case "肖磊看市i":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=46a5492c5f0b0c12f620211b6467c085&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F34327e7ef2e28302584b0c4c7cddc478.jpeg";
      break;
    case "搜达足球":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/4ffbcf0ajw1e8qgp5bmzyj2050050aa8.jpg";
      break;
    case "8彩虹画室":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=cd807c229f009e6289c2771f31a6486d&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F898622cdc234c2c8c5ae6d52b92a1f7d.jpeg";
      break;
    case "氧气是个地铁":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=bd12b3318f36adfcf5af7e092ee5f077&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fc80ff3c4682775343e7f344d825a53de.jpeg";
      break;
    case "小谈食刻":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=a225188de6ce7585dac359a7258cbd4a&quality=100&size=b461_10052&cut_x=2&cut_y=0&cut_w=461&cut_h=461&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fdf71afa787bc942bef835029fecf6ed5.jpeg";
      break;
    case "王者情报局":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=2926e167b1aa76f15761554a7da28a8e&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F0c18051a93201f2474b1983185c98bdd.jpeg";
      break;
    case "图说光影":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=7d2a1a3eea3a857d04b7a22552a5f72c&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ffda3d77a6a89a453ff13db7282d0afcb.jpeg";
      break;
    case "总财":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=ffc7ef5131522e51ae7b9bde3f3def7f&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ff402502e51ea1514eb64a4e4d5d02d14.jpeg";
      break;
    case "金投网":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=3&sec=1439619614&di=e6250483918ee9ee424ea5bb5e19b988&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F5b89669ebe8548b1bcc010e78170accc.png";
      break;
    case "ALENG":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=3b8b3aa5eefa884483d507993896b50d&quality=100&size=b346_10017&cut_x=5&cut_y=0&cut_w=346&cut_h=346&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F008c0ced63a2e574d2c739c4c2c0ff24.jpeg";
      break;
    case "Excel学习世界":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=c775678fa079f95273d7b867d320122f&quality=100&size=b319_10080&cut_x=434&cut_y=140&cut_w=319&cut_h=319&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F3fc3c9a571e44b5e4e923a5e2217f89b.jpeg";
      break;
    case "劲彪新闻客户端":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=2178b67e662af0839a23e147ee255bd0&quality=100&size=b912_10008&cut_x=0&cut_y=0&cut_w=912&cut_h=912&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ffd04f2ef6000b28169b0f660c79ef0d3.png";
      break;
    case "道哥说车":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=e0d2c3cc39a06cbc827556aeb831b62f&quality=90&size=b870_10000&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F5f2332137370b28d5f21d2076e1c916e.jpeg";
      break;
    case "杨剑勇":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=bc096d4cc5a58ffb32b97efc5858d8c2&quality=100&size=b2420_10062&cut_x=359&cut_y=539&cut_w=2420&cut_h=2420&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F762c7333d6685acf4cdde03f643def47.jpeg";
      break;
    case "中国应急管理报":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=16308f71c36e7d956f2573235881f2a6&quality=100&size=b400_10029&cut_x=0&cut_y=0&cut_w=400&cut_h=400&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fc1eea87cedbc49e9d7cdcde80a6c9422.jpeg";
      break;
    case "火星方阵":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=d70de31550cbc2cf398902469cab8637&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F3ef181a83b53e9e2dde7bf4e83c9e883.jpeg";
      break;
    case "高广银":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=92ee1ad187e6e90b7dc449da7620832e&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F40d8e86a532c5731c6ab970fd5c589d4.jpeg";
      break;
    case "Hei白历史":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=653bf117b7192557c7e8ab472586386d&quality=100&size=b200_10004&cut_x=0&cut_y=0&cut_w=200&cut_h=200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F9376aa5fc802ab8f7622a8d69245945d.jpeg";
      break;
    case "投资快报":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=221e50572bb1eebab6ac9754c2bdaddd&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F934683917f7d73c32c1103a975104609.jpeg";
      break;
    case "南生今世说":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=c0adc4af7a9bf1367d10e346d47503c4&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fc9714d8b5f48c468cdf05fd64e5fb3d9.jpeg";
      break;
    case "大金牛财经":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=1129fce1ccbf77942077db1df973ebce&quality=100&size=b572_10043&cut_x=16&cut_y=121&cut_w=572&cut_h=572&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fa53b81822b1489eba6a1b057bd3d2173.jpeg";
      break;
    case "美股研究社":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=ecb9dc90acc9b5c957c3e0347cedce11&quality=100&size=b314_10027&cut_x=213&cut_y=0&cut_w=314&cut_h=314&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F1c11a18413dc84037ee5f02f69ba22ea.jpeg";
      break;
    case "站长之家":
      imageStr = "https://timg01.bdimg.com/timg?pa&imgtype=0&sec=1439619614&di=7f517c7083a449b496d83255ae82b295&quality=90&size=b870_10000&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Fecda3070d526e70308f092ea283273de.jpeg";
      break;
    case "科技生活快报":
      imageStr = "https://timg01.bdimg.com/timg?pa=&imgtype=0&sec=1439619614&di=d9a4f447c78587f4975203b5adbde305&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F05397395604d8f25da072a2d15f55994.jpeg";
      break;
    case "石川观察":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=d4bf1c8650ef440f5068b40df34df6f6&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F129ceca51985bc3d60e5561aab6c9edb.jpeg";
      break;
    case "历史潮河":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=46e876fa0b266737d9451cf51b754318&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F0f38d9f120f23b19228b50fbe66ddc74.jpeg";
      break;
    case "军院34号":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=1&sec=1439619614&autorotate=1&di=e608431caa339755485d67a4cd0b1a63&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F6760f10477d7261c152c619888292635.jpeg";
      break;
    case "辽宁妇联":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=f116d744b46361487f2467137142321d&quality=100&size=b856_10062&cut_x=11&cut_y=0&cut_w=856&cut_h=856&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F5bb226f6965b53c07c647669733f13c7.png";
      break;
    case "禾小荷":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=13279f798c4a78dae9b22a64b471a2fc&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F9289ebda0f1a2d16c963542e3c3437a5.png";
      break;
    case "人民前线":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=fd85cf4026cb7309ff95f4ee2ac0ecaf&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F3b9c0fb382b04a8830aba14eb01886fc.jpeg";
      break;
    case "人物":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=aabfaae2b7438bedddfd189eb44e49e3&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F34e432cc19c5ce26eb9dfce54903f8a2.jpeg";
      break;
    case "导航教育":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=c6b5e93948b93278175e766d3075dfbf&quality=100&size=b590_10067&cut_x=198&cut_y=84&cut_w=590&cut_h=590&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ff3f65d38a10b65a6474500483ace09c0.png";
      break;
    case "互联网范儿":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&di=e0215415c283a4cd8f3cc176efa28a98&quality=90&size=b870_10000&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Fa650c0534b9e3491f17f0026d498ff56.jpeg";
      break;
    case "黑马程序员":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=1aed698fd6a203f1dcfba94ce864d6fb&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F722466b2a6af9ae0b2ccf6ecbda71521.jpeg";
      break;
    case "智能甄选":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=8a4ba8a963c1a0c869029c9a0c0bfa35&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F03ce33fa6b3011ecbef66f72db082572.png";
      break;
    case "挖贝网":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=8192fae214e0a26ec3e8231ce60d0274&quality=100&size=b449_10042&cut_x=0&cut_y=2&cut_w=449&cut_h=449&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ff46debd728daec5d7acee78b137681b7.png";
      break;
    case "古姿观察":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=9918f51a9a7c18c40c304a03293a0df9&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F1518509620a2e91ca369f2dc22bdaf86c39f79902d.jpeg";
      break;
    case "慢新闻":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=53fd58a5edecb7f8416111c253d7a3e7&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Fa2a3fe656686aa25f02922fc2029ccdf.jpeg";
      break;
    case "金羊网":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=bfe36e72b785854a8a06180074be14e1&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fc4fbad4c7303a1065c32c1c3af5e95a2.jpeg";
      break;
    case "瀚海观察":
      imageStr = "https://timg01.bdimg.com/timg?pa=&imgtype=0&sec=1439619614&di=57bac5f73b10be929093649bee2cf156&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fee89f5992dd8047a83088dd5f51199cb.jpeg";
      break;
    case "东南早报":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=3504263a4950dd4abe5137502b8a12c7&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F11463cf85dbe405bb3cc032c97f9a535.jpeg";
      break;
    case "闻舞视界":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=6d3490b7bae850288ec5b77e6fcc108f&quality=100&size=b1134_10098&cut_x=118&cut_y=25&cut_w=1134&cut_h=1134&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F1f19f1acac1cda27007e1d4eefb1efca.jpeg";
      break;
    case "甘肃省妇联":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=7f52745f6f10f5ac0c0dec669c2ea237&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F15217801037da45193f676427d97aedf4088babc25.jpeg";
      break;
    case "江西网络广播电视台":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=94abb5c3ff9aea8135099da1ecb61fc4&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F1fe02cc5e2d30a266f92464dff8d0eb0.png";
      break;
    case "煮妇百科":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=a261f4944c8ab74e82a6244f1942278c&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F2fa378819064fc672a5d17c6394bb242.jpeg";
      break;
    case "南充政法":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=d7969d7218900feb1a1e4bef5c819eb6&quality=100&size=b450_10014&cut_x=0&cut_y=0&cut_w=450&cut_h=450&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F4ac43686aea71ebc8e85c761adbe7e60.jpeg";
      break;
    case "绿茵守望者":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=1294002e13036f0609fd2b8873264a68&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fa1ec481bee1b229645a6bc826814892b.jpeg";
      break;
    case "博雅数据库":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=6e4f787c81abe0aa41468dcbebdd2f2b&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F751e50b5212611fd56ab01db91f7de57.jpeg";
      break;
    case "小李子爱体育":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=1&sec=1439619614&autorotate=1&di=5e11d2a66363bf7baf060e145d3ed110&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F755322493f274f133468af1d182f0ab5.jpeg";
      break;
    case "舞之灵小食堂":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=c62107d4933b5bf5807c7376383354e5&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ff4e3a1f8e8fb36615a1dcf1a8fc99af8.jpeg";
      break;
    case "爱车兵团ICARBT":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=371e59e71c634ab3311da46bffa1e95a&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F4488154ddec9bdbb99e27bebd1425fb8.jpeg";
      break;
    case "海峡头条V":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=a61cd69b95715dbbc6292e6fb1c0e154&quality=100&size=b701_10077&cut_x=19&cut_y=19&cut_w=701&cut_h=701&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ff3be8cfb20134374311ed874b0c75f52.jpeg";
      break;
    case "A9VG":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=49b1457abacd865abe55b96ff25a0e84&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fdbbdc8c1c4e4f2610cd77e0e7dc54bd5.jpeg";
      break;
    case "贴吧游戏精选":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=67f1d3d11267d3926eaddd805a501c7d&quality=100&size=b200_10017&cut_x=0&cut_y=0&cut_w=200&cut_h=200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fd79defc69cb7e86d03b7dc5d62b59ca9.jpeg";
      break;
    case "旅行中的兔子":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=0ff9772854b3d10dc3c1c12253ecbc1c&quality=100&size=b450_10031&cut_x=0&cut_y=0&cut_w=450&cut_h=450&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F5cdbbf49ca929beabe3f3352b20bdf71.jpeg";
      break;
    case "东方头条":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=b24961481b578f79bfa9be3096e12ecd&quality=100&size=b200_10073&cut_x=0&cut_y=0&cut_w=200&cut_h=200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F834d839762d622b19a6b1ab93200ad2d.jpeg";
      break;
    case "宁夏新闻网":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=9f1074227a2db62e089053a83a495a3f&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F4fb58b3a697d3a3ef6c69a91dfa4f098.jpeg";
      break;
    case "山东商报":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=39adf4f6de447200050c112bfb2c9969&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F8c56ae34a71ad41ff8d2739ff876ed26.jpeg";
      break;
    case "北京石景山发布":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=bcd44a4bc3658d66cd7c821afd3cab7b&quality=100&size=b388_10030&cut_x=94&cut_y=0&cut_w=388&cut_h=388&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fccba359e7d3c3d6e0d23ffc430f9dcf6.jpeg";
      break;
    case "局座召忠":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=068759ad1eb0f05c84ccfb382bf59f27&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F441eaa764358972a5eef3daf260a7717.jpeg";
      break;
    case "吉林长春妇联":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=5b5f2916675f4f8d1641d4fbd3a89735&quality=100&size=bNaN_10080&cut_x=NaN&cut_y=NaN&cut_w=NaN&cut_h=NaN&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F1692bfe620f3abf992742f48cb34534c.png";
      break;
    case "深圳卫视":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=b267a9b4c8d0d2b957bd0f226c3a3b61&quality=100&size=b800_10019&cut_x=100&cut_y=100&cut_w=800&cut_h=800&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F703379d71aef50c54732eac3d61c5df8.jpeg";
      break;
    case "湖南微政务":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=943218ab9cb24d7745253ecf76b791ec&quality=100&size=b640_10064&cut_x=0&cut_y=0&cut_w=640&cut_h=640&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fe81f76010e8634843882b1b41a134ec9.jpeg";
      break;
    case "中央纪委国家监委网站":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=5f2877e1c02223f0af112e5c69b3625c&quality=100&size=b381_10076&cut_x=0&cut_y=0&cut_w=381&cut_h=381&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F9b2e80ca7eab8cc1c9785d1b43430d9b.jpeg";
      break;
    case "读芯术":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=c9a9db4a3d14ad5a3c1d195c4bafc9e7&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F7c7187200a5dc0a26f60a9cf5901da56.png";
      break;
    case "网信河北":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=9084e157c36eeab388a4d167a1091f95&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F0ca33c3c3bfe2ea0eebb522808a8abfb.png";
      break;
    case "东南早报":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=3504263a4950dd4abe5137502b8a12c7&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F11463cf85dbe405bb3cc032c97f9a535.jpeg";
      break;
    case "家电圈":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=1&sec=1439619614&autorotate=1&di=47acf1a827a2148f4fc344fd3b4e2f7c&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F51c6dd4ba438c010b25678cc59f3b606.jpeg";
      break;
    case "西楚军事":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=e402260161a4dfc79b2726de194bbe5d&quality=90&size=b200_200&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2F5fb00e5841c70fca5ff084a4da380cda.png";
      break;
    case "文藏":
      imageStr = "http://timg01.bdimg.com/timg?pacompress&imgtype=1&sec=1439619614&autorotate=1&di=439466e42510ff94788ee9dad7167c77&quality=100&size=b198_10060&cut_x=1&cut_y=2&cut_w=198&cut_h=198&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F5eab96d4c92d741195cd8a71ce255449.jpeg";
      break;
    case "中国吉林网":
      imageStr = "http://timg01.bdimg.com/timg?%3Fpa=&imgtype=3&sec=1439619614&di=948f48ac8196fcc5baa032e4c5b97442&quality=100&size=f200_200&src=http%3A%2F%2Fmsp.baidu.com%2Fv1%2Fmediaspot%2F35310d20-e210-11e6-a93b-7bd5c037ab74.png";
      break;
    case "日本二三事":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=eacaa3e163e3976645c14df1458e4a12&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ffb1856ebae3e92ef1006135e2779a824.png";
      break;
    case "映象网":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=3&sec=1439619614&autorotate=1&di=d1fc3d51412cf09bd5eef1231bdc8ec1&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F1a42eff3b1a68c2e0387bf3dc73a1fb4.png";
      break;
    case "大河客户端":
      imageStr = "http://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=7c8c073d56aa10d90bb05a5644a5aa15&quality=100&size=bNaN_10095&cut_x=NaN&cut_y=NaN&cut_w=NaN&cut_h=NaN&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F27169bfccdb1770969ed5ef1254a207e.png";
      break;
    case "环球科学猫":
      imageStr = "https://timg01.bdimg.com/timg?pacompress&imgtype=0&sec=1439619614&autorotate=1&di=3d6e55310924f7c44273688c47d544ef&quality=90&size=b870_10000&src=http%3A%2F%2Fbos.nj.bpc.baidu.com%2Fv1%2Fmediaspot%2Fba25d87f391d1c837912ed2b7ad66beb.png";
      break;
    case "每日新报":
      imageStr = "https://tva2.sinaimg.cn/crop.0.0.180.180.180/95ff72a7jw8evcrhriclzj2050050aac.jpg?KID=imgbed,tva&Expires=1580298845&ssig=9sM9lPmB%2FD";
      break;
    case "江南都市报":
      imageStr = "https://timg01.bdimg.com/timg?pa=&imgtype=0&sec=1439619614&di=75508fca92ff2cdca38d3727c51ae93d&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Ff6d2558fd2af948fb356953803424f74.jpeg";
      break;
    case "重案组37号":
      imageStr = "https://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&autorotate=1&di=9da052921a2b83d464e4f13080beca28&quality=90&size=b200_200&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F3cd2e9a0588a49dfecc735034bedb69e.jpeg";
      break;
    case "齐鲁网":
      imageStr = "http://timg01.bdimg.com/timg?pacompress=&imgtype=0&sec=1439619614&di=87e517719c59e73ccfdf83b097cddfbb&quality=90&size=b870_10000&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F967fba689814a5067474d6ed1345f3e6.jpeg";
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