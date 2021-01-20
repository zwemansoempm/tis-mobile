
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/visit_nurse_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetVisitNurseBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<VisitNurseResponse> _subject =
      BehaviorSubject<VisitNurseResponse>();

  getVisitNurseNews() async {
    VisitNurseResponse response = await _repository.getVisitNurseNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<VisitNurseResponse> get subject => _subject;
  
}
final getVisitNurseBloc = GetVisitNurseBloc();