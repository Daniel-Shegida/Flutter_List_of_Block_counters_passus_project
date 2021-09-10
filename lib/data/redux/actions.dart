import 'package:passus_project/db/counters_model.dart';

abstract class Action {}

class IncreaseCounter extends Action {}

class DecreaseCounter extends Action {}

class AddCounter extends Action {}

class SaveCounter extends Action {}

class AddCounterHive extends Action {
  final CounterModel counter = CounterModel(0);
}

class SelectIndex extends Action {
  int index;

  SelectIndex(
    this.index,
  );
}
