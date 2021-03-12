import 'package:tis/model/medical.dart';

class OtherResponse{
  final List<MedicalModel> medical;
  final String error;

  const OtherResponse(this.medical,this.error);
  OtherResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["27,その他,#AAAAAA"]as List).map((i) => new MedicalModel.fromJson(i)).toList(), 
  error="";

   OtherResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;
} 