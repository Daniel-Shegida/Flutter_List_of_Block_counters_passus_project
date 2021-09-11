import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/data/redux/store.dart';
import 'package:passus_project/db/DBhelper.dart';
import 'package:passus_project/db/HiveDBHelper.dart';
import 'package:passus_project/db/counters_model.dart';
import 'actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  var hiveBox =  Hive.openBox<CounterModel>("counters");

  if (action is IncreaseCounter){
    prevState.counterNumber[prevState.chosenIndex] += 1;
    return AppState(counterNumber: prevState.counterNumber, chosenIndex: prevState.chosenIndex);
  }
  else if (action is DecreaseCounter){
    prevState.counterNumber[prevState.chosenIndex] -= 1;
    return AppState(counterNumber: prevState.counterNumber,chosenIndex: prevState.chosenIndex);
  }
  else if (action is ChangeCounter){
    prevState.counterNumber[prevState.chosenIndex] = action.numToChange;
    return AppState(counterNumber: prevState.counterNumber,chosenIndex: prevState.chosenIndex);
  }
  else if (action is AddCounter){
    prevState.counterNumber.add(0);
    return AppState(counterNumber:prevState.counterNumber ,chosenIndex: prevState.chosenIndex);
  }
  else if (action is SelectIndex){
    prevState.chosenIndex = action.index;
    return AppState(counterNumber: prevState.counterNumber,chosenIndex: prevState.chosenIndex);
  }
  else if (action is SaveCounter){
    DBHelper dbHelper = HiveDBHelper(); // зачем создвать два раза? Ну и почитай про Dependency Inversion
    dbHelper.changeCounterValue(prevState.chosenIndex, prevState.counterNumber[prevState.chosenIndex]);
  }
  else if (action is AddCounterHive){
    DBHelper dbHelper = HiveDBHelper();
    dbHelper.addNewCounter(0);
  }
  return prevState;
}