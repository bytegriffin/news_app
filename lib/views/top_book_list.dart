import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../models/top_book.dart';
import 'search_book_detail.dart';
import '../net/httpclient.dart';
import '../views/top_book_detail.dart';
import '../util/color_util.dart';
import '../components/over_scroll_behavior.dart';

//图书榜单列表
class TopBookListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final String url;
  TopBookListPage(this.title, this.backgroundImage, this.url);
  @override
  _TopBookListPageState createState() => _TopBookListPageState();
}

class _TopBookListPageState extends State<TopBookListPage> with AutomaticKeepAliveClientMixin{
  List<TopBook> bookList;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    HttpClient.get(widget.url, (result){
      if(mounted){
        setState(() {
          this.bookList = TopBookList.fromJson(result).list;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: buildScrollView(),
    );
  }

  Widget buildScrollView(){
    return ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
            ],
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              background: Image.asset(widget.backgroundImage, fit:BoxFit.cover,),
            ),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return getItem(bookList[index]);
                },
              childCount: bookList?.length??0
            ),
            itemExtent: 160.0,
          )
        ],
      ),
    );
  }

  Widget getItem(TopBook book) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Icon(Icons.bookmark,color: rankIconColor,size: 50,),
              Text(
                book.currentRank,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: rankTextColor
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: getCachedImage(book.image)
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8.0),
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    book.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    '作者：${book.authors}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    book.editorHighlight??book.abstract,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle( fontWeight: FontWeight.w600,),
                  ),
                  Text(
                    "约 ${book.wordCount} | ${book.kindNames} ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );

    return GestureDetector(
      child: Card(
        child: row,
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => _visitBookDetail(book)
        ));
      },
    );
  }

  Widget _visitBookDetail(TopBook book){
    if(book.isOrigin){
      return TopBookDetailPage(book);
    }
    return SearchBookDetailPage(book?.searchId);
  }

}


