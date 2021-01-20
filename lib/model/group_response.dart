import 'package:tis/model/medical.dart';

class GroupResponse{
  final List<MedicalModel> medical;
  final String error;

  GroupResponse(this.medical,this.error);
  GroupResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["22,グループホーム,#211E55"]as List).map((i) => new MedicalModel.fromJson(i)).toList(), 
  error="";

   GroupResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;
} 