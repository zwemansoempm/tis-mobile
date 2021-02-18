import 'package:tis/model/specialfeature.dart';

class NursingResponse {
  final List<NursingModel> nursingList;
  List<SpecialFeature> specialFeatureList;
  final String error;

  NursingResponse(this.nursingList, this.specialFeatureList, this.error);
  NursingResponse.fromJson(Map<String, dynamic> json) : 
    nursingList = (json["nursing"] as List).map((i) => new NursingModel.fromJson(i)).toList(),
    specialFeatureList = (json["specialfeature"] as List).map((i) => new SpecialFeature.fromJson(i)).toList(),
    error = "";

  NursingResponse.withError(String errorValue) : 
    nursingList = List(),
    specialFeatureList = List(),
    error = errorValue;
}

class NursingModel {
  int id;
  String access;
  String cus_name;
  int customer_id;
  String name;
  String profilenumber;
  String email;
  String phone;
  String address;
  String logo;
  int township_id;
  String township_name;
  int city_id;
  String city_name;
  int moving_in_from;
  int moving_in_to;
  int per_month_from;
  int per_month_to;

  NursingModel(
    this.id,
    this.access,
    this.cus_name,
    this.customer_id,
    this.name,
    this.profilenumber,
    this.email,
    this.phone,
    this.address,
    this.logo,
    this.township_id,
    this.township_name,
    this.city_id,
    this.city_name,
    this.moving_in_from,
    this.moving_in_to,
    this.per_month_from,
    this.per_month_to,
  );

  NursingModel.fromJson(Map<String , dynamic> json) :
    id = json['id'],
    access = json['access'],
    cus_name = json['cus_name'],
    customer_id = json['customer_id'],
    name = json['name'],
    profilenumber = json['profilenumber'],
    email = json['email'],
    phone = json['phone'],
    address = json['address'],
    logo = json['logo'],
    township_id = json['township_id'],
    township_name = json['township_name'],
    city_id = json['city_id'],
    city_name = json['city_name'],
    moving_in_from = json['moving_in_from'],
    moving_in_to = json['moving_in_to'],
    per_month_from = json['per_month_from'],
    per_month_to = json['per_month_to'];
      
}