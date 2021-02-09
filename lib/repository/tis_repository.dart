import 'dart:convert';
import 'dart:io';
// import 'dart:html';
import 'package:dio/dio.dart';
import 'package:tis/model/category.dart';
import 'package:tis/model/column_respons.dart';
import 'package:tis/model/corona_response.dart';
import 'package:tis/model/day_service_response.dart';
import 'package:tis/model/department_response.dart';
import 'package:tis/model/group_response.dart';
// import 'package:tis/model/category.dart';
import 'package:tis/model/medical_response.dart';
import 'package:tis/model/nurse_response.dart';
import 'package:tis/model/newsCategory.dart';
import 'package:tis/model/newdetails_response.dart';
import 'package:tis/model/nursingSearch_response.dart';
import 'package:tis/model/old_people_response.dart';
import 'package:tis/model/other_response.dart';
import 'package:tis/model/posts_response.dart';
import 'package:tis/model/related_news_response.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/model/speialfeatures_response.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/model/occupation_response.dart';
import 'package:tis/model/visit_nurse_response.dart';
import 'package:tis/model/job_response.dart';

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
   var getFeatureUrl = "$mainUrl/getmap?id=-1&township_id=-1&moving_in=-1&per_month=-1&local=0&feature=hospital&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0";

  Future<Categories> getHome() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getHomeUrl);
      if (response.statusCode == HttpStatus.ok) {
        return Categories.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
      // throw HttpException('404');
      // print("Exception occured: $error stackTrace: $stacktrace");
      //return NewsCategory.withError("$error");
    }
  }

  Future<NewsCategory> getNewscategorymobile(String id) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get("$mainUrl/newscategorymobile/" + id);
      if (response.statusCode == HttpStatus.ok) {
        return NewsCategory.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
      // print("Exception occured: $error stackTrace: $stacktrace");
      // return NewsCategory.withError("$error");
    }
  }

  Future<PostsResponse> getPostsNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    var params = {
      "category_id": 1,
      "search_word": "",
    };

    try {
      Response response = await _dio.post(getPostsUrl, queryParameters: params);

      if (response.statusCode == HttpStatus.ok) {
        return PostsResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
      // print("Exception occured: $error stackTrace: $stacktrace");
      // return PostsResponse.withError("$error");
    }
  }

  Future<PostsResponse> getLatestPostAllCat() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getLatestPostAllCatUrl);
      if (response.statusCode == HttpStatus.ok) {
        return PostsResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<MedicalResponse> getMedicalNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return MedicalResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<NurseResponse> getNurseNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return NurseResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<OldPeopleResponse> getPaidOldPeopleNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return OldPeopleResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<VisitNurseResponse> getVisitNurseNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return VisitNurseResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<DayServiceResponse> getdayServiceNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return DayServiceResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<GroupResponse> getGroupNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return GroupResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<CoronaResponse> getCoronaNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return CoronaResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<OtherResponse> getOtherNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return OtherResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<ColumnResponse> getColumnNews() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getAllNewsSearchUrl);
      if (response.statusCode == HttpStatus.ok) {
        return ColumnResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<RelatedNewsResponse> getRelatedNews(String id) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getRelatedNewsUrl + "/" + id);
      if (response.statusCode == HttpStatus.ok) {
        return RelatedNewsResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<NewdetailsResponse> getNewsDetails(String id) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getNewsDetailsUrl + "/" + id);
      if (response.statusCode == HttpStatus.ok) {
        return NewdetailsResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<CityResponse> getCity() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getCityUrl);
      if (response.statusCode == HttpStatus.ok) {
        return CityResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<TownshipResponse> getTsp(String test) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      var getTspUrl = "$mainUrl/getmap?id=" +
          test +
          '&township_id=-1&moving_in=-1&per_month=-1&local=0&feature=job&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0';
      Response response = await _dio.get(getTspUrl);
      if (response.statusCode == HttpStatus.ok) {
        return TownshipResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<OccupationResponse> getOccupation(String test) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      var getOccupationUrl = "$mainUrl/getmap?id=" +
          test +
          '&township_id=-1&moving_in=-1&per_month=-1&local=0&feature=job&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0';
      Response response = await _dio.get(getOccupationUrl);
      if (response.statusCode == HttpStatus.ok) {
        return OccupationResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<NursingSearchDataResponse> getNursingSearchData(String data) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      var getUrl = "$mainUrl/getmap?id=" +
          data +
          "&township_id=-1&moving_in=-1&per_month=-1&local=&feature=nursing&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0";
      Response response = await _dio.get(getUrl);
      if (response.statusCode == HttpStatus.ok) {
        return NursingSearchDataResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<JobResponse> getJob() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      var getJobUrl =
          "$mainUrl/getjobsearch/null?id=-1&townshipID[]=0&occupationID[]=0&empstatus[]=0";

      Response response = await _dio.get(getJobUrl);

      if (response.statusCode == HttpStatus.ok) {
        print(response.statusCode);
        return JobResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

   Future<SpecialFeaturesResponse> getFeatures() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getFeatureUrl);    
      if(response.statusCode==HttpStatus.ok){
          return SpecialFeaturesResponse.fromJson(response.data);
      } else{
          throw SocketException('No Internet');       
      }    
    } catch (error, stacktrace) {
          throw SocketException('No Internet');
    }
  }

  Future<DepartmentResponse> getDepartment(String test) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      var getDepartmentUrl = "$mainUrl/getmap?id=" +
          test +
          '&township_id=-1&moving_in=-1&per_month=-1&local=0&feature=job&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0';
      Response response = await _dio.get(getDepartmentUrl);
      if(response.statusCode==HttpStatus.ok){
          return DepartmentResponse.fromJson(response.data);
      } else{
          throw SocketException('No Internet');      
      }    
    } catch (error, stacktrace) {
     throw SocketException('No Internet');
    }
  }
}
