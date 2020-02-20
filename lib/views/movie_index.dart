import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/top_movie.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import '../util/image_util.dart';
import '../components/custom_card.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'movie_list.dart';
import 'top_movie_list.dart';
import '../net/http_router.dart';
import '../models/swiper_movie.dart';
import '../models/free_movie.dart';
import 'custom_free_movie_list.dart';

// 电影首页
class MovieIndexPage extends StatefulWidget {
  @override
  _MovieIndexPageState createState() => _MovieIndexPageState();
}

class _MovieIndexPageState extends State<MovieIndexPage> with AutomaticKeepAliveClientMixin{

  List<TopMovie> newMovieList= List.generate(6, (index) {
    return TopMovie("$index","","",defaultCastImage);
  });
  List<TopMovie> hotTvList= List.generate(6, (index) {
    return TopMovie("$index","","",defaultCastImage);
  });
  List<TopMovie> hotEntList= List.generate(6, (index) {
    return TopMovie("$index","","",defaultCastImage);
  });
  List<TopMovie> hotComicList= List.generate(6, (index) {
    return TopMovie("$index","","",defaultCastImage);
  });
  List<TopMovie> hotDocList= List.generate(7, (index) {
    return TopMovie("$index","","",defaultCastImage);
  });
  List<TopMovie> hotSortList= List.generate(6, (index) {
    return TopMovie("$index","","",defaultCastImage);
  });
  List<FreeMovie> freeMovieList= List<FreeMovie>();

  //构建默认轮播图
  List<SwiperMovie> swMovieList;

  @override
  bool get wantKeepAlive => true;

  _buildFreeMovies(){
    freeMovieList.add(FreeMovie("34453138",PageType.Movie,"第92届奥斯卡颁奖典礼","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584156190.webp","https://tv1.youkutv.cc/2020/02/11/p8h7IzfECIPX1Q6l/playlist.m3u8"));
    freeMovieList.add(FreeMovie("30329892",PageType.Movie,"航海王：狂热行动","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2570039912.webp","https://youku.haokzy-tudou.com/ppvod/jsFEkdYf.m3u8"));
    freeMovieList.add(FreeMovie("30252495",PageType.Movie,"1917","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2570243317.webp","https://youku.haokzy-tudou.com/ppvod/k71LPzr8.m3u8"));
    freeMovieList.add(FreeMovie("27119724",PageType.Movie,"小丑 Joker","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2567198874.webp","https://youku.haokzy-tudou.com/ppvod/4yf2LZrW.m3u8"));
    freeMovieList.add(FreeMovie("6981153",PageType.Movie,"爱尔兰人","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2568902055.webp","https://youku.haokzy-tudou.com/ppvod/0p8xRuyT.m3u8"));
    freeMovieList.add(FreeMovie("27010768",PageType.Movie,"寄生虫","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561439800.webp","https://youku.haokzy-tudou.com/ppvod/gsCepFJN.m3u8"));
  }

