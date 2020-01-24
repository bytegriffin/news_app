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

enum PlayerState { stopped, playing, paused }

class MusicPlayer extends StatefulWidget {
  final Song song;
  final PlayerMode mode;

  MusicPlayer(this.song,{this.mode = PlayerMode.MEDIA_PLAYER});

  @override
  State<StatefulWidget> createState() {
    return _MusicPlayerState(song, mode);
  }
}

class _MusicPlayerState extends State<MusicPlayer> with SingleTickerProviderStateMixin{
  Song song;
  PlayerMode mode;

  AudioPlayer _audioPlayer;
  AudioPlayerState _audioPlayerState = AudioPlayerState.STOPPED;
  Duration _duration;
  Duration _position;

  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;
  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  AnimationController controller;
  Animation<double> animation;

  _MusicPlayerState(this.song, this.mode);
  String mp3;

  @override
  void initState() {
    super.initState();
    mp3 = MP3_URL+widget.song.id+".mp3";
    _initAudioPlayer();
    controller = AnimationController(duration: const Duration(seconds: 20), vsync: this);
    animation = new Tween(begin: 1.0, end: 2.0).animate(controller);
    _play();
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayerState = AudioPlayerState.STOPPED;
    controller.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  // 显示所有歌手列表
  Widget _displayAllArtist(){
    if(song.artists == null || song.artists.length == 0){
      return Container();
    }
    if(song.artists.length == 1){
      return GestureDetector(
        child: Text("${song?.artistName??""} > ",
          style: TextStyle(fontSize: 16,color: artistTextColor),
          overflow: TextOverflow.ellipsis,maxLines: 1,
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => new ArtistDetailPage(song?.artists[0].id)
          ));
        },
      );
    } else if(song.artists.length > 1){
      return GestureDetector(
        child: Text("${song?.artistName??""} > ",
          style: TextStyle(fontSize: 16,color: artistTextColor),
          overflow: TextOverflow.ellipsis,maxLines: 1,
        ),
        onTap: (){
          showDialog<Null>(
            context: context,
            builder: (BuildContext context) {
              return new SimpleDialog(
                title: new Text('请选择要查看的歌手'),
                children: song.artists.map((artist){
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(song.name),
            _displayAllArtist()
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return new Container(
                    height: ScreenUtil().setHeight(120),
                    margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(IconData(0xe644, fontFamily: 'iconfont'),color: Colors.green,size: 30,),
                            Text("微信朋友圈")
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(IconData(0xe601, fontFamily: 'iconfont'),color: Colors.green,size: 30,),
                            Text("微信好友")
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(IconData(0xe666, fontFamily: 'iconfont'),color: Colors.yellowAccent,size: 30,),
                            Text("QQ空间")
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(IconData(0xe60a, fontFamily: 'iconfont'),color: Colors.blue,size: 30,),
                            Text("QQ好友")
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(IconData(0xe600, fontFamily: 'iconfont'),color: Colors.red,size: 30,),
                            Text("微博")
                          ],
                        )
                      ],
                    ),
                  );
                },
              ).then((val) {
                // print(val);
              });
            },
            iconSize: 30.0,
            icon: Icon(Icons.share),
            // color: Colors.white
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        height: 400,
        child: RotationTransition(
          //设置动画的旋转中心
            alignment: Alignment.center,
            //动画控制器
            turns: animation,
            //将要执行动画的子view
            child:  Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(500.0),
                    child: Image.asset("assets/record.jpg",width: 300,height: 300,)
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(500.0),
                    child:  getCachedImage(song?.picUrl??song?.album?.picUrl??defaultCastImage, width: 200, height: 200)
                )
              ],
            )
        ),
      ),
      bottomSheet:Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  ' 注意：本资源只作为学习和参考，如果遇到不能正常播放的情况，说明这首歌属于歌手个人收费歌曲，请选择别的歌曲试听。',
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.redAccent),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      _position != null
                          ? '${_positionText ?? ''}'
                          : _duration != null ? _durationText : '',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      onChanged: (v) {
                        final position = v * _duration?.inMilliseconds??0.0;
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
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
         // Text("State: $_audioPlayerState"),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: _isPlaying ? null : () => _play(),
                  iconSize: 64.0,
                  icon: Icon(Icons.play_arrow),
                 // color: Colors.black
              ),
              IconButton(
                  onPressed: _isPlaying ? () => _pause() : null,
                  iconSize: 64.0,
                  icon: Icon(Icons.pause),
                 // color: Colors.white
              ),
              IconButton(
                  onPressed: _isPlaying || _isPaused ? () => _stop() : null,
                  iconSize: 64.0,
                  icon: Icon(Icons.stop),
                  //color: Colors.white
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: mode);

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);

      if (Theme.of(context).platform == TargetPlatform.iOS) {
        _audioPlayer.startHeadlessService();

        _audioPlayer.setNotification(
            title: song.name,
            artist: song.artistName,
            albumTitle: song.albumName,
            imageUrl: song.picUrl,
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
      //setState(() {
        _audioPlayerState = state;
      //});
    });

    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() => _audioPlayerState = state);
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
    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    controller.stop();
    return result;
  }

  Future<int> _stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration();
        controller.stop();
      });
    }
    return result;
  }

  void _onComplete() {
    setState(() => _playerState = PlayerState.stopped);
    controller.stop();
  }
}