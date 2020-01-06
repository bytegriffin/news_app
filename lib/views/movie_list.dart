import 'package:flutter/material.dart';
import '../components/star_rating.dart';
import '../util/image_util.dart';
import '../models/top_movie.dart';
import '../components/custom_card.dart';
import 'movie_detail.dart';

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
      color: Colors.white,
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
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing:0.0,
                crossAxisSpacing:0.0,
                childAspectRatio: 6 / 9,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: getCachedImage(movieList[index].image),
                              ),
                              height: 160,
                              width: 200,
                            ),
                            Container(
                              child: Text(movieList[index].title,overflow: TextOverflow.ellipsis,
                                  maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
                            ),
                            getMovieRatingWidget(movieList[index]?.rate??"0.0")
                          ],
                        )
                    ),
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


