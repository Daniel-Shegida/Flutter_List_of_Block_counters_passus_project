import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/db/counters_model.dart';

class AppState{
  late List<int> counterNumber; //тогда уже counterValues - это ведь значения счетчиков. И в идеале это List<CounterModel>
  late int chosenIndex;

  AppState({required this.counterNumber,required this.chosenIndex});

  AppState.initial() {
    this.counterNumber = [];
    this.chosenIndex = 0;

    var box = Hive.box<CounterModel>('counters');

    for (int index = 0; index < box.values.length; index++){
      counterNumber.add(box.getAt(index)!.countNumber);
    }
  }
}
