import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
class DioHelper {
  static late Dio dio;
  Map <String ,dynamic> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer 13|kTnS84CqSfmN51ZVUczOIn7sElPVzUXm9xjevXc290b5b506'
  };
  static init()
  {
    dio = Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api/',
      receiveDataWhenStatusError: true,
      // connectTimeout: Duration(seconds: 5 ),
      //   receiveTimeout : Duration(seconds: 3)
    ));
  }
  static Future<Response> getData(
      {required String path,
        Map<String, dynamic> ?query,
        String lang='en',
        String? token}) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token??''
    };
    return await dio.get(
      path,
      queryParameters: query??null,
    );
  }

  static Future<Response> postData(
      {
        required String url,
        required Map<String, dynamic> data,
        String? token}) async
  {
      dio.options.headers = {
      'Accept': 'application/json',
      'Authorization':'Bearer ${token}'
    };

    return dio.post(
        url,
        data: data,).catchError((error){print(error.toString());});


  }

  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String lang="en",
        String? token}) async
  {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ??''
    };
    return dio.put(
        url,
        queryParameters: query,
        data: data);
  }
  static Future<http.Response> login({
    required String email,
    required String password
  })async{
    Uri url = Uri.parse('http://10.0.2.2:8000/api/login');
    return http.post(url,body: {
      'phone':'$email',
      'password': '$password',
    },
);

  }
  static Future logout({required String token})async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var dio = Dio();
    var response = await dio.request(
      'http://10.0.2.2:8000/api/logout',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      return response.data ;
    }
    else {
      return response.statusMessage;
    }
  }
}