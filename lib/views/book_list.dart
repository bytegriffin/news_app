import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../models/top_book.dart';
import 'book_detail.dart';

class BookListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final List<TopBook> topBookList;
  BookListPage(this.title, this.backgroundImage,this.topBookList);
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> with AutomaticKeepAliveClientMixin{
  List<TopBook> bookList;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    bookList = widget.topBookList;
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
    return Container(
      //height: 400,
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
              childCount: bookList.length
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
                    '作者：${book.author}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    book.abstract,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle( fontWeight: FontWeight.w600,),
                  ),
                  Text(
                    "约 ${book.wordCount} | ${book.kinds} ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
            builder: (context) => BookDetailPage(book?.id)
        ));
      },
    );
  }

}


