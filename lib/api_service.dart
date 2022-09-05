 
 import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test/constant.dart';
import 'package:test/newsModel.dart';
 
 class ApiService{
var _client =http.Client();

Future<Welcome?> getNews()async{
    var url= Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=3f312822c260464a89b72eaba8bc6c78");

    var response = await _client.get(url);
    print("response");
    print(response.body);
    
    if(response.statusCode==200){
       var jsonbody=jsonDecode(response.body)  ;
     Welcome nm=Welcome.fromJson(jsonbody);
     return nm;
    }
    return null;
}

 }