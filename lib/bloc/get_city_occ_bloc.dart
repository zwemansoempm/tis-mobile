import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/city_occ_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetCityOccBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<CityOccListResponse> _subject =
      BehaviorSubject<CityOccListResponse>();

  getCityOccList() async {
    CityOccListResponse response = await _repository.getCityOccList();
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

  BehaviorSubject<CityOccListResponse> get subject => _subject;
}

final getCityOccBloc = GetCityOccBloc();
