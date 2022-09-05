


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/counter_bloc.dart';
import 'package:test/counter_controller.dart';

class CounterPage extends StatelessWidget {

    CounterBloc bloc=CounterBloc();
  
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title:Text("counter")),
      body: Center(child: StreamBuilder<Object>(
        stream: bloc.counterStream,
        initialData: 0,
        builder: (context, snapshot) {
          return Text( "${snapshot.data}"  );
        }
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        FloatingActionButton(onPressed: (){
          
          bloc.eventSink.add(CounterEvent.increment);
        },child: Icon(Icons.add),),
        SizedBox(width: 20,),
        FloatingActionButton(onPressed: (){
         
          bloc.eventSink.add(CounterEvent.reset);

        },child: Icon(Icons.exposure_zero)),
        SizedBox(width: 20,),
        FloatingActionButton(onPressed: (){
         
          bloc.eventSink.add(CounterEvent.decrement);
        },child: Icon(Icons.remove))
      ]),
    );
  }
}