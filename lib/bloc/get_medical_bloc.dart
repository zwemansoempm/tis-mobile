
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/medical_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetMedicalBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<MedicalResponse> _subject =
      BehaviorSubject<MedicalResponse>();

  getMedicalNews() async {
    MedicalResponse response = await _repository.getMedicalNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MedicalResponse> get subject => _subject;
  
}
final getMedicalBloc = GetMedicalBloc();