import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:passus_project/Block/Counters/counter_block.dart';
import 'package:passus_project/Models/counters_model.dart';
import 'package:passus_project/Widgets/card_widget.dart';
import 'add_counter_page.dart';
import 'edit_counter_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  var box = Hive.box<CountersModels>('KeepCounter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (_, Box box, __) {
            if (box.values.isEmpty) {
              return Center(
                child: Text('Нажмите на кнопку, чтобы создать счетчик'),
              );
            }
            return BlocBuilder<CountersBloc, CountersState>(builder: (_, state) {
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: box.values.length,
                  itemBuilder: (_, i) {
                    CountersModels notes = box.getAt(i);

                    return BlocBuilder<CountersBloc, CountersState>(
                        builder: (_, state) =>
                            _ListNotes(note: notes, index: i));
                  });
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddNotePage())),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _ListNotes extends StatelessWidget {
  final CountersModels note;
  final int index;

  const _ListNotes({required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ShowNotePage(note: note, index: index))),
      child: CardWidget(
        number: note.number.toString(),
        wildth: size.width,
      ),
    );
  }
}