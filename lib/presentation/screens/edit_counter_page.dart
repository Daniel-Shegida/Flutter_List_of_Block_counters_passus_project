import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:passus_project/data/redux/actions.dart';
import 'package:passus_project/data/redux/store.dart';
import 'package:redux/redux.dart';

class EditCounterPage extends StatefulWidget {
  final int oldCounterNum;

  const EditCounterPage({ required this.oldCounterNum});

  @override
  _EditCounterPageState createState() => _EditCounterPageState();
}

class _EditCounterPageState extends State<EditCounterPage> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    bool OLDFLAG = true;

    return WillPopScope(
      onWillPop: () async{
        if (OLDFLAG) {
          store.dispatch(ChangeCounter(widget.oldCounterNum));
        }
        return true;
      },
      child: Scaffold(
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
                        onPressed: () => store.dispatch(DecreaseCounter()),
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                      ),
                      StoreConnector<AppState, AppState>(
                          converter: (store) => store.state,
                          builder: (context, vm) {
                            return Container(width: 100, child: Center(child: Text(vm.counterNumber[vm.chosenIndex].toString())));
                          }),
                      FloatingActionButton(
                        onPressed: () => store.dispatch(IncreaseCounter()),
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                    ]),
                SizedBox(height: 50,),
                OutlinedButton(
                  onPressed: () {
                    OLDFLAG = !OLDFLAG;
                    store.dispatch(SaveCounter());
                    Navigator.pop(context);
                  },
                  child: const Text('Update Counter'),
                ),
              ],
            )),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}


