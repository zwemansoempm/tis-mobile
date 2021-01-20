
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/corona_response.dart';
import 'package:tis/model/day_service_response.dart';
import 'package:tis/model/group_response.dart';
import 'package:tis/model/other_response.dart';
import 'package:tis/model/visit_nurse_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetOtherBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<OtherResponse> _subject =
      BehaviorSubject<OtherResponse>();

  getOtherNews() async {
    OtherResponse response = await _repository.getOtherNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<OtherResponse> get subject => _subject;
  
}
final getOtherBloc = GetOtherBloc();