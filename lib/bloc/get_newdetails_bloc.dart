import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/newdetails_response.dart';
import 'package:tis/model/posts_response.dart';
import 'package:tis/model/posts_response2.dart';
import 'package:tis/repository/tis_repository.dart';

class GetNewdetailsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<NewdetailsResponse> _subject =
      BehaviorSubject<NewdetailsResponse>();

  getNewsDetails(String sourceId) async {
    NewdetailsResponse response = await _repository.getNewsDetails(sourceId);
    _subject.sink.add(response);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<NewdetailsResponse> get subject => _subject;
  
}
final getNewdetailsBloc = GetNewdetailsBloc();