import 'package:flutter/material.dart';
//import 'package:mineswapper/mineswaper.dart';
//import 'package:mineswapper/fourInArow.dart';

import 'fifteen.dart';
import 'fourInArow.dart';
import 'mineswaper.dart';
import 'tictactoe.dart';
import 'game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FUNzone',
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
        appBar: AppBar(
          title: Text(
            "FunZone",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xFF192A56),
        ),
        body: Container(
          margin: EdgeInsets.all(100.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 125,
                  width: 125,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameActivity()));
                    }, // Handle your callback.
                    splashColor: Colors.brown.withOpacity(0.5),
                    child: Ink(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/mineswapper.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 125,
                  width: 125,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameScreen()));
                    }, // Handle your callback.
                    splashColor: Colors.brown.withOpacity(0.5),
                    child: Ink(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/solitre.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 125,
                  width: 125,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FourInARow()));
                    }, // Handle your callback.
                    splashColor: Colors.brown.withOpacity(0.5),
                    child: Ink(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/four.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 125,
                  width: 125,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Fifteen()));
                    }, // Handle your callback.
                    splashColor: Colors.brown.withOpacity(0.5),
                    child: Ink(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/fifteen.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 125,
                  width: 125,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }, // Handle your callback.
                    splashColor: Colors.brown.withOpacity(0.5),
                    child: Ink(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/tictactoe.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
