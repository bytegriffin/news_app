import 'package:flutter/material.dart';
import 'news_video_list.dart';
import 'tv_live.dart';
import 'yingshi_video_list.dart';
import 'yinyue_video_list.dart';
import 'dongman_video_list.dart';
import 'youxi_video_list.dart';
import 'zongyi_video_list.dart';
import 'wenhua_video_list.dart';
import 'meishi_video_list.dart';
import 'shishang_video_list.dart';
import 'gaoxiao_video_list.dart';
import 'chongwu_video_list.dart';
import 'qiche_video_list.dart';
import 'tiyu_video_list.dart';
import '../util/color_util.dart';

class VideoIndexPage extends StatefulWidget {
  @override
  _VideoIndexPageState createState() => _VideoIndexPageState();
}

class _VideoIndexPageState extends State<VideoIndexPage> with SingleTickerProviderStateMixin{
  TabController controller;

  List<Tab> tabs = [
    new Tab(child:Text('新闻')),
    new Tab(child:Text('电视直播')),
    new Tab(child:Text('影视')),
    new Tab(child:Text('音乐')),
    new Tab(child:Text('动漫')),
    new Tab(child:Text('游戏')),
    new Tab(child:Text('综艺')),
    new Tab(child:Text('文化')),
    new Tab(child:Text('美食')),
    new Tab(child:Text('时尚')),
    new Tab(child:Text('搞笑')),
    new Tab(child:Text('宠物')),
    new Tab(child:Text('汽车')),
    new Tab(child:Text('体育')),
  ];

  @override
  void initState() {
    super.initState();
    // initialIndex 表示默认选中第一个
    controller = TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: tabs.length,
      child: new Scaffold(
        appBar: new TabBar(
          // controller: controller,
          isScrollable: true, //是否滚动
          labelColor: getTabColor(context),
          unselectedLabelColor: getUnselectedLabelColor(),
          labelStyle: TextStyle(fontSize: 16.0),
          tabs: tabs,
        ),
        body: new TabBarView(
          children: <Widget>[
            new Center(child: NewsVideoListPage()),
            new Center(child: TvLivePage()),
            new Center(child: YingshiVideoListPage()),
            new Center(child: YinyueVideoListPage()),
            new Center(child: DongmanVideoListPage()),
            new Center(child: YouxiVideoListPage()),
            new Center(child: ZongyiVideoListPage()),
            new Center(child: WenhuaVideoListPage()),
            new Center(child: MeishiVideoListPage()),
            new Center(child: ShishangVideoListPage()),
            new Center(child: GaoxiaoVideoListPage()),
            new Center(child: ChongwuVideoListPage()),
            new Center(child: QicheVideoListPage()),
            new Center(child: TiyuVideoListPage()),
          ],
        ),
      ),
    );
  }
}


