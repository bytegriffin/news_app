import 'package:flutter/material.dart';
import '../models/free_movie.dart';
import '../util/image_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_free_movie_detail.dart';

//自定义的免费电影列表页面
class CustomFreeMovieListPage extends StatefulWidget {
  @override
  _CustomFreeMovieListPageState createState() => _CustomFreeMovieListPageState();
}

class _CustomFreeMovieListPageState extends State<CustomFreeMovieListPage> {

  List<FreeMovie> freeMovieList= List<FreeMovie>();

  _buildFreeMovies(){
    freeMovieList.add(FreeMovie("34453138",PageType.Movie,"第92届奥斯卡颁奖典礼","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584156190.webp","https://tv1.youkutv.cc/2020/02/11/p8h7IzfECIPX1Q6l/playlist.m3u8"));
    freeMovieList.add(FreeMovie("30329892",PageType.Movie,"航海王：狂热行动","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2570039912.webp","https://youku.haokzy-tudou.com/ppvod/jsFEkdYf.m3u8"));
    freeMovieList.add(FreeMovie("30252495",PageType.Movie,"1917","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2570243317.webp","https://youku.haokzy-tudou.com/ppvod/k71LPzr8.m3u8"));
    freeMovieList.add(FreeMovie("27119724",PageType.Movie,"小丑 Joker","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2567198874.webp","https://youku.haokzy-tudou.com/ppvod/4yf2LZrW.m3u8"));
    freeMovieList.add(FreeMovie("6981153",PageType.Movie,"爱尔兰人","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2568902055.webp","https://youku.haokzy-tudou.com/ppvod/0p8xRuyT.m3u8"));
    freeMovieList.add(FreeMovie("27010768",PageType.Movie,"寄生虫","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561439800.webp","https://youku.haokzy-tudou.com/ppvod/gsCepFJN.m3u8"));
    freeMovieList.add(FreeMovie("6538866",PageType.Movie,"极速车王","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2568792942.webp","https://youku.haokzy-tudou.com/ppvod/LkEdxNf9.m3u8"));
    freeMovieList.add(FreeMovie("25887288",PageType.Movie,"冰雪奇缘2","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2572847101.webp","https://youku.haokzy-tudou.com/ppvod/HF7UZpnv.m3u8"));
    freeMovieList.add(FreeMovie("4202982",PageType.Movie,"冰雪奇缘","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2166640945.webp","https://youku.haokzy-tudou.com/ppvod/zAdbVzTG.m3u8"));
    freeMovieList.add(FreeMovie("27000981",PageType.Movie,"多力特的奇幻冒险","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2580751143.webp","https://youku.haokzy-tudou.com/ppvod/H5uCHgxW.m3u8"));
    freeMovieList.add(FreeMovie("30209084",PageType.Movie,"对不起，我们错过了你","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2572138412.webp","https://youku.haokzy-tudou.com/ppvod/dEVLzsON.m3u8"));
    freeMovieList.add(FreeMovie("34907421",PageType.Movie,"美利坚女士","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2580967404.webp","https://tv1.youkutv.cc/2020/02/01/KGwg74T06AGLGHM3/playlist.m3u8"));
    freeMovieList.add(FreeMovie("26348103",PageType.Movie,"小妇人","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575325937.webp","https://youku.haokzy-tudou.com/ppvod/eE5NTMRm.m3u8"));
    freeMovieList.add(FreeMovie("34797487",PageType.Movie,"发之恋","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2583987514.webp","https://tv1.youkutv.cc/2020/02/11/ANOWUP6YIemNhmPX/playlist.m3u8"));
    freeMovieList.add(FreeMovie("30331965",PageType.Movie,"东京食尸鬼 真人版2","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2553264096.webp","https://tv1.youkutv.cc/2020/02/14/rkeq5hZNtZaRvhEN/playlist.m3u8"));
//    freeMovieList.add(FreeMovie("27073179",PageType.Movie,"邻里美好的一天","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2579889073.webp","https://youku.cdn7-okzy.com/20200205/17003_1534e294/1000k/hls/index.m3u8"));
    freeMovieList.add(FreeMovie("30462527",PageType.Movie,"基督圣体","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567988621.webp","https://tv1.youkutv.cc/2020/02/06/qSXBW7GdhiiYi0Dq/playlist.m3u8"));
    freeMovieList.add(FreeMovie("30129008",PageType.Movie,"宝贝男孩","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2568099437.webp","https://tv.youkutv.cc/2020/01/29/TUMMl5urKGOPptGq/playlist.m3u8"));
    freeMovieList.add(FreeMovie("4301043",PageType.Movie,"传染病","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1213203384.webp","https://youku.haokzy-tudou.com/ppvod/asjyrjOD.m3u8"));
//    freeMovieList.add(FreeMovie("30289194",PageType.Movie,"爆炸新闻","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2571554907.webp","https://youku.cdn10-okzy.com/20200112/12203_69c6243d/1000k/hls/index.m3u8"));
    freeMovieList.add(FreeMovie("30331959",PageType.Movie,"黑水","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2569450232.webp","https://youku.haokzy-tudou.com/ppvod/hcL2pnRz.m3u8"));
    freeMovieList.add(FreeMovie("26858510",PageType.Movie,"克劳斯：圣诞节的秘密 Klaus","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2570825762.webp","https://youku.haokzy-tudou.com/ppvod/vA74tBbz.m3u8"));
    freeMovieList.add(FreeMovie("26786669",PageType.Movie,"决战中途岛","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2573582192.webp","https://youku.haokzy-tudou.com/ppvod/HmZTkPxP.m3u8"));
    freeMovieList.add(FreeMovie("30394807",PageType.Movie,"蜡笔小新：新婚旅行飓风之遗失的野原广志","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2549326655.webp","https://youku.haokzy-tudou.com/ppvod/G3zC6Lt5.m3u8"));
    freeMovieList.add(FreeMovie("26100958",PageType.Movie,"复仇者联盟4：终局之战","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2552058346.webp","https://youku.haokzy-tudou.com/ppvod/fhAfitLK.m3u8"));
    freeMovieList.add(FreeMovie("24773958",PageType.Movie,"复仇者联盟3：无限战争","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2517753454.webp","https://youku.haokzy-tudou.com/ppvod/8f63xeju.m3u8"));
    freeMovieList.add(FreeMovie("10741834",PageType.Movie,"复仇者联盟2：奥创纪元","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2237747953.webp","https://youku.haokzy-tudou.com/ppvod/J7CqKh2U.m3u8"));
    freeMovieList.add(FreeMovie("1866479",PageType.Movie,"复仇者联盟","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1469137689.webp","https://youku.haokzy-tudou.com/ppvod/bGjLASyd.m3u8"));
    freeMovieList.add(FreeMovie("26931786",PageType.Movie,"蜘蛛侠：英雄远征","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2558293106.webp","https://youku.haokzy-tudou.com/ppvod/hjK5hsyb.m3u8"));
    freeMovieList.add(FreeMovie("26374197",PageType.Movie,"蜘蛛侠：平行宇宙","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2542867516.webp","https://youku.haokzy-tudou.com/ppvod/T91XfGYS.m3u8"));
    freeMovieList.add(FreeMovie("30318116",PageType.Movie,"利刃出鞘","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2574172427.webp","https://youku.haokzy-tudou.com/ppvod/mhcf32Ti.m3u8"));
    freeMovieList.add(FreeMovie("30327842",PageType.Movie,"82年生的金智英","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2578045524.webp","https://youku.haokzy-tudou.com/ppvod/fhLte5FN.m3u8"));
    freeMovieList.add(FreeMovie("27087724",PageType.Movie,"好莱坞往事","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551119672.webp","https://youku.haokzy-tudou.com/ppvod/GchvsIPV.m3u8"));
    freeMovieList.add(FreeMovie("30271841",PageType.Movie,"多哥","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2575882765.webp","https://youku.haokzy-tudou.com/ppvod/2mNcpO98.m3u8"));
    freeMovieList.add(FreeMovie("27002635",PageType.Movie,"唐顿庄园","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575400017.webp","https://youku.haokzy-tudou.com/ppvod/8EZvxIyB.m3u8"));
    freeMovieList.add(FreeMovie("30334073",PageType.Movie,"调音师","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551995207.webp","https://youku.haokzy-tudou.com/ppvod/JkvezV4x.m3u8"));
    freeMovieList.add(FreeMovie("27179039",PageType.Movie,"朱迪 Judy","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2570099577.webp","https://youku.haokzy-tudou.com/ppvod/5EyVdBnX.m3u8"));
    freeMovieList.add(FreeMovie("6850547",PageType.Movie,"玩具总动员4","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2557284230.webp","https://youku.haokzy-tudou.com/ppvod/BapS0wUg.m3u8"));
    freeMovieList.add(FreeMovie("10432911",PageType.Movie,"流感","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2029391129.webp","https://youku.haokzy-tudou.com/ppvod/DyajjvYw.m3u8"));
    freeMovieList.add(FreeMovie("30170546",PageType.Movie,"乔乔的异想世界","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567973073.webp","https://youku.haokzy-tudou.com/ppvod/5BhOPIxS.m3u8"));
    freeMovieList.add(FreeMovie("30198539",PageType.Movie,"痛苦与荣耀","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2554080075.webp","https://youku.haokzy-tudou.com/ppvod/GOclbi2Z.m3u8"));
    freeMovieList.add(FreeMovie("2244426",PageType.Movie,"雷霆沙赞！","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551249211.webp","https://youku.haokzy-tudou.com/ppvod/Htk4kCfT.m3u8"));
    freeMovieList.add(FreeMovie("1652592",PageType.Movie,"阿丽塔：战斗天使","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2544987866.webp","https://youku.haokzy-tudou.com/ppvod/KX6ti133.m3u8"));
    freeMovieList.add(FreeMovie("26835471",PageType.Movie,"大侦探皮卡丘","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555538168.webp","https://youku.haokzy-tudou.com/ppvod/HopoKAxD.m3u8"));
    freeMovieList.add(FreeMovie("26636712",PageType.Movie,"蚁人2：黄蜂女现身","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2529389608.webp","https://youku.haokzy-tudou.com/ppvod/xse7Nph4.m3u8"));
    freeMovieList.add(FreeMovie("1866473",PageType.Movie,"蚁人","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2266823371.webp","https://youku.haokzy-tudou.com/ppvod/1gFBmcol.m3u8"));
    freeMovieList.add(FreeMovie("3878007",PageType.Movie,"海王","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2541280047.webp","https://youku.haokzy-tudou.com/ppvod/Uz62YShX.m3u8"));
    freeMovieList.add(FreeMovie("27060077",PageType.Movie,"绿皮书","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2549177902.webp","https://youku.haokzy-tudou.com/ppvod/BdUYJI9F.m3u8"));
    freeMovieList.add(FreeMovie("26611804",PageType.Movie,"三块广告牌","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2510081688.webp","https://youku.haokzy-tudou.com/ppvod/AoniuTEL.m3u8"));
    freeMovieList.add(FreeMovie("26336252",PageType.Movie,"碟中谍6：全面瓦解","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2529365085.webp","https://youku.haokzy-tudou.com/ppvod/lfwemC7h.m3u8"));
    freeMovieList.add(FreeMovie("26580232",PageType.Movie,"看不见的客人","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2498971355.webp","https://youku.haokzy-tudou.com/ppvod/k9NS96Wm.m3u8"));
    freeMovieList.add(FreeMovie("30170448",PageType.Movie,"何以为家","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555295759.webp","https://youku.haokzy-tudou.com/ppvod/h24kLZnX.m3u8"));
    freeMovieList.add(FreeMovie("26683290",PageType.Movie,"你的名字","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2395733377.webp","https://youku.haokzy-tudou.com/ppvod/gsjypRSO.m3u8"));
    freeMovieList.add(FreeMovie("3793023",PageType.Movie,"三傻大闹宝莱坞","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p579729551.webp","https://youku.haokzy-tudou.com/ppvod/zeeJTKRn.m3u8"));
    freeMovieList.add(FreeMovie("6786002",PageType.Movie,"触不可及","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1454261925.webp","https://youku.haokzy-tudou.com/ppvod/MaBFwJsX.m3u8"));
    freeMovieList.add(FreeMovie("1291561",PageType.Movie,"千与千寻","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557573348.webp","https://youku.haokzy-tudou.com/ppvod/aoe0I6Fw.m3u8"));
    freeMovieList.add(FreeMovie("3541415",PageType.Movie,"盗梦空间","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p513344864.webp","https://cdn.letv-cdn.com/2019/04/20/KwnVRO0LUgBtvQkz/playlist.m3u8"));
    freeMovieList.add(FreeMovie("1291560",PageType.Movie,"龙猫","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2540924496.webp","https://youku.haokzy-tudou.com/ppvod/RpXNQ6ob.m3u8"));
    freeMovieList.add(FreeMovie("1292052",PageType.Movie,"肖申克的救赎","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp","https://youku.haokzy-tudou.com/ppvod/wSJ3frKv.m3u8"));
    freeMovieList.add(FreeMovie("1292063",PageType.Movie,"美丽人生","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2578474613.webp","https://cdn.zypbo.com/20180826/Gwfqdx4H/index.m3u8"));
  }

  @override
  void initState() {
    super.initState();
    _buildFreeMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("免费观影"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0,
              childAspectRatio: 4 / 6,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return getMovieItem(freeMovieList[index]);
              },
              childCount: freeMovieList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget getMovieItem(FreeMovie movie){
    return Container(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(240),
              height: ScreenUtil().setHeight(260),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: getCachedImage(movie?.image??defaultCastImage),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(240),
              child: Text("${movie?.name}",overflow: TextOverflow.ellipsis,
                  maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
            ),
          ],
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CustomFreeMovieDetailPage(movie)
          ));
        },
      ),
    );
  }

}
