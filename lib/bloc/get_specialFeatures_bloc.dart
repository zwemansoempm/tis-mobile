// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:tis/model/specialFeatures.dart';
// import 'package:tis/repository/tis_repository.dart';

// class GetSpecialFeaturesBloc {
//   final NewsRepository _repository = NewsRepository();
//   final BehaviorSubject<SpecialFeatures> _subject =
//       BehaviorSubject<SpecialFeatures>();

//   getSpecialFeatures(String test) async {
//     SpecialFeatures response = await _repository.getSpecialFeature(test);
//     _subject.sink.add(response);
//   }

//   void drainStream(){ 
//     _subject.value = null; 
//   }
  
//   @mustCallSuper
//   void dispose() async{
//     await _subject.drain();
//     _subject.close();
//   }

//   BehaviorSubject<SpecialFeatures> get subject => _subject;
  
// }
// final getSpecialFeaturesBloc = GetSpecialFeaturesBloc();