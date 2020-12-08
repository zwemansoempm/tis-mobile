// import 'package:tis/model/article_response.dart';
// import 'package:tis/model/source_response.dart';
// import 'package:dio/dio.dart';
// import 'dart:developer' as developer;

// class NewsRepository{
//   static String mainUrl="http://newsapi.org/v2/";
//   final  String apiKey= "0605bb0def88461399c6a91185d026e9";//Here is your api   f5ea9c4dc0404d24b06e7f5153827ebb  3660ee7863554af4ac3a8ec42014cb6a  0605bb0def88461399c6a91185d026e9

//   final Dio _dio=Dio();
  
//   var getSourcesUrl="$mainUrl/sources";
//   var getTopHeadlinesUrl ="$mainUrl/top-headlines";
//   var everythingUrl="$mainUrl/everything";

  
//   Future<SourceResponse> getSources() async {
//     var params = {
//       "apiKey": apiKey,
//       // "id": "abc-news",
//       "language" : "en",
//       "country" : "us"};
//     try {
//       Response response = await _dio.get(getSourcesUrl, queryParameters: params);
//       return SourceResponse.fromJson(response.data);
//     } catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       return SourceResponse.withError("$error");
//     }
//   }

//   Future<ArticleResponse> getTopHeadlines() async {
//     var params = {
//       "apiKey": apiKey,
//       "country" : "jp"};
//     try {
//       Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
//       return ArticleResponse.fromJson(response.data);
//     } catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       return ArticleResponse.withError("$error");
//     }
//   }

//   Future<ArticleResponse> search(String value) async {
//     developer.log('valueq', name: value);
//     var params = {
//       "apiKey": apiKey,
//       "q" : value=='log'?'':value,
//       "sortBy": "popularity"};
//     try {
//       Response response = await _dio.get(everythingUrl, queryParameters: params);
//       return ArticleResponse.fromJson(response.data);
//     } catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       return ArticleResponse.withError("$error");
//     }
//   }

//   Future<ArticleResponse> getHotNews() async {
//     var params = {
//       "apiKey": apiKey,
//       "q" : "apple",
//       "sortBy": "popularity"};
      
//     try {
//       Response response = await _dio.get(everythingUrl, queryParameters: params);
   
//       return ArticleResponse.fromJson(response.data);
//     } catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       return ArticleResponse.withError("$error");
//     }
//   }

//   Future<ArticleResponse> getSourceNews(String sourceId) async {
//     var params = {
//       "apiKey": apiKey,
//       "sources" : sourceId};
//         print('testing444');
//     try {
//       Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
//           print('testin33355');
//          print(response.data);
//       return ArticleResponse.fromJson(response.data);
//     } catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       return ArticleResponse.withError("$error");
//     }
//   }  

// }