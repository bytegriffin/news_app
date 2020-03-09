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
import 'custom_free_movie_index.dart';

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
    freeMovieList.add(FreeMovie("25905044",PageType.Movie,"刺猬索尼克","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2581703367.webp","https://s2.jxtvsb.com/2020/03/07/g6V4MDR3er8Q9du2/index.m3u8"));
    freeMovieList.add(FreeMovie("30160393",PageType.Movie,"哈莉·奎因：猛禽小队","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575974437.webp","https://v3.szjal.cn/20200308/9pDBprOJ/index.m3u8"));
    freeMovieList.add(FreeMovie("27000084",PageType.Movie,"变身特工","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2577340942.webp","https://v3.szjal.cn/20200307/3EnAmov2/index.m3u8"));
    freeMovieList.add(FreeMovie("27080656",PageType.Movie,"普罗米亚","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2546169134.webp","https://tv1.youkutv.cc/2020/02/06/eHmnGiFPDVfE1ZrN/playlist.m3u8"));
    freeMovieList.add(FreeMovie("30257175",PageType.Movie,"燃烧女子的肖像","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584308261.webp","https://youku.com-ok-56.com/20191218/20838_c8c7eaf0/index.m3u8"));
    freeMovieList.add(FreeMovie("30241298",PageType.Movie,"南山的部长们","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2581888792.webp","https://hallo.sc2yun.com/vod/hls/1582382365084_naann0f8nn8t.m3u8"));
 }

  _getMovies(){
    //最新电影
    HttpClient.getMovie(NEW_MOVIE_URL+"0", (result){
      if(mounted){
        setState(() {
          this.newMovieList = TopMovieList.fromJson(result).subjects;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门电视剧
    HttpClient.getMovie(HOT_TV_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotTvList = TopMovieList.fromJson(result).subjects;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门综艺
    HttpClient.getMovie(HOT_ENT_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotEntList = NewMovieList.fromJson(result).data;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门动漫
    HttpClient.getMovie(HOT_COMIC_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotComicList = NewMovieList.fromJson(result).data;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门纪录片
    HttpClient.getMovie(HOT_DOC_URL+"0", (result){
      if(mounted){
        setState(() {
          this.hotDocList = NewMovieList.fromJson(result).data;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门短片
    HttpClient.getMovie(HOT_SORT_URL+"0", (result){
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
          buildRowMovieCard1(context,"免费电影",CustomFreeMovieIndexPage(), generateDefaultFreeMovieList()),
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
                  builder: (context) => CustomFreeMovieIndexPage()
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
