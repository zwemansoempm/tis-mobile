import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tis/model/category.dart';
import 'package:tis/model/medical_response.dart';
import 'package:tis/model/nurse_response.dart';
import 'package:tis/model/newsCategory.dart';
import 'package:tis/model/newdetails_response.dart';
import 'package:tis/model/posts_response.dart';
import 'package:tis/model/related_news_response.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/model/occupation_response.dart';

class NewsRepository {
  static String mainUrl = "https://test.t-i-s.jp/api";

  final Dio _dio = Dio();


  var getPostsUrl = "$mainUrl/posts";
  var getLatestPostAllCatUrl = "$mainUrl/get_latest_post_all_cat";
  // var getAllNewsSearchUrl="$mainUrl/get_latest_posts_by_catId/all_news_search";
  var getRelatedNewsUrl = "$mainUrl/relatednews";
  var getNewsDetailsUrl = "$mainUrl/newdetails";
  var getHomeUrl = "$mainUrl/home";
  var getAllNewsSearchUrl =
      "$mainUrl/get_latest_posts_by_catId_mobile/all_news_search";
  var getCityUrl = "$mainUrl/auth/getCities";

  Future<Categories> getHome() async {
    try {
      Response response = await _dio.get(getHomeUrl);
      return Categories.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      //return NewsCategory.withError("$error");
    }
  }


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
      "search_word": "",
    };

    try {
      Response response = await _dio.post(getPostsUrl, queryParameters: params);
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

  Future<MedicalResponse> getMedicalNews() async {
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      return MedicalResponse.fromJson(response.data);
      // List<PostsResponse> responses =json.decode(response.data).map((j) => print(j));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MedicalResponse.withError("$error");
    }
  }

  Future<NurseResponse> getNurseNews() async {
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      return NurseResponse.fromJson(response.data);
      // List<PostsResponse> responses =json.decode(response.data).map((j) => print(j));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NurseResponse.withError("$error");
    }
  }

  Future<RelatedNewsResponse> getRelatedNews(String id) async {
    try {
      Response response = await _dio.get(getRelatedNewsUrl + "/" + id);
      return RelatedNewsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RelatedNewsResponse.withError("$error");
    }
  }

  Future<NewdetailsResponse> getNewsDetails(String id) async {
    try {
      Response response = await _dio.get(getNewsDetailsUrl + "/" + id);
      return NewdetailsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewdetailsResponse.withError("$error");
    }
  }

  Future<CityResponse> getCity() async {
    try {
      Response response = await _dio.get(getCityUrl);
      //print(response);
      return CityResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CityResponse.withError("$error");
    }
  }

  Future<TownshipResponse> getTsp(String test) async {
    try {
      var getTspUrl = "$mainUrl/getmap?id=" +
          test +
          '&township_id=-1&moving_in=-1&per_month=-1&local=0&feature=job&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0';
      Response response = await _dio.get(getTspUrl);
      return TownshipResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TownshipResponse.withError("$error");
    }
  }

  Future<OccupationResponse> getOccupation(String test) async {
    try {
      var getOccupationUrl = "$mainUrl/getmap?id=" +
          test +
          '&township_id=-1&moving_in=-1&per_month=-1&local=0&feature=job&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0';
      Response response = await _dio.get(getOccupationUrl);
      return OccupationResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OccupationResponse.withError("$error");
    }
  }
}