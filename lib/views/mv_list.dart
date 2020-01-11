import 'package:flutter/material.dart';
import '../util/image_util.dart';
import '../net/http_config.dart';
import '../net/httpclient.dart';
import 'mV_detail.dart';
import '../models/mv.dart';

class MVListPage extends StatefulWidget {
  final String title;
  final String backgroundImage;
  MVListPage(this.title, this.backgroundImage);
  @override
  _MVListPageState createState() => _MVListPageState();
}

class _MVListPageState extends State<MVListPage>{
  int count = 0;

  List<MV> newMVList= List.generate(4, (index) {
    return MV("$index","测试",defaultMusicImage,"");
  });

  @override
  void initState(){
    super.initState();
    _getMusics();
  }

  _getMusics(){
    //推荐新音乐
    HttpClient.get(NEW_MV_URL, (result){
      if(mounted){
        setState(() {
          this.newMVList = NewMV.fromJson(result).data;
          count = this.newMVList.length;
        });
      }
    },errorCallBack: (error){
      print(error);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: count,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return ListTile(
            leading:Stack(
              alignment:Alignment.center ,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: getCachedImage(newMVList[index]?.cover??defaultMusicImage,width: 140,height: 80),
                ),
                Icon(Icons.play_circle_outline,color: Colors.white,),
              ],
            ),
            title: Container(child: Text(newMVList[index].name)),
            subtitle: Row(
              children: <Widget>[
                Text(newMVList[index].artistName,maxLines: 1,overflow: TextOverflow.fade,),
                Expanded(
                  child: Text(" - ${newMVList[index].playCount}次播放",maxLines: 1,overflow: TextOverflow.fade),
                ),
              ],
            ),
            //trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => new MVDetailPage(newMVList[index].id)
              ));
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

}


