import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/department_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetDepBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<DepartmentResponse> _subject =
      BehaviorSubject<DepartmentResponse>();

  getDepartment(String test) async {
    DepartmentResponse response = await _repository.getDepartment(test);
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

  BehaviorSubject<DepartmentResponse> get subject => _subject;
}

final getDepBloc = GetDepBloc();
