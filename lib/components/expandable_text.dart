import 'package:flutter/material.dart';

//收回/全文显示 文本
class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final bool expand;
  ExpandableText({@required this.text, this.maxLines, this.style, this.expand});
  _ExpandableTextState createState() {
    return _ExpandableTextState(text, maxLines, style, expand);
  }
}

class _ExpandableTextState extends State<ExpandableText> {
  final String text;
  final int maxLines;
  final TextStyle style;
  bool expand;

  _ExpandableTextState(this.text, this.maxLines, this.style, this.expand) {
    if (expand == null) {
      expand = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size){
        final span = TextSpan(text: text ?? '', style: style);
        final tp = TextPainter(text: span, maxLines: maxLines, textDirection: TextDirection.ltr);
        tp.layout(maxWidth: size.maxWidth);
        if (tp.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              expand ? Text(text ?? '', style: style) :  
                Text(text ?? '', maxLines: maxLines,overflow: TextOverflow.ellipsis, style: style),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Container(
                  padding: EdgeInsets.only(top: 2),
                  child:Text(expand ? '收起' : '全文', style: TextStyle(
                    fontSize: style != null ? style.fontSize : null,
                    color: Colors.blue)
                  ),
                ),
                onTap: (){
                  setState(() {
                    expand = !expand;
                  });  
                },
              )
            ],
          );
        } else {
          return Text(text ?? '', style: style);
        }
      },
    );
  }
}