  _getMovies(){
    //最新电影
    HttpClient.get(NEW_MOVIE_URL+"0", (result){
      if(mounted){
        setState(() {
          this.newMovieList = TopMovieList.fromJson(result).subjects;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门电视剧
    HttpClient.get(HOT_TV_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotTvList = TopMovieList.fromJson(result).subjects;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门综艺
    HttpClient.get(HOT_ENT_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotEntList = NewMovieList.fromJson(result).data;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门动漫
    HttpClient.get(HOT_COMIC_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotComicList = NewMovieList.fromJson(result).data;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门纪录片
    HttpClient.get(HOT_DOC_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotDocList = NewMovieList.fromJson(result).data;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门短片
    HttpClient.get(HOT_SORT_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotSortList = NewMovieList.fromJson(result).data;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    _buildSWMovieList();
    _getMovies();
    _buildFreeMovies();
    super.initState();
  }

  List<Widget> generateDefaultHotMovieList() {
    return newMovieList.sublist(0,6).map((item) => getMovieRowItem(context, item)).toList();
  }

  List<Widget> generateDefaultHotTvList() {
    return hotTvList.sublist(0,6).map((item) => getMovieRowItem(context, item)).toList();
  }

  List<Widget> generateDefaultHotDocList() {
    if(hotDocList.sublist(0,6) == null){
      return hotDocList.map((item) => getMovieRowItem(context, item)).toList();
    }
    return hotDocList.sublist(0,6).map((item) => getMovieRowItem(context, item)).toList();
  }

  List<Widget> generateDefaultFreeMovieList() {
    return freeMovieList.sublist(0,6).map((item) => buildCustomFreeMovieRowItem(context, item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          _buildSwiper(),
          _buildButton(),
          buildRowMovieCard1(context,"最新电影",MovieListPage("最新电影",TopMovieType.NewMovie), generateDefaultHotMovieList()),
          buildRowMovieCard1(context,"免费观影",CustomFreeMovieListPage(), generateDefaultFreeMovieList()),
          buildRowMovieCard1(context,"热门电视剧",MovieListPage("热门电视剧",TopMovieType.TV), generateDefaultHotTvList()),
          buildRowMovieCard2(context,"热门综艺",MovieListPage("热门综艺",TopMovieType.Ent), hotEntList),
          Container(height: 20,),
          // Container(width: double.infinity, height: 8.0, color: Color.fromRGBO(220, 220, 220, 1.0)),
          buildRowMovieCard3(context, "热门动漫",MovieListPage("热门动漫",TopMovieType.Comic),hotComicList),
          Container(height: 20,),
          buildRowMovieCard1(context,"热门纪录片",MovieListPage("热门纪录片",TopMovieType.Doc), generateDefaultHotDocList()),
          buildRowMovieCard2(context,"热门短片",MovieListPage("热门短片",TopMovieType.Sort), hotSortList),
        ],
      ),
    );
  }


  _buildSWMovieList(){
    swMovieList = List<SwiperMovie>();
    swMovieList.add(SwiperMovie("经典影片",classicMovieImage,"https://movie.douban.com/top250"));
//    swMovieList.add(SwiperMovie("本周口碑榜",weeklyMovieImage,"https://movie.douban.com/chart"));
    swMovieList.add(SwiperMovie("本周口碑榜",weeklyMovieImage, weeklyMovieUrl));
  }

  Widget _buildSwiperImage(int index){
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(swMovieList[index]?.image??"",fit: BoxFit.cover),
        Positioned(
          top: 20,
          right: 30,
          child: Text(swMovieList[index]?.title??"",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 34.0,color: Colors.white)),
        )

      ],
    );
  }

  //构建轮播图
  Widget _buildSwiper(){
    var con = Container(
      height: 120,
      width: MediaQuery.of(context).size.width/ 1.1,
      child: Swiper(
        //autoplayDisableOnInteraction: false,
        pagination: new SwiperPagination(margin: new EdgeInsets.all(1.0)),
        itemCount: 2,
        autoplay: true,
        itemBuilder: (c, i) {
          return GestureDetector(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: _buildSwiperImage(i),
              ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopMovieListPage(swMovieList[i]?.title??"",swMovieList[i]?.image??"", swMovieList[i]?.url??"")
              ));
            },
          );
        },
      ),
    );
    return Card(
      elevation: 4,
      child: con,
    );
  }

  //构建类别按钮
  Widget _buildButton(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.whatshot, color: Colors.pinkAccent,size: 30,),
                Text("正在热映")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopMovieListPage("正在热映",searchMovieImage,"https://movie.douban.com/cinema/nowplaying/beijing/")
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.alarm, color: Colors.deepPurple,size: 30,),
                Text("即将上映")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopMovieListPage("即将上映",searchMovieImage,"https://movie.douban.com/cinema/nowplaying/beijing/")
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.remove_red_eye, color: Colors.blueAccent,size: 30,),
                Text("免费观影")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
//                  builder: (context) => FreeMovieListPage()
                  builder: (context) => CustomFreeMovieListPage()
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.border_top, color: Colors.cyan,size: 30,),
                Text("新片榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopMovieListPage("新片榜",searchMovieImage,"https://movie.douban.com/chart")
              ));
            },
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.movie_filter, color: Colors.deepOrangeAccent,size: 30,),
                Text("北美票房榜")
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
//                  builder: (context) => TopMovieListPage("北美票房榜",searchMovieImage,"https://movie.douban.com/chart")
                  builder: (context) => TopMovieListPage("北美票房榜",searchMovieImage,usMovieUrl)
              ));
            },
          )
        ],
      ),
    );
  }

}
