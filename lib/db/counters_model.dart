import 'package:hive/hive.dart';

part 'counters_model.g.dart';

@HiveType(typeId: 0)
class CounterModel extends HiveObject {

  @HiveField(0)
  int countNumber;

  CounterModel(this.countNumber);
}
