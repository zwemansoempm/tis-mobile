
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/medical_response2.dart';
import 'package:tis/repository/tis_repository.dart';

class GetMedical2Bloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<MedicalResponse2> _subject =
      BehaviorSubject<MedicalResponse2>();

  getMedical2() async {
    MedicalResponse2 response = await _repository.getMedical2();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MedicalResponse2> get subject => _subject;
  
}
final getMedical2Bloc = GetMedical2Bloc();