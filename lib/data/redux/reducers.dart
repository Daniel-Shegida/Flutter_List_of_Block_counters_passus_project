import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/data/redux/store.dart';
import 'package:passus_project/db/DBhelper.dart';
import 'package:passus_project/db/HiveDBHelper.dart';
import 'package:passus_project/db/counters_model.dart';
import 'actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  var hiveBox =  Hive.openBox<CounterModel>("counters");

  if (action is IncreaseCounter){
    prevState.counter_numbers[prevState.chosenIndex] += 1;
    return AppState(counter_numbers: prevState.counter_numbers, chosenIndex: prevState.chosenIndex);
  }
  else if (action is DecreaseCounter){
    prevState.counter_numbers[prevState.chosenIndex] -= 1;
    return AppState(counter_numbers: prevState.counter_numbers,chosenIndex: prevState.chosenIndex);
  }
  else if (action is AddCounter){
    prevState.counter_numbers.add(0);
    return AppState(counter_numbers:prevState.counter_numbers ,chosenIndex: prevState.chosenIndex);
  }
  else if (action is SelectIndex){
    prevState.chosenIndex = action.index;
    return AppState(counter_numbers: prevState.counter_numbers,chosenIndex: prevState.chosenIndex);
  }
  else if (action is SaveCounter){
    DBHelper dbHelper = HiveDBHelper();
    dbHelper.changeCounterValue(prevState.chosenIndex, prevState.counter_numbers[prevState.chosenIndex]);
  }
  else if (action is AddCounterHive){
    DBHelper dbHelper = HiveDBHelper();
    dbHelper.addNewCounter("1", 3);
  }
  return prevState;
}