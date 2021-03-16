import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/hospital_detail_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetHospitalDetailBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<HospitalDetailResponse> _subject =
      BehaviorSubject<HospitalDetailResponse>();

    getHospitalDetail(String hospitalID) async {
    HospitalDetailResponse response = await _repository.getHospitalDetail(hospitalID);
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<HospitalDetailResponse> get subject => _subject;
  
}
final getHospitalDetailBloc = GetHospitalDetailBloc();