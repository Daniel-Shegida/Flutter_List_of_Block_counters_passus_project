part of 'counter_block.dart'; //здесь part of не имеет смысла. Он применяется при генерации файлов.

// TODO: Куча странных и непонятых отступов
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

