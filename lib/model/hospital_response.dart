import 'dart:convert';

import 'package:tis/model/hospital.dart';
import 'package:tis/model/hospital_specfeat.dart';

import 'hospital_timetable.dart';

class HospitalResponse {
  List<HospitalModel> hospital;
  List<HospitalSpecFeatModel> specialfeature;
  List<HospitalTimeTableModel> timetable;

  String error;

  HospitalResponse(this.hospital, this.specialfeature, this.timetable, this.error);

  HospitalResponse.fromJson(Map<String, dynamic> json)
    : hospital = (json["hospital"] as List).map((i) => new HospitalModel.fromJson(i)).toList(),
      specialfeature = (json['specialfeature'] as List).map((e) => HospitalSpecFeatModel.fromJson(e)).toList(),
      timetable = (json['timetable'] as List).map((e) => HospitalTimeTableModel.fromJson(e)).toList(),


    error = "";

    HospitalResponse.withError(String errorValue)
      : hospital = List(),
        specialfeature = List(),
        timetable = List(),
        error = errorValue;

  
}