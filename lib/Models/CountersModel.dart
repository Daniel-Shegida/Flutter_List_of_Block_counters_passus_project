import 'package:hive/hive.dart';

part 'CountersModel.g.dart';

@HiveType(typeId: 1)
class CountersModels {

  @HiveField(0)
  int? number;


  CountersModels({ this.number});

}
