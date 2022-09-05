


import 'dart:ui';

import 'package:flutter/Material.dart';

import 'package:test/api_service.dart';
import 'package:test/constant.dart';
import 'package:test/counterPage.dart';
import 'package:test/newsModel.dart';
import 'package:test/news_controller.dart';

class NewsPage extends StatefulWidget {
  

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsController newsbloc=NewsController();
  @override
  void initState(){
    newsbloc.eventSink.add(NewsAction.fetch);
super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("news page")),
      body: Container(
        color: Colors.grey,
        child: StreamBuilder<List<Article>>(
        stream: newsbloc.newsStream,
        builder: (context, snapshot) {
          
        if(snapshot.hasData){
          return ListView.builder
          (
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index){
              var article=snapshot.data![index];
              return Container(
                height:100,
               margin: EdgeInsets.only(top: 10, left: 20,right: 10), 
               
                  child: Row(children: [
                   ClipRRect (
                     borderRadius: BorderRadius.circular(20),
                     child: Image.network(article.urlToImage??CostantData().place_url,height: 100,width: 100,fit: BoxFit.fill,)),
                     SizedBox(width: 10,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(article.title??"no title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                        ),
                        Text(article.description??"no description",maxLines: 3,
                        style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,)
                      ],),
                    )
                  ]),
              );
                  }          );

          
        }
        else if(snapshot.hasError){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" oppps ${snapshot.error.toString()}"),
              TextButton(onPressed: (){
                  newsbloc.eventSink.add(NewsAction.fetch);
              },child: Text("try again"),)
            ],
          ),);
        }
        
        else return Center(child: CircularProgressIndicator(),);
        
      },),),
    floatingActionButton: FloatingActionButton.extended(
      label:Text("to counter") ,
      onPressed: (){
        SnackBar(content: Text("to counter page"),backgroundColor: Colors.blue,
        action: SnackBarAction(label: "undo",onPressed: (){},),
        );
     // Navigator.push(context,MaterialPageRoute(builder: (context)=>CounterPage()));
    }),);
  }
}