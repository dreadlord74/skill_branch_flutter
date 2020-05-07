import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}



// class MyRepeaintObject extends StatefulWidget {
//   MyRepeaintObject({Key key}) : super(key: key);

//   @override
//   _MyRepeaintObjectState createState() => _MyRepeaintObjectState();
// }

// class _MyRepeaintObjectState extends State<MyRepeaintObject> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: Row(
//          children: <Widget>[
//            GestureDetector(
//               onTap: (){},
//               child: Container(
//                 color: Colors.red,
//                 height: 100,
//                 width: 100,
//               ),
//             ),
//          ],
//        ),
//     );
//   }
// }