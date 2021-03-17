import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/hos_comments_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetHosCommentBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<HosCommentsResponse> _subject =
      BehaviorSubject<HosCommentsResponse>();

    getHosComments(String type, String hospitalID) async {
    HosCommentsResponse response = await _repository.getHosComments(type, hospitalID);
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<HosCommentsResponse> get subject => _subject;
  
}
final gethoscommentsBloc = GetHosCommentBloc();