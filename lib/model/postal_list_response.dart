import 'package:tis/model/postal_list.dart';
import 'package:tis/model/township.dart';

class PostalListResponse {
  final List<PostalList> postalList;
  final List<TownshipModel> tspList;
  final String error;

  PostalListResponse(this.postalList, this.tspList, this.error);
  PostalListResponse.fromJson(Map<String, dynamic> json)
      : postalList = (json["postal_list"] as List)
            .map((i) => new PostalList.fromJson(i))
            .toList(),
        tspList = (json["township_id"] as List)
            .map((i) => new TownshipModel.fromJson(i))
            .toList(),
        error = "";

  PostalListResponse.withError(String errorValue)
      : postalList = List(),
        tspList = List(),
        error = errorValue;
}
