
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/group_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetGroupBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<GroupResponse> _subject =
      BehaviorSubject<GroupResponse>();

  getGroupNews() async {
    GroupResponse response = await _repository.getGroupNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<GroupResponse> get subject => _subject;
  
}
final getGroupBloc = GetGroupBloc();