import 'package:tis/model/link.dart';
class LinkResponse{
  final List<LinkModel> link;
  final String error;

  const LinkResponse(this.link,this.error);
  LinkResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : link=(json["linkednews"]as List).map((i) => new LinkModel.fromJson(i)).toList(), //["1,病院・医療,#d1281c"]['1']
  error="";

   LinkResponse.withError(String errorValue)
      : link = List(),
        error = errorValue;
} 