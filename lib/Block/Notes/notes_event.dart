part of 'notes_block.dart';

@immutable
abstract class NotesEvent {}

class IncreaseNoteEvent extends NotesEvent {
  IncreaseNoteEvent();
}

class DecreaseNoteEvent extends NotesEvent {
  DecreaseNoteEvent();
}

class AddNoteFrave extends NotesEvent {

   int number;

  AddNoteFrave({
    required this.number,
  });
}

class UpdateNoteEvent extends NotesEvent {

  final int number;
  final int index;

  UpdateNoteEvent({
    required this.number,
    required this.index,

  });
}
