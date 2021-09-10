import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/db/counters_model.dart';

class AppState{
  late List<int> counter_numbers;
  late int chosenIndex;

  AppState({required this.counter_numbers,required this.chosenIndex});

  AppState.initial() {
    this.counter_numbers = [];
    this.chosenIndex = 0;

    var box = Hive.box<CounterModel>('counters');

    for (int index = 0; index < box.values.length; index++){
      counter_numbers.add(box.getAt(index)!.countNumber);
    }
  }
}
