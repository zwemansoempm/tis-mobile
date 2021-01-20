
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/old_people_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetOldPeopleBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<OldPeopleResponse> _subject =
      BehaviorSubject<OldPeopleResponse>();

  getPaidOldPeopleNews() async {
    OldPeopleResponse response = await _repository.getPaidOldPeopleNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<OldPeopleResponse> get subject => _subject;
  
}
final getOldPeopleBloc = GetOldPeopleBloc();