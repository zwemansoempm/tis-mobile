import 'package:tis/model/medical.dart';

class VisitNurseResponse{
  final List<MedicalModel> medical;
  final String error;

  VisitNurseResponse(this.medical,this.error);
  VisitNurseResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["4,訪問介護・看護,#a3774a"]as List).map((i) => new MedicalModel.fromJson(i)).toList(), 
  error="";

   VisitNurseResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;
} 