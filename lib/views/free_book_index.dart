import 'package:flutter/material.dart';
import '../util/color_util.dart';
import '../components/sliver_appbar_delegate.dart';
import 'jsj_free_book_list.dart';
import 'ml_free_book_list.dart';
import 'zxzj_free_book_list.dart';
import 'sk_free_book.list.dart';
import 'zf_free_book_list.dart';
import 'js_free_book_list.dart';
import 'jj_free_book_list.dart';
import 'wh_free_book_list.dart';
import 'yy_free_book_list.dart';
import 'ys_free_book_list.dart';
import 'ls_free_book_list.dart';
import 'zr_free_book_list.dart';
import 'slh_free_book_list.dart';
import 'tw_free_book_list.dart';
import 'sw_free_book_list.dart';
import 'yyws_free_book_list.dart';
import 'ny_free_book_list.dart';
import 'gy_free_book_list.dart';
import 'jt_free_book_list.dart';
import 'hk_free_book_list.dart';
import 'hj_free_book_list.dart';

class FreeBookIndexPage extends StatefulWidget {
  @override
  _FreeBookIndexPageState createState() => _FreeBookIndexPageState();
}

class _FreeBookIndexPageState extends State<FreeBookIndexPage> with TickerProviderStateMixin{

  TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length:21, vsync: this);
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
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
              delegate: SliverAppBarDelegate(TabBar(
                isScrollable: true,
                labelColor: getTabColor(context),
                unselectedLabelColor: getUnselectedLabelColor(),
                tabs: [
                  Tab(text: '计算机'),

                  Tab(text: '社科'),
                  Tab(text: '经济'),
                  Tab(text: '语言'),
                  Tab(text: '历史'),
                  Tab(text: '自然'),
                  Tab(text: '文化'),
                  Tab(text: '数理化'),
                  Tab(text: '政法'),
                  Tab(text: '天文'),
                  Tab(text: '生物'),
                  Tab(text: '艺术'),
                  Tab(text: '医药'),
                  Tab(text: '军事'),
                  Tab(text: '工业'),
                  Tab(text: '农业'),
                  Tab(text: '交通'),
                  Tab(text: '航空'),
                  Tab(text: '环境'),
                  Tab(text: '哲学'),
                  Tab(text: '马列'),

                ],
                controller: tabController,
              ))
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                JSJFreeBookListPage(),

                SKFreeBookListPage(),
                JJFreeBookListPage(),
                YYFreeBookListPage(),
                LSFreeBookListPage(),
                ZRFreeBookListPage(),
                WHFreeBookListPage(),
                SLHFreeBookListPage(),
                ZFFreeBookListPage(),
                TWFreeBookListPage(),
                SWFreeBookListPage(),
                YSFreeBookListPage(),
                YYWSFreeBookListPage(),
                JSFreeBookListPage(),
                GYFreeBookListPage(),
                NYFreeBookListPage(),
                JTFreeBookListPage(),
                HKFreeBookListPage(),
                HJFreeBookListPage(),
                ZXZJFreeBookListPage(),
                MLFreeBookListPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }


}


