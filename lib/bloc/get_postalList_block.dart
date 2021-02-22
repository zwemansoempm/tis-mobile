import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/postal_list_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetPostaBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<PostalListResponse> _subject =
      BehaviorSubject<PostalListResponse>();

  getPostalList(String id) async {
    PostalListResponse response = await _repository.getPostalList(id);
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

  BehaviorSubject<PostalListResponse> get subject => _subject;
}

final getPostalBloc = GetPostaBloc();
