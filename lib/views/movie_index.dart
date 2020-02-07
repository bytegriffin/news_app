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
import 'free_movie_list.dart';
import '../models/free_movie.dart';

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
  List<SwiperMovie> swMovieList = List<SwiperMovie>.generate(2, (int index){
    if(index == 0){
      return SwiperMovie("经典影片",classicMovieImage,top250MovieUrl);
    }
    return SwiperMovie("本周口碑榜",weeklyMovieImage,weeklyMovieUrl);
  });

  @override
  bool get wantKeepAlive => true;

  _buildFreeMovies(){
    freeMovieList.add(FreeMovie("30329892","航海王：狂热行动","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2570039912.webp","https://youku.haokzy-tudou.com/ppvod/jsFEkdYf.m3u8"));
    freeMovieList.add(FreeMovie("30252495","1917","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2570243317.webp","https://youku.haokzy-tudou.com/ppvod/k71LPzr8.m3u8"));
    freeMovieList.add(FreeMovie("27119724","小丑 Joker","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2567198874.webp","https://youku.haokzy-tudou.com/ppvod/4yf2LZrW.m3u8"));
    freeMovieList.add(FreeMovie("6981153","爱尔兰人","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2568902055.webp","https://youku.haokzy-tudou.com/ppvod/0p8xRuyT.m3u8"));
    freeMovieList.add(FreeMovie("26786669","决战中途岛","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2573582192.webp","https://youku.haokzy-tudou.com/ppvod/HmZTkPxP.m3u8"));
    freeMovieList.add(FreeMovie("30394807","蜡笔小新：新婚旅行飓风之遗失的野原广志","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2549326655.webp","https://youku.haokzy-tudou.com/ppvod/G3zC6Lt5.m3u8"));
    freeMovieList.add(FreeMovie("26100958","复仇者联盟4：终局之战","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2552058346.webp","https://youku.haokzy-tudou.com/ppvod/fhAfitLK.m3u8"));
    freeMovieList.add(FreeMovie("30318116","利刃出鞘","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2574172427.webp","https://youku.haokzy-tudou.com/ppvod/mhcf32Ti.m3u8"));
    freeMovieList.add(FreeMovie("30327842","82年生的金智英","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2578045524.webp","https://youku.haokzy-tudou.com/ppvod/fhLte5FN.m3u8"));
    freeMovieList.add(FreeMovie("6538866","极速车王","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2568792942.webp","https://youku.haokzy-tudou.com/ppvod/LkEdxNf9.m3u8"));
    freeMovieList.add(FreeMovie("27087724","好莱坞往事","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551119672.webp","https://youku.haokzy-tudou.com/ppvod/GchvsIPV.m3u8"));
    freeMovieList.add(FreeMovie("27002635","唐顿庄园","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575400017.webp","https://youku.haokzy-tudou.com/ppvod/8EZvxIyB.m3u8"));
    freeMovieList.add(FreeMovie("30334073","调音师","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551995207.webp","https://youku.haokzy-tudou.com/ppvod/JkvezV4x.m3u8"));
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
          buildRowFreeMovieCard(context,"免费观影", freeMovieList),
          Container(height: 20,),
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

  Widget _buildSwiperImage(int index){
    if(index == 0){
      return Image.asset(swMovieList[index]?.image??"",fit: BoxFit.cover);
    }
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(swMovieList[index]?.image??"",fit: BoxFit.cover),
        Positioned(
          top: 20,
          right: 30,
          child: Text("本周口碑榜",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 34.0,color: Colors.white)),
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
                  builder: (context) => TopMovieListPage("正在热映",searchMovieImage,theatersMovieUrl)
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
                  builder: (context) => TopMovieListPage("即将上映",searchMovieImage,commingUpMovieUrl)
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
                  builder: (context) => FreeMovieListPage()
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
                  builder: (context) => TopMovieListPage("新片榜",searchMovieImage,newMovieUrl)
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
                  builder: (context) => TopMovieListPage("北美票房榜",searchMovieImage,usMovieUrl)
              ));
            },
          )
        ],
      ),
    );
  }

}
