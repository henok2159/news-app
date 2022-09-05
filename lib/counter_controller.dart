
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class CounterController with ChangeNotifier{
int _count=0;
int get count=>_count;
void increment(){
  _count++;
  notifyListeners();
}
void toZero(){
  _count=0;
  notifyListeners();
}
void decrement(){
  _count--;
  notifyListeners();
}
}