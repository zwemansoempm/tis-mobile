import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tis/model/posts_response.dart';

class NewsRepository{
   static String mainUrl="https://test.t-i-s.jp/api/";

    final Dio _dio=Dio();

    var getPostsUrl="https://test.t-i-s.jp/api/posts";

    Future<PostsResponse> getPostsNews() async {
    var params = {
      "category_id": 1,    
      "search_word" : "",
    };
      print('testing111');
    try {
      Response response = await _dio.post(getPostsUrl,queryParameters:params);//post(getPostsUrl, queryParameters: params);
       print('testing');
      print(response.data);
      return PostsResponse.fromJson(response.data);

      // List<PostsResponse> responses =json.decode(response.data).map((j) => print(j));
    
      // 
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PostsResponse.withError("$error");
    }
  }
}