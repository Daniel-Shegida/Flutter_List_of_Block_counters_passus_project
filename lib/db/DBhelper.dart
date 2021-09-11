import 'counters_model.dart';

//Название файла поменяй) оно не оостветствует стилистике языка.
abstract class DBHelper {
  void addNewCounter(int count);

  List<int> getCountersList();

  void changeCounterValue(int index, int change);
}