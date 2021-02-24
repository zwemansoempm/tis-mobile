import 'package:tis/model/specialfeatures.dart';

class ProfileFeaturesResponse {
  final List<SpecialFeaturesModel> specialfeatures;
  final String error;

  ProfileFeaturesResponse(this.specialfeatures, this.error);

  ProfileFeaturesResponse.fromJson(List<dynamic> features)
      : specialfeatures = features.map((e) => SpecialFeaturesModel.fromJson(e)).toList(),
        error = "";

  ProfileFeaturesResponse.withError(String errorValue)
      : specialfeatures = List(),
        error = errorValue;

}