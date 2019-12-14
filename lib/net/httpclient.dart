import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpClient {

  static final Dio _dio = Dio(
    BaseOptions(
        baseUrl: NEWS_API,
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


}