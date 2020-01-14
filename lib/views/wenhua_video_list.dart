import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/video_tile_card.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/haokan_video.dart';

// 文化视频
class WenhuaVideoListPage extends StatefulWidget {
  @override
  WenhuaVideoListPageState createState() => new WenhuaVideoListPageState();
}

class WenhuaVideoListPageState extends State<WenhuaVideoListPage> with AutomaticKeepAliveClientMixin {

  ScrollController _scrollController = new ScrollController();

  //  @override
  bool get wantKeepAlive => true;

//  int _page = 0;
//  int _size = 10;
//  int _beLoad = 0; // 0表示不显示, 1表示正在请求, 2表示没有更多数据

  var datas = [];

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    //  _page = 0;
    _getNewData(false);
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    // _page++;
    _getNewData(true);
  }

  // 请求新数据
  void _getNewData(bool _ifAdd) async {
    HttpClient.getVideoApi(WENHUA_VIDEO_URL, (result) {
      if(mounted){
        setState(() {
          var hlist  = HaoKanVideoList.fromJson(result).list;
          if (_ifAdd) {
            datas.addAll(hlist);
          } else {
            datas.clear();
            datas = hlist;
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
    _getNewData(true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _addMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Container(
        color: Colors.grey[100],
        child: StaggeredGridView.countBuilder(
          controller: _scrollController,
          itemCount: datas.length,
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) => VideoTileCard(
            haoKanVideo: datas[index],
            worksAspectRatio: index == 0 ? 2.5 : 3,
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index == 0 ? 2.5 : 3),
        ),
      ),
    );
  }

}