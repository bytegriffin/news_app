import 'package:flutter/material.dart';
import '../net/httpclient.dart';
import '../net/http_config.dart';
import '../models/sugguest.dart';
import 'dart:convert';

const searchList = [
  "zhangsan-张三",
  "lisi-李四",
  "wangwu-王五",
  "zhaoliu-赵六"
];

//const recentSuggest = [
//  "推荐-1",
//  "suggestion-2"
//];

// 搜索动作
class SearchBarDelegate extends SearchDelegate<String>{


  @override
  String get searchFieldLabel => "搜你想搜的";

  // 搜索时的x按钮
  @override
  List<Widget> buildActions(BuildContext context){
    return [IconButton(icon: Icon(Icons.clear), onPressed: ()=> query="")];
  }

  // 搜索时的返回按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon:AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation),
      onPressed: ()=>close(context, null),
    );
  }

  // 搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child:Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        )
      )
    );
  }

  List<String> _getSugguestList(){
    List<String> list;
    Future f = HttpClient.request(SUGGUEST+"$query");
    Sugguest sugguests = Sugguest.fromJson(json.decode(''));
    list = sugguests.g.sublist(0,2);
    return list;

  }

  // 搜索推荐
  @override
  Widget buildSuggestions(BuildContext context) {
    List ss = _getSugguestList();
    print(ss);
    final suggestionList = query.isEmpty ? [] :
        searchList.where((input)=>input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index)=>ListTile(
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text:suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )
            ]
          ),
        ),
      ),
    );
  }
}

