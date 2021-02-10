
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/link_response.dart';
import 'package:tis/model/newsCategory.dart';
import 'package:tis/repository/tis_repository.dart';

class GetLinkNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<LinkResponse> _subject =
      BehaviorSubject<LinkResponse>();

  getLinkedNews(String link) async {
    LinkResponse response = await _repository.getLinkedNews(link);
    _subject.sink.add(response);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<LinkResponse> get subject => _subject;
  
}
final getLinkNewsBloc = GetLinkNewsBloc();