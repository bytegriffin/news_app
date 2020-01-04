import 'package:dio/dio.dart';
import 'http_config.dart';

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


  static Future<Response> getUrl(String url) async{
    Response response = await _dio.get(url);
    return response.data;
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
      _handError(errorCallBack, exception.toString());
    }
  }

  //处理异常
  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }
}