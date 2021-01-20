import 'package:tis/model/medical.dart';

class ColumnResponse{
  final List<MedicalModel> medical;
  final String error;

  ColumnResponse(this.medical,this.error);
  ColumnResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["40,コラム,#29905e"]as List).map((i) => new MedicalModel.fromJson(i)).toList(), 
  error="";

   ColumnResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;
} 