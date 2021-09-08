import 'package:hive/hive.dart';

part 'counters_model.g.dart';

@HiveType(typeId: 1)
class CountersModels {

  @HiveField(0)
  int? number;


  CountersModels({ this.number});

}
