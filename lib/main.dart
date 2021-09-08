import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'block/Counters/counter_block.dart';
import 'Models/counters_model.dart';
import 'Screens/homepage.dart';


void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(CountersModelsAdapter());

  await Hive.openBox<CountersModels>('KeepCounter');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountersBloc())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

