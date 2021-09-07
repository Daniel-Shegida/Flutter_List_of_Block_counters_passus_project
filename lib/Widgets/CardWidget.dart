import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key? key, required this.wildth, required this.number})
      : super(key: key);
  final double wildth;
  final String number;

  @override
  _CardWidget createState() => _CardWidget();
}

class _CardWidget extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
      height: 110,
      width: widget.wildth, //TODO: по умолчанию будет максимальная ширина. Зачем сюда передавать иное?
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: Colors.white54),
      child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            FloatingActionButton(
              onPressed: null,
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
            Container(
                width: 100,
                child: Center(
                  child: Text("${widget.number}"),
                )),
            FloatingActionButton(
              onPressed: null,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ])),
    );
  }
}
