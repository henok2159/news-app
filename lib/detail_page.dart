import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:test/newsModel.dart';

import 'constant.dart';


class DetailPage extends StatefulWidget {
  Article article;
DetailPage({required this.article});

  @override
  State<DetailPage> createState() => _DetailPageState(article);
}

class _DetailPageState extends State<DetailPage> {
  Article article;
  _DetailPageState(this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
            Flexible(flex: 2,child: Image.network(article.urlToImage??CostantData().place_url),),
            Padding(padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
            child: Flexible(flex: 1,child: Text(article.title??"No Title",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)) ,)),
            Padding(padding:EdgeInsets.fromLTRB(20, 10, 10, 10) ,child: Text("author: ${article.author}"),),
            Padding(padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Expanded(child: SingleChildScrollView(child: Text(article.description??"No Description",
            style: TextStyle(fontSize: 15),),)),)
      ],)
    );
  }
}