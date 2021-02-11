
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/corona_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetCoronaBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<CoronaResponse> _subject =
      BehaviorSubject<CoronaResponse>();

  getCoronaNews() async {
    CoronaResponse response = await _repository.getCoronaNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<CoronaResponse> get subject => _subject;
  
}
final getCoronaBloc = GetCoronaBloc();