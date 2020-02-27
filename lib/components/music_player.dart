import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/song.dart';
import '../net/http_config.dart';
import '../util/image_util.dart';
import '../util/color_util.dart';
import '../views/artist_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/toast_util.dart';
import '../components/over_scroll_behavior.dart';

enum PlayerState { stopped, playing, paused }

class MusicPlayer extends StatefulWidget {
  final List<Song> songs;
  final int index;
  final PlayerMode mode;

  MusicPlayer(this.songs,this.index,{this.mode = PlayerMode.MEDIA_PLAYER});

  @override
  State<StatefulWidget> createState() {
    return _MusicPlayerState(songs, this.index, mode);
  }
}

AudioPlayer _audioPlayer;

class _MusicPlayerState extends State<MusicPlayer> with TickerProviderStateMixin{
  Song curSong;
  List<Song> _songs;
  PlayerMode mode;
  int curIndex = 0;
  int playListState = 0;//0表示循环列表，1表示单曲循环，2表示随机播放

  AudioPlayerState audioPlayerState = AudioPlayerState.STOPPED;
  Duration _duration;
  Duration _position;

  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  // get _isPaused => _playerState == PlayerState.paused;
  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  AnimationController controller; // 封面旋转控制器
  Animation<double> animation;
  AnimationController _stylusController; // 唱针控制器
  Animation<double> _stylusAnimation;

  _MusicPlayerState(this._songs, this.curIndex, this.mode);
  String mp3;

  @override
  void initState() {
    super.initState();
    mp3 = MP3_URL+widget.songs[this.curIndex].id+".mp3";
    curSong = widget.songs[this.curIndex];
    _initAudioPlayer();
    controller = AnimationController(duration: const Duration(seconds: 20), vsync: this);
    animation = new Tween(begin: 1.0, end: 2.0).animate(controller);
    _stylusController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _stylusAnimation = Tween<double>(begin: -0.03, end: -0.10).animate(_stylusController);

    _play();
  }

