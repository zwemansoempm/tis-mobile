import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/day_service_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetDayServiceeBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<DayServiceResponse> _subject =
      BehaviorSubject<DayServiceResponse>();

  getdayServiceNews() async {
    DayServiceResponse response = await _repository.getdayServiceNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<DayServiceResponse> get subject => _subject;
  
}
final getDayServiceeBloc = GetDayServiceeBloc();