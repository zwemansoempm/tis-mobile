import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/speialfeatures_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetFeaturesBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<SpecialFeaturesResponse> _subject =
      BehaviorSubject<SpecialFeaturesResponse>();

  getFeatures() async {
    SpecialFeaturesResponse response = await _repository.getFeatures();  
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

  BehaviorSubject<SpecialFeaturesResponse> get subject => _subject;
}

final getFeaturesBloc = GetFeaturesBloc();
