import 'package:flutter/material.dart';
import '../util/color_util.dart';
import 'hot_artist_list.dart';
import '../components/sliver_appbar_delegate.dart';
import 'hynan_artist_list.dart';
import 'hynv_artist_list.dart';
import 'hyband_artist_list.dart';
import 'omnan_artist_list.dart';
import 'omnv_artist_list.dart';
import 'omband_artist_list.dart';
import 'rbnan_artist_list.dart';
import 'rbnv_artist_list.dart';
import 'rbband_artist_list.dart';
import 'hgnan_artist_list.dart';
import 'hgnv_artist_list.dart';
import 'hgband_artist_list.dart';
import 'qtnan_artist_list.dart';
import 'qtnv_artist_list.dart';
import 'qtband_artist_list.dart';
import 'rz_artist_list.dart';

// 歌手页面
class ArtistIndexPage extends StatefulWidget {
  @override
  _ArtistIndexPageState createState() => _ArtistIndexPageState();
}

class _ArtistIndexPageState extends State<ArtistIndexPage> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length:17, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("歌手"),
        leading:GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
              delegate: SliverAppBarDelegate(TabBar(
                isScrollable: true,
                labelColor: getTabColor(context),
                unselectedLabelColor: getUnselectedLabelColor(),
                tabs: [
                  new Tab(child: Text('热门歌手')),
                  new Tab(child: Text('华语男歌手')),
                  new Tab(child: Text('华语女歌手')),
                  new Tab(child: Text('华语组合/乐队')),
                  new Tab(child: Text('欧美男歌手')),
                  new Tab(child: Text('欧美女歌手')),
                  new Tab(child: Text('欧美组合/乐队')),
                  new Tab(child: Text('日本男歌手')),
                  new Tab(child: Text('日本女歌手')),
                  new Tab(child: Text('日本组合/乐队')),
                  new Tab(child: Text('韩国男歌手')),
                  new Tab(child: Text('韩国女歌手')),
                  new Tab(child: Text('韩国组合/乐队')),
                  new Tab(child: Text('其他男歌手')),
                  new Tab(child: Text('其他女歌手')),
                  new Tab(child: Text('其他组合/乐队')),
                  new Tab(child: Text('入驻歌手')),
                ],
                controller: tabController,
              ))
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                new Center(child: HotArtistListPage()),
                new Center(child: HYNanArtistListPage()),
                new Center(child: HYNvArtistListPage()),
                new Center(child: HYBandArtistListPage()),
                new Center(child: OMNanArtistListPage()),
                new Center(child: OMNvArtistListPage()),
                new Center(child: OMBandArtistListPage()),
                new Center(child: RBNanArtistListPage()),
                new Center(child: RBNvArtistListPage()),
                new Center(child: RBBandArtistListPage()),
                new Center(child: HGNanArtistListPage()),
                new Center(child: HGNvArtistListPage()),
                new Center(child: HGBandArtistListPage()),
                new Center(child: QTNanArtistListPage()),
                new Center(child: QTNvArtistListPage()),
                new Center(child: QTBandArtistListPage()),
                new Center(child: RZArtistListPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

}