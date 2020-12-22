import 'package:flutter/material.dart';
//import 'package:mineswapper/mineswaper.dart';
//import 'package:mineswapper/fourInArow.dart';

import 'fifteen.dart';
import 'fourInArow.dart';
import 'mineswaper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text(
              "MineSwapper",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GameActivity()));
            },
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.grey,
          ),
          RaisedButton(
            child: Text(
              "Fifteen",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Fifteen()));
            },
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.grey,
          ),
          RaisedButton(
            child: Text(
              "FourInARow",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FourInARow()));
            },
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.grey,
          )
        ],
      ),
    );
  }
}
