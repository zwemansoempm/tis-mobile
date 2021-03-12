import 'package:tis/model/medical.dart';

class DayServiceResponse{
  final List<MedicalModel> medical;
  final String error;

  const DayServiceResponse(this.medical,this.error);
  DayServiceResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["5,デイサービス,#FDCE00"]as List).map((i) => new MedicalModel.fromJson(i)).toList(), 
  error="";

   DayServiceResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;
} 