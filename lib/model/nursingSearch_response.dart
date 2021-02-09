import 'package:tis/model/facTypes.dart';
import 'package:tis/model/medicalAcceptance.dart';
import 'package:tis/model/specialFeatures.dart';

class NursingSearchDataResponse {
  List<SpecialFeaturesModel> specialFeatures;
  List<FacTypeModel> facTypes;
  List<MedicalAcceptanceModel> medicalAcceptances;
  String error;

  NursingSearchDataResponse({
    this.specialFeatures,
    this.facTypes,
    this.medicalAcceptances,
    this.error,
  });

  NursingSearchDataResponse.fromJson(Map<String, dynamic> json) :
    specialFeatures = (json['special_features'] as List).map((e) => SpecialFeaturesModel.fromJson(e)).toList(),
    facTypes = (json['fac_types'] as List).map((e) => FacTypeModel.fromJson(e)).toList(),
    medicalAcceptances = (json['medical_acceptance'] as List).map((e) => MedicalAcceptanceModel.fromJson(e)).toList(),
    error = "";

  NursingSearchDataResponse.withError(String errorValue) :
    specialFeatures = List(),
    facTypes = List(),
    medicalAcceptances = List(),
    error = errorValue;
}