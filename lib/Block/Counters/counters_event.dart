part of 'counter_block.dart';

@immutable
abstract class CountersEvent {}

//TODO: Почему Frave?
class AddCountersFrave extends CountersEvent {

   int number;

  AddCountersFrave({
    required this.number,
  });
}

class UpdateCountersEvent extends CountersEvent {

  final int number;
  final int index;

  UpdateCountersEvent({
    required this.number,
    required this.index,

  });
}
