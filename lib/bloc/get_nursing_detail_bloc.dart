import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/nursing_detail_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetNursingDetailBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<NursingDetailResponse> _subject =
      BehaviorSubject<NursingDetailResponse>();

  getNursingDetailData(String nursingId) async {
    NursingDetailResponse response = await _repository.getNursingDetailData(nursingId);
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<NursingDetailResponse> get subject => _subject;
  
}
final getNursingDetailBloc = GetNursingDetailBloc();