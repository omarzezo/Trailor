import 'package:dio/dio.dart';
import 'package:omar/Controller/End%20Point.dart';

class DioHelper {
  static Dio ? dio ;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response <dynamic> ?> getData({required String url , required Map<String , dynamic> query}) async {
    print(BASEURL + url);
    return await dio?.get(  url  , queryParameters: query );
  }

}