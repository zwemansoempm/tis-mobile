import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/profile_features_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetProfileFeaturesBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ProfileFeaturesResponse> _subject =
      BehaviorSubject<ProfileFeaturesResponse>();

  getProfileFeatures(String type, String id) async {
    ProfileFeaturesResponse response = await _repository.getProfileSpecialFeatures(type, id);  
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

  BehaviorSubject<ProfileFeaturesResponse> get subject => _subject;
}

final getProfileFeaturesBloc = GetProfileFeaturesBloc();
