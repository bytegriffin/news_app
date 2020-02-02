import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/free_movie.dart';
import '../util/image_util.dart';
import 'free_movie_detail.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';

//免费电影列表页
class FreeMovieListPage extends StatefulWidget {
  @override
  FreeMovieListPageState createState() => new FreeMovieListPageState();
}

class FreeMovieListPageState extends State<FreeMovieListPage> {

  int _pageNum = 0;
 //  int _size = 10;
 //  int _beLoad = 0; // 0表示不显示, 1表示正在请求, 2表示没有更多数据

  var datas = [];
  var datanames = [];

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    setState(() {
      this._pageNum = 1;
      _getMoreData(false);
    });
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    setState(() {
      this._pageNum += 1;
      _getMoreData(true);
    });
  }

  // 请求数据
  void _getMoreData(bool _ifAdd) async {
    HttpClient.get(FREE_MOVIE_LIST_URL+this._pageNum.toString(), (result) {
      if(mounted){
        setState(() {
          var hlist  = FreeMovieList.fromJson(result).list;
          if (_ifAdd) {
            for(int i=0; i<hlist.length; i++) {
              if (datanames.contains(hlist[i].name)) {
                 continue;
              }
              datanames.add(hlist[i].name);
              datas.add(hlist[i]);
            }
          } else {
            datas.clear();
            datanames.clear();
            datas = hlist;
            hlist.forEach((v) {
              datanames.add(v.name);
            });
          }
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    // 首次拉取数据
 //   _getNewData(true);
//    _scrollController.addListener(() {
//      if (_scrollController.position.pixels ==
//          _scrollController.position.maxScrollExtent) {
//        _addMoreData();
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("免费观影"),
      ),
      body: EasyRefresh(
        header: BallPulseHeader(),
        footer: BallPulseFooter(),
        onRefresh: _refreshData,
        onLoad: _addMoreData,
        child: GridView.count(
          primary: false,
          shrinkWrap:true,
          //水平子Widget之间间距
          crossAxisSpacing:1.0,
          //垂直子Widget之间间距
          mainAxisSpacing: 2.0,
          //GridView内边距
          padding: EdgeInsets.all(1.0),
          //一行的Widget数量
          crossAxisCount: 3,
          //子Widget宽高比例
          childAspectRatio: 4 / 5,
          children: getWidgetList(),
        )
      ),
    );
  }

  List<Widget> getWidgetList() {
    return datas.map((item) => getMovieItem(item)).toList();
  }

  Widget getMovieItem(FreeMovie movie){
    return Container(
      padding: EdgeInsets.all(1.0),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 130,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: getCachedImage(movie?.image??defaultCastImage),
              ),
            ),
            Container(
              width: 130,
              child: Text("${movie?.name}",overflow: TextOverflow.ellipsis,
                  maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
            ),
          ],
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => FreeMovieDetailPage(movie)
          ));
        },
      ),
    );
  }


}