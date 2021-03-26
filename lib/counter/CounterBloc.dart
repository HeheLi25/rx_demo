import 'dart:async';

import 'package:rxdart/subjects.dart';

class CounterBloc {
  int _counter = 0;

  BehaviorSubject<int> _counterController = BehaviorSubject<int>();
  Stream<int> get stream => _counterController.stream;

  void addToCounter() {
    _counterController.sink.add(++_counter);
  }

  void closeSink() {
    _counterController.close();
  }
}
