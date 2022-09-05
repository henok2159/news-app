import 'package:flutter/material.dart';
import 'package:test/counterPage.dart';
import 'package:provider/provider.dart';
import 'package:test/counter_controller.dart';
import 'package:test/news_page.dart';

void main() {
 
  runApp(
    
    
  
   MyApp(),
  
  );
    
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> NewsPage()
      },
      
    );
  }
}

