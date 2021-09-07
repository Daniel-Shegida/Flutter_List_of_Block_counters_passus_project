# passus_project

from here we ll make a step


По ревью в целом: 

Самое первое - очевидная неопрятность кода.
    названия - не по гайдам языка
    много странного закомментировнного кода
    есть явное дублирование кода(экраны с редактированием и добавлением так вообще - копипаст)
    По сути это надо было сделать виджетом

    ```dart
    Center(
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

    ```

В архитектурном плане смесь MVC и блока.
Только блок используется как просто место для обновления данных без вовращения стейта, что собственно противоречит самой концепции.
Плюсом, взаиможействие с реализацией хранилища напрямую из экрана == дорогое изменение кода(например при замене хайва на БД)