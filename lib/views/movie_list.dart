import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../models/top_movie.dart';
import '../components/custom_card.dart';
import 'movie_detail.dart';
import '../util/color_util.dart';

class MovieListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final List<TopMovie> topMovieList;
  MovieListPage(this.title, this.backgroundImage,this.topMovieList);
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> with AutomaticKeepAliveClientMixin{
  List<TopMovie> movieList;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();
    movieList =widget.topMovieList;
  }

  List<Widget> getHotMovieList() {
    return movieList.map((item) => getMovieRowItem(context, item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: getTopListBGColor(context),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
            ],
//            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              background: Image.asset(widget.backgroundImage, fit:BoxFit.cover,),
            ),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,
              mainAxisSpacing:0.0,
              crossAxisSpacing:0.0,
              childAspectRatio: 10 / 16,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                     margin: EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: getCachedImage(movieList[index].image),
                            ),
                            height: 170,
                            width: 200,
                          ),
                          Text(movieList[index].title, overflow: TextOverflow.ellipsis, maxLines: 1,
                              style: TextStyle(fontSize: 16.0,color: getTextColor(context),decoration: TextDecoration.none))
                        ],
                      )
                  ),//getMovieRatingWidget(movie?.rate??"0.0")
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MovieDetailPage(movieList[index].id)
                    ));
                  },
                );
              },
              childCount: movieList.length,
            ),
          )
        ],
      ),
    );
  }

}


