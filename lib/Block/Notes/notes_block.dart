import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/Models/NoteModel.dart';
import 'package:flutter/material.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesState());

  @override
  Stream<NotesState> mapEventToState(NotesEvent event) async* {
    if (event is AddNoteFrave) {
      var box = await Hive.openBox<NoteModels>('KeepCounter');

      var noteModel = NoteModels(
        number: event.number,
      );

      box.add(noteModel);
    } else if (event is IncreaseNoteEvent) {
      yield state.copyWith(number: state.number++); //well yeah todo

    } else if (event is DecreaseNoteEvent) {
      yield state.copyWith(number: state.number--);

    } else if (event is UpdateNoteEvent) {
      var box = await Hive.openBox<NoteModels>('KeepCounter');

      var noteModel = NoteModels(
        number: event.number,
      );
      box.putAt(event.index, noteModel);
    }
  }
}
