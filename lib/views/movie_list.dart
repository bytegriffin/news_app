import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../models/top_movie.dart';
import 'movie_detail.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/star_rating.dart';
import '../util/color_util.dart';

class MovieListPage extends StatefulWidget {
  final String title;
  final TopMovieType type;
  MovieListPage(this.title, this.type);
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<TopMovie> movieList;
  int size = 0;
  int _pageNum = -20;
  var datas = [];
  String url ;

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    setState(() {
      this._pageNum = 0;
      _getMoreData(false);
    });
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    setState(() {
      this._pageNum = this._pageNum + 20;
      _getMoreData(true);
    });
  }

  _getMoreData(bool _ifAdd) {
    HttpClient.get(url + _pageNum.toString(), (result) {
      if (mounted) {
        setState(() {
          if(widget.type == TopMovieType.NewMovie || widget.type == TopMovieType.TV){
            this.movieList = TopMovieList.fromJson(result).subjects;
          } else {
            this.movieList = NewMovieList.fromJson(result).data;
          }
          if (_ifAdd) {
            datas.addAll(movieList);
          } else {
            datas.clear();
            datas = movieList;
          }
          size = datas.length;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    switch(widget.type){
      case TopMovieType.NewMovie:
        url = NEW_MOVIE_URL;
        break;
      case TopMovieType.TV:
        url = HOT_TV_URL;
        break;
      case TopMovieType.Ent:
        url = HOT_ENT_URL;
        break;
      case TopMovieType.Comic:
        url = HOT_COMIC_URL;
        break;
      case TopMovieType.Doc:
        url = HOT_DOC_URL;
        break;
      case TopMovieType.Sort:
        url = HOT_SORT_URL;
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: EasyRefresh.custom(
        header: BallPulseHeader(),
        footer: BallPulseFooter(),
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(5),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 3,
                childAspectRatio: 3 / 5,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return getMovieItem(datas[index]);
                },
                childCount: size,
              ),
            ),
          )
        ],
        onRefresh: _refreshData,
        onLoad: _addMoreData,
      ),
    );
  }

  Widget getMovieItem(TopMovie movie){
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
              child: Text("${movie?.title}",overflow: TextOverflow.ellipsis,
                  maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
            ),
            Container(
              width: ScreenUtil().setWidth(240),
              child: getMovieRatingWidget(movie?.rate??"0.0", getTopListBGColor(context)),
            )
          ],
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => MovieDetailPage(movie.id)
          ));
        },
      ),
    );
  }

}
