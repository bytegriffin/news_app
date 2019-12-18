import 'package:flutter/material.dart';
import 'rec_news_list.dart';
import 'gn_news_list.dart';
import 'gj_news_list.dart';
import 'sport_news_list.dart';
import 'finance_news_list.dart';
import 'tech_news_list.dart';
import 'history_news_list.dart';
import 'car_news_list.dart';
import 'game_news_list.dart';
import 'ent_news_list.dart';
import 'fashion_news_list.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 11,
      child: new Scaffold(
        appBar: new TabBar(
          isScrollable: true, //是否滚动
          labelColor: Colors.red,
          unselectedLabelColor: Color(0xff666666),
          labelStyle: TextStyle(fontSize: 16.0),
          tabs: <Widget>[
            new Tab(
                child: Text('推荐')
            ),
            new Tab(
                child: Text('国内')
            ),
            new Tab(
                child:Text('国外')
            ),
            new Tab(
                child:Text('科技')
            ),
            new Tab(
                child:Text('财经')
            ),
            new Tab(
                child:Text('历史')
            ),
            new Tab(
                child:Text('汽车')
            ),
            new Tab(
                child:Text('体育')
            ),
            new Tab(
                child:Text('游戏')
            ),
            new Tab(
                child:Text('时尚'),
            ),
            new Tab(
              child:Text('娱乐'),
            ),
          ],
          //controller: _tabController,
        ),
        body: new TabBarView(
          children: <Widget>[
            new Center(child: RecNewsListPage()),
            new Center(child: GNNewsListPage()),
            new Center(child: GJNewsListPage()),
            new Center(child: TechNewsListPage()),
            new Center(child: FinanceNewsListPage()),
            new Center(child: HistoryNewsListPage()),
            new Center(child: CarNewsListPage()),
            new Center(child: SportNewsListPage()),
            new Center(child: GameNewsListPage()),
            new Center(child: FashionNewsListPage()),
            new Center(child: EntNewsListPage()),
          ],
        ),
      ),
    );
  }

}


