import 'package:tis/model/posts.dart';

class PostsResponse{
  final List<PostsModel> posts;
  final String error;

  PostsResponse(this.posts,this.error);
  PostsResponse.fromJson(List<dynamic> json)
  : posts=(json as List).map((i) => new PostsModel.fromJson(i)).toList(),
  error="";

   PostsResponse.withError(String errorValue)
      : posts = List(),
        error = errorValue;



}