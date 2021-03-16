import 'package:tis/model/cooperateMedical.dart';
import 'package:tis/model/image.dart';
import 'package:tis/model/method_payment.dart';
import 'package:tis/model/nursing.dart';
import 'package:tis/model/staff.dart';

class NursingDetailResponse {
  List<NursingModel> nursingList;
  List<ProfileNumber> profilenumbers;
  List<Address> addressList;
  List<MethodPayment> methodPayments;
  List<CooperateMedical> cooperateMedicals;
  List<MedicalAcceptance> medicalAcceptances;
  List<MedicalAcceptance> medicals;
  List<StaffModel> staffs;
  List<ImageModel> images;
  String error;

  NursingDetailResponse(this.nursingList,this.profilenumbers, this.addressList, this.error);
  NursingDetailResponse.fromJson(Map<String, dynamic> json) : 
    nursingList = (json['nurselatlong'] as List).map((i) => new NursingModel.fromJson(i)).toList(),
    profilenumbers = (json['profilenumber'] as List).map((p) => new ProfileNumber.fromJson(p)).toList(),
    addressList = (json['address'] as List).map((a) => new Address.fromJson(a)).toList(),
    methodPayments = (json['cost'] as List).map((c) => new MethodPayment.fromJson(c)).toList(),
    cooperateMedicals = (json['comedical'] as List).map((comedical) => new CooperateMedical.fromJson(comedical)).toList(),
    medicalAcceptances = (json['medicalacceptance'] as List).map((accept) => new MedicalAcceptance.fromJson(accept)).toList(),
    medicals = (json['medical'] as List).map((medical) => new MedicalAcceptance.fromJson(medical)).toList(),
    staffs = (json['staff'] as List).map((staff) => new StaffModel.fromJson(staff)).toList(),
    images = (json['images'] as List).map((image) => new ImageModel.fromJson(image)).toList(),
    error = '';

  NursingDetailResponse.withError(String errorValue) : 
    nursingList = List(),
    profilenumbers = List(),
    addressList = List(),
    methodPayments = List(),
    cooperateMedicals = List(),
    medicalAcceptances = List(),
    medicals = List(),
    staffs = List(),
    images = List(),
    error = errorValue;
}

class ProfileNumber{
  String profilenumber;
  ProfileNumber(this.profilenumber);

  ProfileNumber.fromJson(Map<String, dynamic> json) :
    profilenumber = json['profilenumber'];
}

class Address {
  String cityName;
  String townshipName;

  Address(this.cityName, this.townshipName);

  Address.fromJson(Map<String, dynamic> json) :
    cityName = json['city_name'],
    townshipName = json['township_name'];
}

class MedicalAcceptance{
  int id;
  String name;
  String acceptType;

  MedicalAcceptance(this.id,this.name,this.acceptType);

  MedicalAcceptance.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    acceptType = json['accept_type'];
}