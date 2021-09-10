import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/presentation/screens/homepage.dart';
import 'package:redux/redux.dart';
import 'data/redux/reducers.dart';
import 'data/redux/store.dart';
import 'db/counters_model.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(CounterModelAdapter());
  var hiveBox = await Hive.openBox<CounterModel>("counters");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Store<AppState> store = Store(reducer, initialState: AppState.initial());

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

