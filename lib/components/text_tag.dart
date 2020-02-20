import 'package:flutter/material.dart';
import '../util/color_util.dart';
import '../views/tag_book_list.dart';

enum PageType {
  Book,
  Movie,
}

//文本标签
class TextTags extends StatelessWidget {

  final List<String> list;
  final PageType type;
  TextTags({@required this.list,this.type});

  List<Widget> _generateList() {
    return list.map((item) => TagItem(text: item,type: this.type)).toList();
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
  final PageType type;
  TagItem({@required this.text,this.type});

  Widget _visit(PageType type, String tag){
    if(type == PageType.Book){
      return TagBookListPage(tag);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if(type == null){
      return Chip(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        labelPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
        label: Text(this.text,style: TextStyle(fontSize: 14 ,color: tagTextColor)),
      );
    }
    return GestureDetector(
      child: Chip(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        labelPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
        label: Text(this.text,style: TextStyle(fontSize: 14 ,color: tagTextColor)),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => _visit(type, text)
        ));
      },
    );

//    return Card(
//      color: Colors.white70,
//      child: Padding(
//        padding: const EdgeInsets.all(2.0),
//        child: Text(this.text,style: TextStyle(fontSize: 14 ,color: tagTextColor)),
//      ),
//    );

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