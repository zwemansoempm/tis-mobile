import 'package:tis/model/specialfeatures.dart';

class SpecialFeaturesResponse {
  final List<SpecialFeaturesModel> special_feature;
  final String error;

  SpecialFeaturesResponse(this.special_feature, this.error);

  SpecialFeaturesResponse.fromJson(Map<String, dynamic> json)
      : special_feature = (json["special_features"] as List)
            .map((i) => new SpecialFeaturesModel.fromJson(i))
            .toList(),
        error = "";

  SpecialFeaturesResponse.withError(String errorValue)
      : special_feature = List(),
        error = errorValue;

}