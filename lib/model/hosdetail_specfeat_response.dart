import 'package:tis/model/hospital_specfeat.dart';

class HosDetailSpecFeatResponse {
  final List<HospitalSpecFeatModel> specialfeatures;
  final String error;

  HosDetailSpecFeatResponse(this.specialfeatures, this.error);

  HosDetailSpecFeatResponse.fromJson(List<dynamic> features)
      : specialfeatures = features.map((e) => HospitalSpecFeatModel.fromJson(e)).toList(),
        error = "";

  HosDetailSpecFeatResponse.withError(String errorValue)
      : specialfeatures = List(),
        error = errorValue;

}