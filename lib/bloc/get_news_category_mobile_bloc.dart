
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/newsCategory.dart';
import 'package:tis/repository/tis_repository.dart';

class GetNewsCategoryMobileBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<NewsCategory> _subject =
      BehaviorSubject<NewsCategory>();

  getNewsCategoryMobile() async {
    NewsCategory response = await _repository.getNewscategorymobile();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<NewsCategory> get subject => _subject;
  
}
final getNewsCategoryMobileBloc = GetNewsCategoryMobileBloc();