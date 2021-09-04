import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Block/Notes/notes_block.dart';
import 'Models/NoteModel.dart';
import 'Screens/Homepage.dart';


void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelsAdapter());

  await Hive.openBox<NoteModels>('KeepCounter');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesBloc())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

