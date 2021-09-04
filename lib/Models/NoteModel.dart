import 'package:hive/hive.dart';

part 'NoteModel.g.dart';

@HiveType(typeId: 1)
class NoteModels {

  @HiveField(0)
  int? number;


  NoteModels({ this.number});

}
