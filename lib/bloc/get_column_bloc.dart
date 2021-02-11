import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/column_respons.dart';
import 'package:tis/repository/tis_repository.dart';

class GetColumnBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ColumnResponse> _subject =
      BehaviorSubject<ColumnResponse>();

  getColumnNews() async {
    ColumnResponse response = await _repository.getColumnNews();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ColumnResponse> get subject => _subject;
  
}
final getColumnBloc = GetColumnBloc();