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

// 电影首页
class MovieIndexPage extends StatefulWidget {
  @override
  _MovieIndexPageState createState() => _MovieIndexPageState();
}

class _MovieIndexPageState extends State<MovieIndexPage> with AutomaticKeepAliveClientMixin{

  List<TopMovie> hotMovieList= List.generate(6, (index) {
    return TopMovie("$index","","",defaultCastImage);
  });
  List<TopMovie> hotTvList= List.generate(6, (index) {
    return TopMovie("$index","","",defaultCastImage);
  });

  //构建默认轮播图
  List<SwiperMovie> swMovieList = List<SwiperMovie>.generate(2, (int index){
    if(index == 0){
      return SwiperMovie("经典影片",classicMovieImage,top250MovieUrl);
    }
    return SwiperMovie("好评榜单",weeklyMovieImage,weeklyMovieUrl);
  });

  @override
  bool get wantKeepAlive => true;

  _getMovies(){
    //热门电影
    HttpClient.get(HOT_MOVIE, (result){
      if(mounted){
        setState(() {
          this.hotMovieList = TopMovieList.fromJson(result).subjects;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    //热门电视剧
    HttpClient.get(HOT_TV, (result){
      if(mounted){
        setState(() {
          this.hotTvList = TopMovieList.fromJson(result).subjects;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    _getMovies();
    super.initState();
  }

  List<Widget> generateDefaultHotMovieList() {
    return hotMovieList.sublist(0,6).map((item) => getMovieRowItem(context, item)).toList();
  }

  List<Widget> generateDefaultHotTvList() {
    return hotTvList.sublist(0,6).map((item) => getMovieRowItem(context, item)).toList();
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
          buildRowMovieCard(context,"热门电影",MovieListPage("热门电影",topMovieImage, hotMovieList), generateDefaultHotMovieList()),
          buildRowMovieCard(context,"热门电视剧",MovieListPage("热门电视剧",topMovieImage, hotTvList), generateDefaultHotTvList()),
        ],
      ),
    );
  }

  //构建轮播图
  Widget _buildSwiper(){
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Swiper(
        //autoplayDisableOnInteraction: false,
        pagination: new SwiperPagination(margin: new EdgeInsets.all(1.0)),
        itemCount: 2,
        autoplay: true,
        itemBuilder: (c, i) {
          return GestureDetector(
            child: Image.asset(swMovieList[i]?.image??"",fit: BoxFit.cover),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TopMovieListPage(swMovieList[i]?.title??"",swMovieList[i]?.image??"", swMovieList[i]?.url??"")
              ));
            },
          );
        },
      ),
    );
  }

  //构建类别按钮
  Widget _buildButton(){
    return getBoxCard(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            child: Column(
              children: <Widget>[
                Icon(Icons.remove_red_eye, color: Colors.blueAccent,size: 30,),
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
