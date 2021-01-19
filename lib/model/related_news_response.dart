import 'package:tis/model/posts.dart';

class RelatedNewsResponse{
  final List<PostsModel> posts;
  final String error;

  RelatedNewsResponse(this.posts,this.error);
  RelatedNewsResponse.fromJson(Map<String, dynamic> json)
  : posts=(json['related_news'] as List).map((i) => new PostsModel.fromJson(i)).toList(),
  error="";

   RelatedNewsResponse.withError(String errorValue)
      : posts = List(),
        error = errorValue;



}