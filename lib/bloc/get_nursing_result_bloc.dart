import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/nursing.dart';
import 'package:tis/repository/tis_repository.dart';

class GetNursingResultBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<NursingResponse> _subject =
      BehaviorSubject<NursingResponse>();

  getNursingResult(String city, String township,String movingIn,String perMonth,var moveID,var specialFeatureID,var medicalAcceptanceID,var facTypeID) async {
    if(city == null || city.isEmpty){
      city = "-1";
    }
    if(township == null || township.isEmpty){
      township = "-1";
    }
    if(movingIn == null || movingIn.isEmpty){
      movingIn = "-1";
    }
    if(perMonth == null || perMonth.isEmpty){
      perMonth = "-1";
    }
    if(moveID == null || moveID.isEmpty){
      moveID.add("0");
    }
    if(specialFeatureID == null || specialFeatureID.isEmpty){
      specialFeatureID.add(0);
    }
    if(medicalAcceptanceID == null || medicalAcceptanceID.isEmpty){
      medicalAcceptanceID.add(0);
    }
    if(facTypeID == null || facTypeID.isEmpty){
      facTypeID.add(0);
    }
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
