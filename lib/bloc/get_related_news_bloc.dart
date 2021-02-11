import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/related_news_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetRelatedNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<RelatedNewsResponse> _subject =
      BehaviorSubject<RelatedNewsResponse>();

  getRelatedNews(String sourceId) async {
    RelatedNewsResponse response = await _repository.getRelatedNews(sourceId);
    _subject.sink.add(response);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<RelatedNewsResponse> get subject => _subject;
  
}
final getRelatedNewsBloc = GetRelatedNewsBloc();