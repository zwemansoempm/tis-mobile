import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/job_detail_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetJobDetailBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<JobDetailResponse> _subject =
      BehaviorSubject<JobDetailResponse>();

  getJobDetetail(String _jobId) async {
    JobDetailResponse response = await _repository.getJobDetail(_jobId);

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

  BehaviorSubject<JobDetailResponse> get subject => _subject;
}

final getJobDetailBloc = GetJobDetailBloc();
