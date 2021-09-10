import 'counters_model.dart';

abstract class DBHelper {
  void addNewCounter(String name, int count);

  List<int> getCountersList();

  void changeCounterValue(int index, int change);

  CounterModel getCounter(int index);

}