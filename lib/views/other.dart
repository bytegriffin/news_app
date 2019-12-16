import 'package:flutter/material.dart';
import 'book_list.dart';
import 'movie_list.dart';
import 'music_list.dart';

class OtherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new TabBar(
          labelColor:Colors.black,
          tabs: <Widget>[
            new Tab(child: Row(
              children: <Widget>[
                Icon(Icons.book, color: Colors.redAccent),
                Text(' '),
                Text('推荐阅读')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
             ),
            ),
            new Tab(child: Row(
              children: <Widget>[
                Icon(Icons.movie, color: Colors.redAccent),
                Text(' '),
                Text('最新上映')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            ),
            new Tab(child: Row(
              children: <Widget>[
                Icon(Icons.music_video, color: Colors.redAccent),
                Text(' '),
                Text('最新音乐')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            ),
          ],
          //controller: _tabController,
        ),
        body: new TabBarView(
          children: <Widget>[
            new Center(child: BookListPage()),
            new Center(child: MovieListPage()),
            new Center(child: MusicListPage()),
          ],
        ),
      ),
    );
  }
}

