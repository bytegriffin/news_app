import 'package:flutter/material.dart';
import '../util/color_util.dart';
import '../components/sliver_appbar_delegate.dart';
import 'custom_free_movie_list.dart';
import 'custom_free_tv_list.dart';
import '../components/over_scroll_behavior.dart';

class CustomFreeMovieIndexPage extends StatefulWidget {
  @override
  _CustomFreeMovieIndexPageState createState() => _CustomFreeMovieIndexPageState();
}

class _CustomFreeMovieIndexPageState extends State<CustomFreeMovieIndexPage> with TickerProviderStateMixin{

  TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length:2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("免费区"),
        leading:GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ScrollConfiguration(
        behavior: OverScrollBehavior(),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
                delegate: SliverAppBarDelegate(TabBar(
                  //isScrollable: true,
                  labelColor: getTabColor(context),
                  unselectedLabelColor: getUnselectedLabelColor(),
                  tabs: [
                    Tab(text: '免费电影'),
                    Tab(text: '免费剧集'),
                  ],
                  controller: tabController,
                ))
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: TabBarView(
                controller: this.tabController,
                children: <Widget>[
                  CustomFreeMovieListPage(),
                  CustomFreeTVListPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
