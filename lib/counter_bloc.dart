
import 'dart:async';
enum CounterEvent{
  increment,
  decrement,
  reset
}
class CounterBloc{
  int counter=0;
final _streamController= StreamController<int>();
StreamSink<int> get  counterSink=>_streamController.sink;
Stream<int> get counterStream=>_streamController.stream;

final _eventController= StreamController<CounterEvent>();
StreamSink<CounterEvent> get eventSink=>_eventController.sink;
Stream<CounterEvent> get eventStream=>_eventController.stream;

CounterBloc(){
  eventStream.listen((event) {
    if(event==CounterEvent.increment){
      counter++;
    }else if(event==CounterEvent.decrement){
      counter--;
    }else {
      counter=0;
    }
    counterSink.add(counter);
  });
}
}