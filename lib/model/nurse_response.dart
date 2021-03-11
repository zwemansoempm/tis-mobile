import 'package:tis/model/medical.dart';

class NurseResponse{
  final List<MedicalModel> medical;
  final String error;

  const NurseResponse(this.medical,this.error);
  NurseResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["2,特養・介護,#9579ef"] as List).map((i) => new MedicalModel.fromJson(i)).toList(), 
  error="";

   NurseResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;



}