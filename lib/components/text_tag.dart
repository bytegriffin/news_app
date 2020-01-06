import 'package:flutter/material.dart';
import '../util/color_util.dart';

//文本标签
class TextTags extends StatelessWidget {

  final List<String> list;
  TextTags({@required this.list});

  List<Widget> _generateList() {
    return list.map((item) => TagItem(text: item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Wrap(
        children: _generateList(),
        spacing: 10,
        runSpacing: 5,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.end,
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    );
  }
}

class TagItem extends StatelessWidget {
  final String text;
  TagItem({@required this.text});
  @override
  Widget build(BuildContext context) {
//    return RaisedButton(
//      child: Text(this.text,style: TextStyle(fontSize: 14 )),
//      color: Colors.teal,
//      onPressed: () {},
//    );
    return Card(
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(this.text,style: TextStyle(fontSize: 14 ,color: tagTextColor)),
      ),
    );
  }
}

Widget buildBorderText(String text){
  return  Container(
    //margin: EdgeInsets.only(left: 40, top: 40),
    alignment: Alignment(0, 0),//居中
    height: 20,
    decoration: new BoxDecoration( //边框设置
      color: tagTextColor,
      //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
      //设置四周边框
      border: new Border.all(width: 1, color: Colors.black12),
    ),
    child: Text(text),
  );
}