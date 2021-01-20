import 'package:tis/model/medical.dart';

class CoronaResponse{
  final List<MedicalModel> medical;
  final String error;

  CoronaResponse(this.medical,this.error);
  CoronaResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["30,新型コロナ,#A01C38"]as List).map((i) => new MedicalModel.fromJson(i)).toList(), 
  error="";

   CoronaResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;
} 