import 'package:tis/model/posts.dart';

class NewdetailsResponse{
  final List<PostsModel> posts;
  final String error;

  const NewdetailsResponse(this.posts,this.error);
  NewdetailsResponse.fromJson(Map<String, dynamic> json)
  : posts=(json['news'] as List).map((i) => new PostsModel.fromJson(i)).toList(),
  error="";

   NewdetailsResponse.withError(String errorValue)
      : posts = List(),
        error = errorValue;



}