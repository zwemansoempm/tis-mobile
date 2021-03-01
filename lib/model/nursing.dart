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
  String operatorName;
  String feature;

  String businessEntity;
  String dateOfEstablishment;
  String landRightForm;
  String buildingRightForm;
  String siteArea;
  String floorArea;
  String construction;
  String capacity;
  String numRooms;
  String residenceForm;
  int facType;
  String occupancyCondition;
  String roomFloor;
  String livingRoomFacilities;
  String equipment;
  String website;

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
    this.operatorName,
    this.feature,
    this.businessEntity,
    this.dateOfEstablishment,
    this.landRightForm,
    this.buildingRightForm,
    this.siteArea,
    this.floorArea,
    this.construction,
    this.capacity,
    this.numRooms,
    this.residenceForm,
    this.facType,
    this.occupancyCondition,
    this.roomFloor,
    this.livingRoomFacilities,
    this.equipment,
    this.website,
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
    per_month_to = json['per_month_to'],
    operatorName = json['operator'],
    feature = json['feature'],

    businessEntity = json['business_entity'],
    dateOfEstablishment = json['date_of_establishment'],
    landRightForm = json['land_right_form'],
    buildingRightForm = json['building_right_form'],
    siteArea = json['site_area'],
    floorArea = json['floor_area'],
    construction = json['construction'],
    capacity = json['capacity'],
    numRooms = json['num_rooms'],
    residenceForm = json['residence_form'],
    facType = json['fac_type'],
    occupancyCondition = json['occupancy_condition'],
    roomFloor = json['room_floor'],
    livingRoomFacilities = json['living_room_facilities'],
    equipment = json['equipment'],
    website = json['website'];
      
}