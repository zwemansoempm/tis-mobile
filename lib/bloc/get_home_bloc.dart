import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/category.dart';
import 'package:tis/repository/tis_repository.dart';

class GetHomeBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<Categories> _subject =
      BehaviorSubject<Categories>();

  getHomeData() async {
    Categories response = await _repository.getHome();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<Categories> get subject => _subject;
  
}
final getHomeBloc = GetHomeBloc();