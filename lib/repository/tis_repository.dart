import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tis/model/posts_response.dart';

class NewsRepository{
   static String mainUrl="https://test.t-i-s.jp/api";

    final Dio _dio=Dio();

    var getPostsUrl="$mainUrl/posts";
    var getLatestPostAllCatUrl="$mainUrl/get_latest_post_all_cat";

    Future<PostsResponse> getPostsNews() async {
      var params = {
        "category_id": 1,    
        "search_word" : "",
      };
    
      try {
        Response response = await _dio.post(getPostsUrl,queryParameters:params); 
        return PostsResponse.fromJson(response.data);
        // List<PostsResponse> responses =json.decode(response.data).map((j) => print(j));
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return PostsResponse.withError("$error");
      }

    }

    Future<PostsResponse> getLatestPostAllCat() async {
      try {
        Response response = await _dio.get(getLatestPostAllCatUrl);
        return PostsResponse.fromJson(response.data);
        // List<PostsResponse> responses =json.decode(response.data).map((j) => print(j));
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return PostsResponse.withError("$error");
      }
    }

}