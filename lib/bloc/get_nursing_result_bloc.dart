import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/nursing.dart';
import 'package:tis/repository/tis_repository.dart';

class GetNursingResultBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<NursingResponse> _subject =
      BehaviorSubject<NursingResponse>();

  getNursingResult(String city, String township,String movingIn,String perMonth,var moveID,var specialFeatureID,var medicalAcceptanceID,var facTypeID) async {
    
    NursingResponse response = await _repository.getNursingResult(city,township,movingIn,perMonth,moveID,specialFeatureID,medicalAcceptanceID,facTypeID);
    _subject.sink.add(response);
  }

  void drainStream(){ 
    _subject.value = null; 
  }
  
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<NursingResponse> get subject => _subject;
  
}
final getNursingResultBloc = GetNursingResultBloc();
