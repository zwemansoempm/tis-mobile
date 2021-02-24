import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/hospital_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetHospitalBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<HospitalResponse> _subject = BehaviorSubject<HospitalResponse>();

  getHospital() async{
    HospitalResponse response = await _repository.getHospital();
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<HospitalResponse> get subject => _subject;

}

final getHospitalBloc = GetHospitalBloc();