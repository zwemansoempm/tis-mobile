import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/nursingSearch_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetNursingSearchDataBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<NursingSearchDataResponse> _subject =
      BehaviorSubject<NursingSearchDataResponse>();

  getNursingSearchData(String test) async {
    NursingSearchDataResponse response = await _repository.getNursingSearchData(test);
    _subject.sink.add(response);
  }

  void drainStream(){ 
    _subject.value = null; 
  }
  
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<NursingSearchDataResponse> get subject => _subject;
  
}
final getNursingSearchDataBloc = GetNursingSearchDataBloc();