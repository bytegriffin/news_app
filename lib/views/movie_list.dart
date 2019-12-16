import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/movie.dart';
import '../components/star_rating.dart';
import '../util/imageutil.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  MovieList movieList;
  int size = 0;

  _getMoreData(){
//    HttpClient.request(THEATERS_MOVIE).then((res){
//      if(mounted){
//        setState(() {
//          this.movieList = MovieList.fromJson(res.data);
//          this.size = movieList.subjects.length;
//        });
//      }
//    });
    HttpClient.get(THEATERS_MOVIE, (result){
      if(mounted){
        setState(() {
          this.movieList = MovieList.fromJson(result);
          this.size = movieList.subjects.length;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }

  @override
  void initState(){
    super.initState();
    _getMoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.separated(
        itemCount: size,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return Container(
            child: getItem(movieList.subjects[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget getItem(Movie movie) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: getCachedImage(movie.image),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                height: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      "类型：${movie.genres} ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    getMovieRatingWidget(movie.rating),
                    Text(
                        "导演：${movie.directors}"
                    ),
                    Text(
                        "上映日期：${movie.pubdates}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                        '演员：${movie.casts}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
    return Card(
      child: row,
    );
  }

  Widget getMovieRatingWidget(String score){
    return Row(
      children: <Widget>[
        Text('豆瓣评分：'),
        StarRating(
          rating: double.parse(score),
          size:20,
          selectedColor:Colors.orange,
          unselectedColor: Colors.grey,
        ),
        Text(score)
      ],
    );
  }


}


