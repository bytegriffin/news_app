import 'package:fluttertoast/fluttertoast.dart';

showToast(String content){
  Fluttertoast.showToast(
    msg: content,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 1,
//    backgroundColor: Colors.red,
//    textColor: Colors.white,
  );
}

showMusicPlayToast(String content){
  Fluttertoast.showToast(
    msg: content,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 1,
//    backgroundColor: Colors.red,
//    textColor: Colors.white,
  );
}