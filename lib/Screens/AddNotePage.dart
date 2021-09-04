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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//Todo later as event
    void increaseCounter() {
      setState(() {
        _number++;
      });
    }

    //Todo later as event
    void decreaseCounter() {
      setState(() {
        _number--;
      });
    }

    final noteBloc = BlocProvider.of<CountersBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("AddNote"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: decreaseCounter,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                Container(
                  width: 100,
                  child: Center(
                    child: Text("$_number"),
                  ),
                ),
                FloatingActionButton(
                  onPressed: increaseCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ]),

          SizedBox(height: 50,),

          OutlinedButton(
              onPressed: () {
                noteBloc.add(AddCountersFrave(
                  number: _number,
                ));
                Navigator.pop(context);
              },
            child: const Text('Add Counter'),
          ),
        ],
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// body: Center(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: <Widget>[
// FloatingActionButton(
// onPressed: () {
// Navigator.pop(context);
// },
// tooltip: 'cancel',
// child: Icon(Icons.close),
// ),
// FloatingActionButton(
// onPressed: increaseCounter,
// tooltip: 'Increment',
// child: Icon(Icons.add),
// ),
// Container(
// width: 100,
// child: Center(
// child: Text("$_number"),
// ),
// ),
// FloatingActionButton(
// onPressed: decreaseCounter,
// tooltip: 'Increment',
// child: Icon(Icons.remove),
// ),
// FloatingActionButton(
// onPressed: () {
//
// noteBloc.add(AddNoteFrave(
// number: _number,
// ));
// Navigator.pop(context);
// },
// tooltip: 'add',
// child: Icon(Icons.accessible_forward),
// ),
// ])),
