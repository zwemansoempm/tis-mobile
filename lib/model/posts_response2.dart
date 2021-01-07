import 'package:tis/model/posts.dart';

class PostsResponse2{
  final List<PostsModel> posts;
  final String error;

  PostsResponse2(this.posts,this.error);
  PostsResponse2.fromJson(Map<String, dynamic> json)
  : posts=(json['related_news'] as List).map((i) => new PostsModel.fromJson(i)).toList(),
  error="";

   PostsResponse2.withError(String errorValue)
      : posts = List(),
        error = errorValue;



}