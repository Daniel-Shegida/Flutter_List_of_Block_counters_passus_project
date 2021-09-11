import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/db/DBhelper.dart';
import 'counters_model.dart';


class HiveDBHelper implements DBHelper {
  @override
  void addNewCounter(int count) {
    var box = Hive.box<CounterModel>("counters");
    CounterModel counterModel = CounterModel(count);
    box.add(counterModel);
  }

  @override
  List<int> getCountersList() {
    List<int> list = [];
    var box = Hive.box<CounterModel>("counter");
    for (int index = 0; index < box.values.length; index++){
      list.add(box.getAt(index)!.countNumber);
    }
    return list;
  }

  @override
  void changeCounterValue(int index, int change) {
    var box = Hive.box<CounterModel>("counters");
    CounterModel? counterModel = box.getAt(index);
    counterModel!.countNumber =  change;
    counterModel.save();
  }



}