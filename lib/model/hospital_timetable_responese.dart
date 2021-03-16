

import 'hospital_timetable.dart';

class HospitalTimetableResponse {
  List<HospitalTimeTableModel> am;
  List<HospitalTimeTableModel> pm;


  String error;

  HospitalTimetableResponse(this.am, this.pm, this.error);

  HospitalTimetableResponse.fromJson(Map<String, dynamic> json)
    : 
      am = (json['am'] as List).map((e) => HospitalTimeTableModel.fromJson(e)).toList(),
      pm = (json['pm'] as List).map((e) => HospitalTimeTableModel.fromJson(e)).toList(),


    error = "";

    HospitalTimetableResponse.withError(String errorValue)
      : 
        am = List(),
        pm = List(),
        error = errorValue;

  
}