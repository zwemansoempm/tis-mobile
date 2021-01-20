import 'package:tis/model/occupation.dart';
import 'dart:convert';

class OccupationResponse {
  final List<OccupationModel> occupation;

  final String error;

  OccupationResponse(this.occupation, this.error);
  OccupationResponse.fromJson(Map json)
      : occupation = (json["occupations"] as List)
            .map((i) => new OccupationModel.fromJson(i))
            .toList(),
        error = "";

  OccupationResponse.withError(String errorValue)
      : occupation = List(),
        error = errorValue;
}

//var user = User.fromJson(value).toList();
