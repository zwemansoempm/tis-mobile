import 'package:tis/model/nursing.dart';

class NursingDetailResponse {
  List<NursingModel> nursingList;
  List<ProfileNumber> profilenumbers;
  String error;

  NursingDetailResponse(this.nursingList, this.error);
  NursingDetailResponse.fromJson(Map<String, dynamic> json) : 
    nursingList = (json["nurselatlong"] as List).map((i) => new NursingModel.fromJson(i)).toList(),
    profilenumbers = (json["profilenumber"] as List).map((p) => new ProfileNumber.fromJson(p)).toList(),
    error = "";

  NursingDetailResponse.withError(String errorValue) : 
    nursingList = List(),
    error = errorValue;
}

class ProfileNumber{
  String profilenumber;
  ProfileNumber(this.profilenumber);

  ProfileNumber.fromJson(Map<String, dynamic> json) :
    profilenumber = json['profilenumber'];

}