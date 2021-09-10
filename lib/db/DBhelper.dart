import 'counters_model.dart';

abstract class DBHelper {
  void addNewCounter(int count);

  List<int> getCountersList();

  void changeCounterValue(int index, int change);
}