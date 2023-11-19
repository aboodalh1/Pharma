import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://newsapi.org/',
    receiveDataWhenStatusError: true,
  )
);

void getHttp({
  required url,
  required dynamic query,
}) async {
  final response =
      await dio.get( url,queryParameters: query);
  print(response);
  print(1010101);
}

//v2/top-headlines  url
// country=us
//category=category
//apiKey=fd158bab7482450485986c0b5290d80f
