import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/occupation_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetOccBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<OccupationResponse> _subject =
      BehaviorSubject<OccupationResponse>();

  getOccupation(String test) async {
    OccupationResponse response = await _repository.getOccupation(test);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<OccupationResponse> get subject => _subject;
}

final getOccBloc = GetOccBloc();
