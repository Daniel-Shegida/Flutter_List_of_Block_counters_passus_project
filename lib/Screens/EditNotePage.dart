import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passus_project/Block/Notes/notes_block.dart';
import 'package:passus_project/Models/NoteModel.dart';

class ShowNotePage extends StatefulWidget {
  final NoteModels note;
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

    final noteBloc = BlocProvider.of<NotesBloc>(context);

    return Scaffold(
      appBar: AppBar(
           title: Text("EditNote"),
          ),
      body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'cancel',
              child: Icon(Icons.close),
            ),
            FloatingActionButton(
              onPressed: increaseCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            Container(
              width: 100,
              child: Center(
                child: Text("$_number"),
              ),
            ),
            FloatingActionButton(
              onPressed: decreaseCounter,
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                noteBloc.add(UpdateNoteEvent(
                  number: _number,
                  index: widget.index
                ));
                Navigator.pop(context);
              },
              tooltip: 'add',
              child: Icon(Icons.accessible_forward),
            ),
          ])),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
