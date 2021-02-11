
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/nurse_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetNurseBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<NurseResponse> _subject =
      BehaviorSubject<NurseResponse>();

  getNurseNews() async {
    NurseResponse response = await _repository.getNurseNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<NurseResponse> get subject => _subject;
  
}
final getNurseBloc = GetNurseBloc();