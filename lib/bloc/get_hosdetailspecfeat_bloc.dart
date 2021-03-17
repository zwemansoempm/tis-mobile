import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/hosdetail_specfeat_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetSpecFeatBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<HosDetailSpecFeatResponse> _subject =
      BehaviorSubject<HosDetailSpecFeatResponse>();

    getHosDetailSpecFeat(String type, String hospitalID) async {
    HosDetailSpecFeatResponse response = await _repository.getHosDetailSpecFeat(type, hospitalID);
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<HosDetailSpecFeatResponse> get subject => _subject;
  
}
final getSpecFeatBloc = GetSpecFeatBloc();