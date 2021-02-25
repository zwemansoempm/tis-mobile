import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tis/model/category.dart';
import 'package:tis/model/column_respons.dart';
import 'package:tis/model/corona_response.dart';
import 'package:tis/model/day_service_response.dart';
import 'package:tis/model/department_response.dart';
import 'package:tis/model/group_response.dart';
import 'package:tis/model/link_response.dart';
import 'package:tis/model/medical_response.dart';
import 'package:tis/model/nurse_response.dart';
import 'package:tis/model/newsCategory.dart';
import 'package:tis/model/newdetails_response.dart';
import 'package:tis/model/nursing.dart';
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
import 'package:tis/model/postal_list_response.dart';
import 'package:tis/model/city_occ_response.dart';

class NewsRepository {
  static String url = "test.t-i-s.jp";
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
  var getFeatureUrl =
      "$mainUrl/getmap?id=-1&township_id=-1&moving_in=-1&per_month=-1&local=0&feature=hospital&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0";
  var getLinkedNewsUrl = "$mainUrl/getLinkedNews/";
  var getHostListUrl = "$mainUrl/hospital/postList/";

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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return Categories.withError("$error");
      // throw HttpException('404');
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewsCategory.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return PostsResponse.withError("$error");
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
      // print("Exception occured: $error stackTrace: $stacktrace");
      // return PostsResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return MedicalResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return NurseResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return OldPeopleResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return VisitNurseResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return DayServiceResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return GroupResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return CoronaResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return OtherResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return ColumnResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return RelatedNewsResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewdetailsResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return CityResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return TownshipResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return OccupationResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return NursingSearchDataResponse.withError("$error");
    }
  }

  Future<NursingResponse> getNursingResult(
      String city,
      String township,
      String movingIn,
      String perMonth,
      var moveID,
      var specialFeatureID,
      var medicalAcceptanceID,
      var facTypeID) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      var uri = Uri(
        scheme: 'https',
        host: url,
        path: '/api/getnursingsearch/null',
        queryParameters: {
          'id': city,
          'townshipID': township,
          'SpecialFeatureID[]': specialFeatureID.toString(),
          'MedicalAcceptanceID[]': medicalAcceptanceID.toString(),
          'FacTypeID[]': facTypeID.toString(),
          'MoveID[]': moveID,
          'Moving_in': movingIn,
          'Per_month': perMonth,
          'local': '0',
        },
      );
      //print(uri);
      Response response = await _dio.get(uri.toString());
      if (response.statusCode == HttpStatus.ok) {
        return NursingResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      //throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return NursingResponse.withError("$error");
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
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return JobResponse.withError("$error");
    }
  }

  Future<SpecialFeaturesResponse> getFeatures() async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getFeatureUrl);
      if (response.statusCode == HttpStatus.ok) {
        return SpecialFeaturesResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return SpecialFeaturesResponse.withError("$error");
    }
  }

  Future<DepartmentResponse> getDepartment(String test) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      var getDepartmentUrl = "$mainUrl/getmap?id=" +
          test +
          '&township_id=-1&moving_in=-1&per_month=-1&local=0&feature=job&SpecialFeatureID[]=0&MedicalAcceptanceID[]=0&FacTypeID[]=0&MoveID[]=0';
      Response response = await _dio.get(getDepartmentUrl);
      if (response.statusCode == HttpStatus.ok) {
        return DepartmentResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      //  throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return DepartmentResponse.withError("$error");
    }
  }

  Future<LinkResponse> getLinkedNews(String id) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await _dio.get(getLinkedNewsUrl + id);

      if (response.statusCode == HttpStatus.ok) {
        print(response.statusCode);
        return LinkResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      // throw SocketException('No Internet');
      print("Exception occured: $error stackTrace: $stacktrace");
      return LinkResponse.withError("$error");
    }
  }

  Future<PostalListResponse> getPostalList(String id) async {
    await Future.delayed(Duration(milliseconds: 500));
    // var params = {
    //   "category_id": 1,
    //   "search_word": "",
    // };

    try {
      Response response = await _dio.post(getHostListUrl + id);

      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        return PostalListResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }

  Future<CityOccListResponse> getCityOccList() async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await _dio.get(getFeatureUrl);

      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        return CityOccListResponse.fromJson(response.data);
      } else {
        throw SocketException('No Internet');
      }
    } catch (error, stacktrace) {
      throw SocketException('No Internet');
    }
  }
}
