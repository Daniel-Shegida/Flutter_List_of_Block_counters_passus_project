import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/Models/counters_model.dart';
import 'package:flutter/material.dart';

part 'counters_event.dart';
part 'counters_state.dart';

class CountersBloc extends Bloc<CountersEvent, CountersState> {
  CountersBloc() : super(CountersState());

  @override
  Stream<CountersState> mapEventToState(CountersEvent event) async* {
    if (event is AddCountersFrave) {
      var box = await Hive.openBox<CountersModels>('KeepCounter');

      var noteModel = CountersModels(
        number: event.number,
      );

      box.add(noteModel);

    } else if (event is UpdateCountersEvent) {
      var box = await Hive.openBox<CountersModels>('KeepCounter');

      var noteModel = CountersModels(
        number: event.number,
      );
      box.putAt(event.index, noteModel);
    }
  }
}