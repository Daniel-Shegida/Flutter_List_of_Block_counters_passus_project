import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/db/DBhelper.dart';
import 'counters_model.dart';

// так же надо поменять название файла
// если говорить в цнелом про эти два класса с хелпером: я говорил Анлрею, что лучше хранить класс, а не сырые значения.
// Но кроме хранения - ими же надо оперировать и дальше по приложению.
// А то получается хранишь оъект, а дальше скатываешься в неясные списки интов и весь профит от объекта теряется. Поддерживать List<int> сложнее чем List<Counter>.
// 
// Сейчас кажется, что ты просто взял готовое и не задумывался. Это не очень хороший путь.
class HiveDBHelper implements DBHelper {
  @override
  void addNewCounter(int count) {
    var box = Hive.box<CounterModel>("counters"); // зачем открывать бокс на каждый чих - если его можно открыть один раз при создании?
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