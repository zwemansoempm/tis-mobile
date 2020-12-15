import 'package:tis/model/medical.dart';

class MedicalResponse{
  final List<MedicalModel> medical;
  final String error;

  MedicalResponse(this.medical,this.error);
  MedicalResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["1,病院・医療,#d1281c"]['1'] as List).map((i) => new MedicalModel.fromJson(i)).toList(), //["1,病院・医療,#d1281c"]
  error="";

   MedicalResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;



}