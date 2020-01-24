import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'toast_util.dart';

Future<String> loadCache() async {
  try {
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFiles(tempDir);
//    tempDir.list(followLinks: false,recursive: true).listen((file){
//        print(file.path);//每个缓存文件的路径
//    });
    var size = _renderSize(value);
    return  size == "0.00B" ? "0K" : size;
  } catch (err) {
    //print(err);
  }
  return null;
}

// 格式化文件大小
_renderSize(double value) {
  if (null == value) {
    return 0;
  }
  List<String> unitArr = List()
    ..add('B')
    ..add('K')
    ..add('M')
    ..add('G');
  int index = 0;
  while (value > 1024) {
    index++;
    value = value / 1024;
  }
  String size = value.toStringAsFixed(2);
  return size + unitArr[index];
}

// 计算总共缓存的文件大小
Future<double> _getTotalSizeOfFiles(final FileSystemEntity file) async {
  try {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFiles(child);
      return total;
    }
    return 0;
  } catch (e) {
    //print(e);
    return 0;
  }
}

//清空缓存
void clearCache() async {
  //此处展示加载loading
  try {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await delDir(tempDir);
    // await loadCache();
    showToast('清除缓存成功');
  } catch (e) {
    showToast('清除缓存失败');
  } finally {
    //此处隐藏加载loading
  }
}

// 递归方式删除目录
Future<Null> delDir(FileSystemEntity file) async {
  try {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  } catch (e) {
    //print(e);
  }
}
