import 'package:flutter/material.dart';
import '../models/free_book.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/free_book_post_data.dart';
import 'free_book_detail.dart';

// 医药卫生列表页面
class YYWSFreeBookListPage extends StatefulWidget {
  @override
  _YYWSFreeBookListPageState createState() => _YYWSFreeBookListPageState();
}

class _YYWSFreeBookListPageState extends State<YYWSFreeBookListPage> with AutomaticKeepAliveClientMixin{
  List<FreeBook> bookList;
  int size = 0;
  int _pageNum = 0;
  var datas = [];

  @override
  bool get wantKeepAlive => true;

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    setState(() {
      this._pageNum = 1;
      _getMoreData(false);
    });
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    setState(() {
      this._pageNum += 1;
      _getMoreData(true);
    });
  }

  _getMoreData(bool _ifAdd){
    HttpClient.postFreeBook(FREE_BOOK_LIST_URL, YYWSBookPostData(this._pageNum).toJson(),(result){
      if (mounted) {
        Map<String,dynamic> subjects  = json.decode(result) as Map;
        setState(() {
          bookList = FreeBookList.fromJson(subjects).list;
          if (_ifAdd) {
            datas.addAll(bookList);
          } else {
            datas.clear();
            datas = bookList;
          }
          size = datas.length;
        });
      }
    }, errorCallBack: (error) {
      print(error);
    });
  }

  @override
  void initState(){
    super.initState();
    _addMoreData();
  }

  Widget getItem(FreeBook book) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setHeight(280),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(book.cover),
            ),
          ),
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(280),
              margin: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    book.name,
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
                    book.desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle( fontWeight: FontWeight.w600,),
                  ),
                  Text(
                    "发布日期：${book.pubDate}",
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
            builder: (context) => FreeBookDetailPage(book.id)
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: EasyRefresh(
        header: BallPulseHeader(),
        footer: BallPulseFooter(),
        onRefresh: _refreshData,
        onLoad: _addMoreData,
        child: new ListView.separated(
          itemCount: size,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return getItem(datas[index]);
          },
          separatorBuilder: (context, index) {
            return Container();
          },
        ),
      ),
    );
  }
}
