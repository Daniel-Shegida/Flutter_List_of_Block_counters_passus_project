part of 'notes_block.dart';


class NotesState {

   int number;

   NotesState({
    this.number = 0,
  });

  NotesState copyWith({ int? number})
  => NotesState(
      number: number ?? this.number,

  );

}

