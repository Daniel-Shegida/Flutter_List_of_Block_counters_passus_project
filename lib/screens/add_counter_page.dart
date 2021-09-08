import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passus_project/Block/Counters/counter_block.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<CountersBloc>(context);

    void increaseCounter() {
      setState(() {
        _number++;
      });
    }

    void decreaseCounter() {
      setState(() {
        _number--;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("AddNote"),
        ),
        body: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: decreaseCounter,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                Container(width: 100, child: Center(child: Text("$_number"))),
                FloatingActionButton(
                  onPressed: increaseCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ]),
          SizedBox(
            height: 50,
          ),
          OutlinedButton(
            onPressed: () {
              noteBloc.add(AddCountersFrave(
                number: _number,
              ));
              Navigator.pop(context);
            },
            child: const Text('Add Counter'),
          )
        ])
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
