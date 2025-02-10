import 'package:flutter/foundation.dart';
import '../models/CounterModel.dart';

class CounterViewModel extends ChangeNotifier{

  final CounterModel _model = CounterModel();

  int get counter => _model.counter;

  void incrementCounter(){
    _model.incrementCounter();
    notifyListeners();
  }

  void decrementCounter(){
    _model.decrementCounter();
    notifyListeners();
  }

  int getCounter(){
    return counter;
  }

}