  void _initAudioPlayer() {
    if(_audioPlayer == null){
      _audioPlayer = AudioPlayer(mode: mode);
    }

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        _audioPlayer.startHeadlessService();
        _audioPlayer.setNotification(
            title: curSong.name,
            artist: curSong.artistNames,
            albumTitle: curSong.albumName,
            imageUrl: curSong.picUrl,
            forwardSkipInterval: const Duration(seconds: 30), // default is 30s
            backwardSkipInterval: const Duration(seconds: 30), // default is 30s
            duration: duration,
            elapsedTime: Duration(seconds: 0));
      }
    });

    _positionSubscription =
        _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
          _position = p;
        }));

    _playerCompleteSubscription =
        _audioPlayer.onPlayerCompletion.listen((event) {
          _onComplete();
          setState(() {
            _position = _duration;
          });
        });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        audioPlayerState = state;
      });
    });

    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() => audioPlayerState = state);
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    audioPlayerState = AudioPlayerState.STOPPED;
    controller.dispose();
    _stylusController.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  // 显示所有歌手列表
  Widget _displayAllArtist(){
    if(curSong.artists == null || curSong.artists.length == 0){
      return Container();
    }
    if(curSong.artists.length == 1){
      return GestureDetector(
        child: Text("${curSong?.artistNames??""} > ",
          style: TextStyle(fontSize: 16,color: artistTextColor),
          overflow: TextOverflow.ellipsis,maxLines: 1,
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => new ArtistDetailPage(curSong?.artists[0].id)
          ));
        },
      );
    } else if(curSong.artists.length > 1){
      return GestureDetector(
        child: Text("${curSong?.artistNames??""} > ",
          style: TextStyle(fontSize: 16,color: artistTextColor),
          overflow: TextOverflow.ellipsis,maxLines: 1,
        ),
        onTap: (){
          showDialog<Null>(
            context: context,
            builder: (BuildContext context) {
              return new SimpleDialog(
                title: new Text('请选择要查看的歌手'),
                children: curSong.artists.map((artist){
                  return  new SimpleDialogOption(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CircleAvatar( // 个人头像
                            radius: 20,
                            backgroundImage: AssetImage('assets/avatar.jpg')
                        ),
                      ),
                      title: Text(artist.name),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => new ArtistDetailPage(artist.id)
                      ));
                    },
                  );
                }).toList()
              );
            },
          ).then((val) {
            //rint(val);
          });
        },
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF383838),
        leading:GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(curSong.name),
            _displayAllArtist()
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              // Share.share(song.name+':'+mp3);
            },
            iconSize: 30.0,
            icon: Icon(Icons.share),
            // color: Colors.white
          )
        ],
      ),
      body: Container(
        color: Color(0xFF383838),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(150)),
                child: RotationTransition(
                  turns: controller,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(280.0),
                          child: Image.asset("assets/record.jpg",width: ScreenUtil().setWidth(580),height: ScreenUtil().setHeight(580),)
                      ),
                      CircleAvatar(
                        radius: 100.0,
                        backgroundImage:  NetworkImage(curSong?.picUrl??curSong?.album?.picUrl??defaultCastImage,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              child: RotationTransition(
                turns: _stylusAnimation,
                alignment: Alignment(
                    -1 +  (ScreenUtil().setWidth(45 * 2) / (ScreenUtil().setWidth(293))),
                    -1 + (ScreenUtil().setWidth(45 * 2) / (ScreenUtil().setHeight(504)))),
                child: Image.asset( 'assets/stylus.png',
                  width: ScreenUtil().setWidth(220),
                  height: ScreenUtil().setHeight(340.8),
                ),
              ),
              alignment: Alignment(0.25, -1),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Color(0xFF383838),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(1),
              child: Text(
                ' 注意：本资源只作为学习和参考，如果遇到不能正常播放的情况，说明这首歌属于歌手个人收费歌曲，请选择别的歌曲试听。',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.redAccent),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    _position != null
                        ? '${_positionText ?? ''}'
                        : _duration != null ? _durationText : '',
                    style: TextStyle(fontSize: 14.0,color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Slider(
                    inactiveColor: Colors.white70,
                    activeColor: Colors.white,
                    onChanged: (v) {
                      final position = v * (_duration == null ? 0 : _duration.inMilliseconds??0.0);
                      _audioPlayer
                          .seek(Duration(milliseconds: position.round()));
                    },
                    value: (_position != null &&
                        _duration != null &&
                        _position.inMilliseconds > 0 &&
                        _position.inMilliseconds < _duration.inMilliseconds)
                        ? _position.inMilliseconds / _duration.inMilliseconds
                        : 0.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    _position != null
                        ? '${_durationText ?? ''}'
                        : _duration != null ? _durationText : '',
                    style: TextStyle(fontSize: 14.0,color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: _setPlayList,
                    iconSize: 50.0,
                    icon: Icon(IconData(playListState ==0? 0xe66c : playListState ==1? 0xe66d : playListState ==2 ? 0xe60d : 0xe66c, fontFamily: 'iconfont'),size: 30,),
                    color: Colors.white
                ),
                IconButton(
                    onPressed: _prePlay,
                    iconSize: 50.0,
                    icon: Icon(IconData(0xe78a, fontFamily: 'iconfont'),size: 30,),
                    color: Colors.white
                ),
                IconButton(
                    onPressed: _isPlaying ? _pause : _play,
                    iconSize: 50.0,
                    icon: _isPlaying ? Icon(IconData(0xe629, fontFamily: 'iconfont'),size: 50,) : Icon(IconData(0xe61b, fontFamily: 'iconfont'),size: 50,) ,
                    color: Colors.white
                ),
                IconButton(
                    onPressed: _nextPlay,
                    iconSize: 50.0,
                    icon: Icon(IconData(0xe7a5, fontFamily: 'iconfont'),size: 30,),
                    color: Colors.white
                ),
                IconButton(
                    onPressed: _showSongList,
                    iconSize: 50.0,
                    icon: Icon(IconData(0xe655, fontFamily: 'iconfont'),size: 30,),
                    color: Colors.white
                ),
              ],
            ),
            Container(height: 15,)
          ],
        ),
      ),
    );
  }

  void _showSongList(){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return Container(
          //color: Colors.transparent,
          //height: 220,
          margin: EdgeInsets.only(left: 10, right: 10,),
          decoration: BoxDecoration(
            color: Colors.white, // 底色
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 10.5),
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(20),
                    left: ScreenUtil().setWidth(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("当前播放   ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,decoration: TextDecoration.none)),
                    Text("(${_songs.length})     ",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.normal,decoration: TextDecoration.none)),
                    Text("${playListState==0? "循环列表": playListState==1? "单曲循环": "随机播放"}",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.normal,decoration: TextDecoration.none)),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: OverScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: _songs.asMap().keys.map((index) =>_buildSongItem(index)).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
  }


  Widget _buildSongItem(int index){
    var aa = ListTile(
      title:  Row(
        children: <Widget>[
          index == curIndex? Row(children: <Widget>[Icon(Icons.volume_up,color: Colors.red,), Text("  ")],) : Container(),
          Expanded(
            child: Text(_songs[index]?.name??"", overflow: TextOverflow.ellipsis, maxLines: 1,
                style: TextStyle(color: index==curIndex? Colors.red : Colors.black,fontSize: 18.0,decoration: TextDecoration.none)),
          ),
          Text(" - " ,style: TextStyle(color: index==curIndex? Colors.red : Colors.black ,fontSize: 18.0,decoration: TextDecoration.none)),
          Expanded(
            child: Text(_songs[index]?.artistNames??"", overflow: TextOverflow.ellipsis, maxLines: 1,
                style: TextStyle(fontSize: 16.0,color: index==curIndex? Colors.red : Colors.grey,fontStyle: FontStyle.normal,decoration: TextDecoration.none)),
          ),
        ],
      ),
      contentPadding: EdgeInsets.all(5.0),
      onTap: () {
        setState(() {
          curIndex = index;
          curSong = _songs[index];
        });
        _position = Duration();
        controller.stop();
        mp3 = MP3_URL+widget.songs[index].id+".mp3";
        _play();
      },
      selected:index == curIndex,
    );
    return aa;
  }

//  List<Song> _oldSongs;

  void _setPlayList(){
    setState(() {
      if(playListState == 0){
        showMusicPlayToast("单曲循环");
        playListState = 1;
        _audioPlayer.setReleaseMode(ReleaseMode.LOOP);
//      }else if(playListState == 1){
//        showMusicPlayToast("随机播放");
//        playListState = 2;
//        _audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
//        _oldSongs = _songs;
//        _songs.shuffle();
      }else{
        showMusicPlayToast("列表循环");
        playListState = 0;
        _audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
//        if(_oldSongs != null){
//          _songs = _oldSongs;
//        }
      }
      if(_isPlaying){
        controller.repeat();
        _stylusController.reverse();
      }
    });
  }

  Future<int> _play() async {
    final playPosition = (_position != null &&
        _duration != null &&
        _position.inMilliseconds > 0 &&
        _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;

    final result = await _audioPlayer.play(mp3, position: playPosition);

    if (result == 1) setState(() => _playerState = PlayerState.playing);

    _audioPlayer.setPlaybackRate(playbackRate: 1.0);
    controller.repeat();
    _stylusController.reverse();
    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    controller.stop();
    _stylusController.forward();
    return result;
  }

  // 下一首
  Future<int> _nextPlay(){
    setState(() {
      if(curIndex >= _songs.length - 1){
        curIndex = 0;
      }else{
        curIndex++;
      }
      curSong = _songs[curIndex];
      _position = Duration();
      controller.stop();
      mp3 = MP3_URL+widget.songs[this.curIndex].id+".mp3";
    });
    return _play();
  }

  Future<int> _prePlay(){
    setState(() {
      if(curIndex <= 0){
        curIndex = _songs.length - 1;
      }else{
        curIndex--;
      }
      curSong = _songs[curIndex];
      _position = Duration();
      controller.stop();
      mp3 = MP3_URL+widget.songs[this.curIndex].id+".mp3";
    });
    return _play();
  }

  Future<int> stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration();
        controller.stop();
        _stylusController.forward();
      });
    }
    return result;
  }

  void _onComplete() {
//    setState(() => _playerState = PlayerState.stopped);
//    controller.stop();
//    _stylusController.forward();
    _nextPlay();

  }
}