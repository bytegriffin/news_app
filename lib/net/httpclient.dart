import 'package:dio/dio.dart';
import 'http_config.dart';
import 'dart:math';

class HttpClient {

  static final Dio _dio = Dio(
    BaseOptions(
        connectTimeout: HTTP_CONNECT_TIMEOUT,
        receiveTimeout: HTTP_RECEIVE_TIMEOUT
    )
  );

  static Future request(String url, {String method="get", Map<String,dynamic> params}) async{
    try{
      final result = await _dio.request(url,queryParameters: params,options: Options(
          method: method
      ));
      return result;
    }catch(err){
      throw err;
    }
  }

  // 访问好看视频需要在httpheader中设置cookie值，当使用浏览器中访问YINGSHI_VIDEO_URL后查看Cookies值发现过期时间太短
  // 此时需要手工删除掉，重新请求YINGSHI_VIDEO_URL后得到一个期限为1年的cookie值，将其取出即可
  static void getVideoApi(String url, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    var httpHeaders={
      "Cookie":  "BAIDUID=8052A7D29423F8D41725A6033E7D08F0:FG=1"
    };
    _dio.options.headers = httpHeaders;
    _request(url, callBack,
        method: "get", params: params, errorCallBack: errorCallBack);
  }

  //异步get请求
  static void get(String url, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    _request(url, callBack,
        method: "get", params: params, errorCallBack: errorCallBack);
  }

  //异步post请求
  static void post(String url, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    _request(url, callBack,
        method: "post", params: params, errorCallBack: errorCallBack);
  }

  static void _request(String url, Function callBack,
      {String method, Map<String, String> params,
        Function errorCallBack}) async {

    if (params != null && params.isNotEmpty) {
      print("<net> params :" + params.toString());
    }

    String errorMsg = "";
    int statusCode;

    try {
      Response response;
      if(method == "get"){
        response = await _dio.get(url);
      } else if(method == "post"){
        if (params != null && params.isNotEmpty) {
          response = await _dio.post(url, data: params);
        } else {
          response = await _dio.post(url);
        }
      }

      statusCode = response.statusCode;

      //处理错误部分
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
        return;
      }

      if (callBack != null) {
        callBack(response.data);
      }
    } catch (exception) {
      _handError(errorCallBack, exception);
    }
  }

  //处理异常
  static void _handError(Function errorCallback, errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg.toString());
    }
    print("<net> errorMsg :" + errorMsg.toString());
  }
}