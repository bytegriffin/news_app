import 'package:flutter/material.dart';
import 'package:news_app/net/http_config.dart';
import '../models/lyric.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import '../models/song.dart';
import 'lyric_painter.dart';
import '../net/httpclient.dart';
import 'package:audioplayers/audioplayers.dart';

class LyricPage extends StatefulWidget  {

  final Song song;
  final AudioPlayer audioPlayer;
  final Stream<String> stream;
  LyricPage(this.song,this.audioPlayer,this.stream);

  @override
  _LyricPageState createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> with TickerProviderStateMixin{

  LyricPainter _lyricPatiner;
  LyricData _lyricData;
  List<Lyric> lyrics;
  AnimationController _lyricOffsetYController;
  int curSongId;
  Timer dragEndTimer; // 拖动结束任务
  Function dragEndFunc;
  Duration dragEndDuration = Duration(milliseconds: 1000);


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      curSongId = int.parse(widget.song.id);
      _request();
    });

    dragEndFunc = () {
      if (_lyricPatiner.isDragging) {
        setState(() {
          _lyricPatiner.isDragging = false;
        });
      }
    };
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _request() async {
    HttpClient.get(LYRICS_URL+widget.song.id, (result){
      if(mounted){
        setState(() {
          _lyricData = LyricData.fromJson(result);
        });
        setState(() {
          lyrics = formatLyric(_lyricData.lrc.lyric);
          _lyricPatiner = LyricPainter(lyrics, 0);
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }


  @override
  Widget build(BuildContext context) {
    // 当前歌的id变化之后要重新获取歌词
    if (curSongId != int.parse(widget.song.id)) {
      lyrics = null;
      curSongId = int.parse(widget.song.id);
      _request();
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: lyrics == null
            ? Container(
          alignment: Alignment.center,
          child: Text(
            '歌词加载中...',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        )
            : GestureDetector(
          onTapDown: _lyricPatiner.isDragging
              ? (e) {
            if (e.localPosition.dx > 0 &&
                e.localPosition.dx < ScreenUtil().setWidth(100) &&
                e.localPosition.dy >
                    _lyricPatiner.canvasSize.height / 2 -
                        ScreenUtil().setWidth(100) &&
                e.localPosition.dy <
                    _lyricPatiner.canvasSize.height / 2 +
                        ScreenUtil().setWidth(100)) {
              widget.audioPlayer.seek(Duration(milliseconds: _lyricPatiner.dragLineTime));
            }
          }
              : null,
          onVerticalDragUpdate: (e) {
            if (!_lyricPatiner.isDragging) {
              setState(() {
                _lyricPatiner.isDragging = true;
              });
            }
            _lyricPatiner.offsetY += e.delta.dy;
          },
          onVerticalDragEnd: (e) {
            // 拖动防抖
            cancelDragTimer();
          },
          child: StreamBuilder<String>(
            stream: widget.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var curTime = double.parse(snapshot.data
                    .substring(0, snapshot.data.indexOf('-')));
                // 获取当前在哪一行
                int curLine = findLyricIndex(curTime, lyrics);
                if (!_lyricPatiner.isDragging) {
                  startLineAnim(curLine);
                }
                // 给 customPaint 赋值当前行
                _lyricPatiner.curLine = curLine;
                return CustomPaint(
                  size: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      ScreenUtil().setWidth(150) -
                      ScreenUtil().setWidth(50) -
                      MediaQuery.of(context).padding.top -
                      ScreenUtil().setWidth(120)),
                  painter: _lyricPatiner,
                );
              } else {
                return Container();
              }
            },
          ),
        ));
  }

  void cancelDragTimer() {
    if (dragEndTimer != null) {
      if (dragEndTimer.isActive) {
        dragEndTimer.cancel();
        dragEndTimer = null;
      }
    }
    dragEndTimer = Timer(dragEndDuration, dragEndFunc);
  }

  /// 开始下一行动画
  void startLineAnim(int curLine) {
    // 判断当前行和 customPaint 里的当前行是否一致，不一致才做动画
    if (_lyricPatiner.curLine != curLine) {
      // 如果动画控制器不是空，那么则证明上次的动画未完成，
      // 未完成的情况下直接 stop 当前动画，做下一次的动画
      if (_lyricOffsetYController != null) {
        _lyricOffsetYController.stop();
      }

      // 初始化动画控制器，切换歌词时间为300ms，并且添加状态监听，
      // 如果为 completed，则消除掉当前controller，并且置为空。
      _lyricOffsetYController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 300))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _lyricOffsetYController.dispose();
            _lyricOffsetYController = null;
          }
        });
      // 计算出来当前行的偏移量
      var end = _lyricPatiner.computeScrollY(curLine) * -1;
      // 起始为当前偏移量，结束点为计算出来的偏移量
      Animation animation = Tween<double>(begin: _lyricPatiner.offsetY, end: end)
          .animate(_lyricOffsetYController);
      // 添加监听，在动画做效果的时候给 offsetY 赋值
      _lyricOffsetYController.addListener(() {
        _lyricPatiner.offsetY = animation.value;
      });
      // 启动动画
      _lyricOffsetYController.forward();
    }
  }

  /// 格式化歌词
  static List<Lyric> formatLyric(String lyricStr) {
    RegExp reg = RegExp(r"^\[\d{2}");

    List<Lyric> result =
    lyricStr.split("\n").where((r) => reg.hasMatch(r)).map((s) {
      String time = s.substring(0, s.indexOf(']'));
      String lyric = s.substring(s.indexOf(']') + 1);
      time = s.substring(1, time.length - 1);
      int hourSeparatorIndex = time.indexOf(":");
      int minuteSeparatorIndex = time.indexOf(".");
      return Lyric(
        lyric,
        startTime: Duration(
          minutes: int.parse(
            time.substring(0, hourSeparatorIndex),
          ),
          seconds: int.parse(
              time.substring(hourSeparatorIndex + 1, minuteSeparatorIndex)),
          milliseconds: int.parse(time.substring(minuteSeparatorIndex + 1)),
        ),
      );
    }).toList();

    for (int i = 0; i < result.length - 1; i++) {
      result[i].endTime = result[i + 1].startTime;
    }
    result[result.length - 1].endTime = Duration(hours: 1);
    return result;
  }

  /// 查找歌词
  static int findLyricIndex(double curDuration, List<Lyric> lyrics) {
    for (int i = 0; i < lyrics.length; i++) {
      if (curDuration >= lyrics[i].startTime.inMilliseconds &&
          curDuration <= lyrics[i].endTime.inMilliseconds) {
        return i;
      }
    }
    return 0;
  }

}

