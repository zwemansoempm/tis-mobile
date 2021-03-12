import 'package:tis/model/medical.dart';

class OldPeopleResponse{
  final List<MedicalModel> medical;
  final String error;

  const OldPeopleResponse(this.medical,this.error);
  OldPeopleResponse.fromJson(Map<String, dynamic> json)// Map<String, dynamic>  List<dynamic> 
  : medical=(json["3,有料老人ホーム,#20d1de"]as List).map((i) => new MedicalModel.fromJson(i)).toList(), 
  error="";

   OldPeopleResponse.withError(String errorValue)
      : medical = List(),
        error = errorValue;
} 