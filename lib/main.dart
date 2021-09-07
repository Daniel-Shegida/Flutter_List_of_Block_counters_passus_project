import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Block/Counters/counter_block.dart';
import 'Models/CountersModel.dart';
import 'Screens/Homepage.dart';


void main() async {

  //TODO: пусмтые строки - это мощный инструмент. Но когда они стоят в рандомных местах - они сильно загрязняют код.

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

