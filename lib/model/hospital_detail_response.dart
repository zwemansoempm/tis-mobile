import 'package:tis/model/hospital.dart';

import 'hospital_specfeat.dart';

class HospitalDetailResponse {

  List<HospitalModel> hospital;
  List<ProfileNumber> profilenumbers;
  List<Address> addressList;
  List<FacilityList> facility_list;
  List<Facility> facility;
  List<Video> videos;
  List<Images> images;
  String error;

  HospitalDetailResponse(this.hospital, this.profilenumbers,this.addressList, this.facility_list, this.facility, this.videos, this.images, this.error);

  HospitalDetailResponse.fromJson(Map<String, dynamic> json) :

  hospital = (json['hospital'] as List).map((i) => new HospitalModel.fromJson(i)).toList(),
  profilenumbers = (json['profilenumber'] as List).map((p) => new ProfileNumber.fromJson(p)).toList(),
  addressList = (json['address'] as List).map((a) => new Address.fromJson(a)).toList(),
  facility_list = (json['facility_list'] as List).map((d) => new FacilityList.fromJson(d)).toList(),
  facility = (json['facility'] as List).map((h) => new Facility.fromJson(h)).toList(),
  videos = (json['videos'] as List).map((v) => new Video.fromJson(v)).toList(),
  images = (json['images'] as List).map((s) => new Images.fromJson(s)).toList(),







  error = "";

    HospitalDetailResponse.withError(String errorValue)
    : hospital = List(),
      profilenumbers = List(),
      addressList = List(),
      facility_list = List(),
      facility = List(),
      videos = List(),
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

class FacilityList{
  int id;
  String description;

  FacilityList(this.id,this.description);

  FacilityList.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    description = json['description'];
}

class Facility{
  int id;
  String description;

  Facility(this.id,this.description);

  Facility.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    description = json['description'];
}

class Video {
  int id;
  String name;

  Video(this.id, this.name);

  Video.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'];
}

class Images {
  int id;
  int profile_id;
  String photo;
  String title;
  String description;
  String type;
  String profile_type;

  Images(this.id, this.profile_id, this.photo, this.title, this.description, this.type, this.profile_type);

  Images.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    profile_id = json['profile_id'],
    photo = json['photo'],
    title = json['title'],
    description = json['description'],
    type = json['type'],
    profile_type = json['type'];
}