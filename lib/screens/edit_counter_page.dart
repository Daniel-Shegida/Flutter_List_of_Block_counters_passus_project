import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passus_project/Block/Counters/counter_block.dart';
import 'package:passus_project/Models/counters_model.dart';

class ShowNotePage extends StatefulWidget {
  final CountersModels note;
  final int index;

  const ShowNotePage({required this.note, required this.index});

  @override
  _ShowNotePageState createState() => _ShowNotePageState();
}

class _ShowNotePageState extends State<ShowNotePage> {
   int _number = 0 ;

  @override
  void initState() {
    _number = widget.note.number!;
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
           title: Text("EditNote"),
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
                  noteBloc.add(UpdateCountersEvent(
                      number: _number,
                      index: widget.index
                  ));
                  Navigator.pop(context);
                },
                child: const Text('Update Counter'),
              ),
            ],
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


