part of 'counter_block.dart';


class CountersState {

   int number;

   CountersState({
    this.number = 0,
  });

  CountersState copyWith({ int? number})
  => CountersState(
      number: number ?? this.number,

  );

}

