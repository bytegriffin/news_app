import 'package:flutter/material.dart';
import 'book_index.dart';
import 'movie_index.dart';
import 'music_index.dart';
import '../util/color_util.dart';
import '../components/over_scroll_behavior.dart';

class OtherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new TabBar(
          labelColor:getTabColor(context),
          unselectedLabelColor: getUnselectedLabelColor(),
          tabs: <Widget>[
            new Tab(child: Row(
              children: <Widget>[
                Icon(Icons.library_books),
                Text(' '),
                Text('图书资讯')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
             ),
            ),
            new Tab(child: Row(
              children: <Widget>[
                Icon(Icons.movie,),
                Text(' '),
                Text('电影资讯')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            ),
            new Tab(child: Row(
              children: <Widget>[
                Icon(Icons.music_video,),
                Text(' '),
                Text('音乐资讯')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            ),
          ],
          //controller: _tabController,
        ),
        body: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: new TabBarView(
            children: <Widget>[
              new Center(child: BookIndexPage()),
              new Center(child: MovieIndexPage()),
              new Center(child: MusicIndexPage()),
            ],
          ),
        ),
      ),
    );
  }
}

