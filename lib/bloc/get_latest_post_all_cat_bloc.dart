
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tis/model/article_response.dart';
import 'package:tis/model/posts_response.dart';
import 'package:tis/repository/tis_repository.dart';

class GetLatestPostAllCatBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<PostsResponse> _subject =
      BehaviorSubject<PostsResponse>();

  getLatestPostAllCat() async {
    PostsResponse response = await _repository.getLatestPostAllCat();
    _subject.sink.add(response);
  }
  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<PostsResponse> get subject => _subject;
  
}
final getLatestPostAllCatBloc = GetLatestPostAllCatBloc();