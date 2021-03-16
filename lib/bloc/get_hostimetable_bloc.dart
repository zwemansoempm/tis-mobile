import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/hospital_timetable_responese.dart';
import 'package:tis/repository/tis_repository.dart';

class GetHosTimetableBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<HospitalTimetableResponse> _subject =
      BehaviorSubject<HospitalTimetableResponse>();

    getHosDetailTimeTable(String hospitalID) async {
    HospitalTimetableResponse response = await _repository.getHosDetailTimeTable(hospitalID);
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<HospitalTimetableResponse> get subject => _subject;
  
}
final getHospitalTimetableBloc = GetHosTimetableBloc();