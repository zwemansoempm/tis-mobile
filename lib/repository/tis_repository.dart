import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tis/model/category.dart';
import 'package:tis/model/medical_response.dart';
import 'package:tis/model/medical_response2.dart';
import 'package:tis/model/newsCategory.dart';
import 'package:tis/model/newdetails_response.dart';
import 'package:tis/model/posts_response.dart';
import 'package:tis/model/posts_response2.dart';

class NewsRepository{
   static String mainUrl="https://test.t-i-s.jp/api";

    final Dio _dio=Dio();
   
    var getPostsUrl="$mainUrl/posts";
    var getLatestPostAllCatUrl="$mainUrl/get_latest_post_all_cat";
    // var getAllNewsSearchUrl="$mainUrl/get_latest_posts_by_catId/all_news_search";
    var getRelatedNewsUrl="$mainUrl/relatednews";
    var getNewsDetailsUrl="$mainUrl/newdetails";
    var getHomeUrl = "$mainUrl/home";
    var getAllNewsSearchUrl="$mainUrl/get_latest_posts_by_catId_mobile/all_news_search";


    Future<NewsCategory> getNewscategorymobile(String id) async {
      try {
        Response response = await _dio.get("$mainUrl/newscategorymobile/"+ id);
        return NewsCategory.fromJson(response.data);
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return NewsCategory.withError("$error");
      }
    }

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

    Future<MedicalResponse> getAllNewsSearch() async {
      try {
        Response response = await _dio.get(getAllNewsSearchUrl);
        return MedicalResponse.fromJson(response.data);
        // List<PostsResponse> responses =json.decode(response.data).map((j) => print(j));
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return MedicalResponse.withError("$error");
      }
    }

    
    // Future<MedicalResponse2> getMedical2() async {
    //   try {
    //     Response response = await _dio.get(getAllNewsSearchUrl);
    //     return MedicalResponse2.fromJson(response.data);
    //     // List<PostsResponse> responses =json.decode(response.data).map((j) => print(j));
    //   } catch (error, stacktrace) {
    //     print("Exception occured: $error stackTrace: $stacktrace");
    //     return MedicalResponse2.withError("$error");
    //   }
    // } 

    Future<PostsResponse2> getRelatedNews(String id) async {         
      try {
        Response response = await _dio.get(getRelatedNewsUrl+"/"+id);         
        return PostsResponse2.fromJson(response.data);
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return PostsResponse2.withError("$error");
      }
  }
    Future<NewdetailsResponse> getNewsDetails(String id) async {         
      try {
        Response response = await _dio.get(getNewsDetailsUrl+"/"+id);         
        return NewdetailsResponse.fromJson(response.data);
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return NewdetailsResponse.withError("$error");
      }
  }  

}