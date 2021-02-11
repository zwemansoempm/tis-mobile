import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/job_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetJobBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<JobResponse> _subject = BehaviorSubject<JobResponse>();

  getJob() async {
    JobResponse response = await _repository.getJob();
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

  BehaviorSubject<JobResponse> get subject => _subject;
}

final getJobBloc = GetJobBloc();
