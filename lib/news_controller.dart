
import 'dart:async';

import 'package:test/api_service.dart';
import 'package:test/newsModel.dart';

enum NewsAction{
  fetch,
  delete,
}

class NewsController{

  final _streamController =StreamController<List<Article>>();
  StreamSink<List<Article>> get newsSink => _streamController.sink;
  Stream<List<Article>> get newsStream=> _streamController.stream;

  final eventController= StreamController<NewsAction>();
  StreamSink get eventSink=>eventController.sink;
  Stream get eventState=> eventController.stream;

  NewsController(){
    eventState.listen((event)async {
      if(event==NewsAction.fetch){
      try{
      var news=await ApiService().getNews();
       List<Article> art=news!.articles;
       newsSink.add(art);
      }on Exception catch(Err){
      newsSink.addError("something goes wrong");
      }
      }
    });
  }
}