import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/city_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetCityBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<CityResponse> _subject =
      BehaviorSubject<CityResponse>();

  getCity() async {
    CityResponse response = await _repository.getCity();
    //print(response.city);
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

  BehaviorSubject<CityResponse> get subject => _subject;
}

final getCityBloc = GetCityBloc();
