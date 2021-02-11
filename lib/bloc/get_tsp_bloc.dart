import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/township_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetTspBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<TownshipResponse> _subject =
      BehaviorSubject<TownshipResponse>();

  getTownship(String test) async {
    TownshipResponse response = await _repository.getTsp(test);
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

  BehaviorSubject<TownshipResponse> get subject => _subject;
}

final getTspBloc = GetTspBloc();
