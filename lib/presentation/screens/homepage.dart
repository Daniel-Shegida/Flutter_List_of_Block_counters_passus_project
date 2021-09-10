import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:passus_project/data/redux/actions.dart';
import 'package:passus_project/data/redux/store.dart';
import 'package:passus_project/presentation/widgets/card_widget.dart';
import 'package:redux/redux.dart';
import 'edit_counter_page.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: SafeArea(
        child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, vm) {
              if(vm.counterNumber.isEmpty){
                return Center(
                  child: Text('Нажмите на кнопку, чтобы создать счетчик'),
                );
              }
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: vm.counterNumber.length,
                  itemBuilder: (_, i) {
                    return _ListNotes(counterNumber: vm.counterNumber[i], index: i);
                    // return Text(vm.counter_numbers[i].toString());
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.dispatch(AddCounterHive());
          store.dispatch(AddCounter());
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _ListNotes extends StatelessWidget {
  final int index;
  final int counterNumber;

  const _ListNotes({required this.counterNumber, required this.index});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        store.dispatch(SelectIndex(index));
        Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => EditCounterPage(oldCounterNum: this.counterNumber)));
      },
      child: CardWidget(
        number: this.counterNumber.toString(),
        wildth: size.width,
      ),
    );
  }
}
