import 'package:tis/model/hospital.dart';

class HospitalResponse {
  final List<HospitalModel> hospital;
  final String error;

  const HospitalResponse(this.hospital, this.error);

  HospitalResponse.fromJson(Map<String, dynamic> json)
    : hospital =
          (json["hospital"] as List).map((i) => new HospitalModel.fromJson(i)).toList(),
          error = "";

    HospitalResponse.withError(String errorValue)
      : hospital = List(),
        error = errorValue;

  
}