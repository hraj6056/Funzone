import 'dart:math' as math;
import 'package:flutter/material.dart';

class Fifteen extends StatefulWidget {
  @override
  _FifteenState createState() => _FifteenState();
}

class _FifteenState extends State<Fifteen> {
  List<int> board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int x = 3;
  int y = 3;
  int rowCount = 4;
  int colCount = 4;

  void shuffle(List list, int start, int end) {
    var random = math.Random();

    var length = end - start;
    while (length > 1) {
      var pos = random.nextInt(length);
      length--;
      setState(() {
        var tmp1 = list[start + pos];
        list[start + pos] = list[start + length];
        list[start + length] = tmp1;
      });
    }
  }

  void initState() {
    shuffle(board, 0, 16);
  }

  void _initgame() {
    shuffle(board, 0, 16);
  }

  bool isValid(int x, int y) {
    if (x >= 0 && x < rowCount && y >= 0 && y < colCount)
      return true;
    else
      return false;
  }

  void _handleWin() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Congratulations!"),
          content: Text("You Win!"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _initgame();
                Navigator.pop(context);
              },
              child: Text("Play again"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fifteen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF192A56),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 60.0,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _initgame();
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.tag_faces,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    backgroundColor: Colors.yellowAccent,
                  ),
                )
              ],
            ),
          ),
          // The grid of squares
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: colCount,
            ),
            itemBuilder: (context, position) {
              // Get row and column number of square
              int rowNumber = (position / colCount).floor();
              int columnNumber = (position % colCount);

              return InkWell(
                // Opens square
                onTap: () {
                  if (isValid(rowNumber - 1, columnNumber) &&
                      board[(rowNumber - 1) * 4 + columnNumber] == 0) {
                    setState(() {
                      board[(rowNumber - 1) * 4 + columnNumber] =
                          board[rowNumber * 4 + columnNumber];
                      board[rowNumber * 4 + columnNumber] = 0;
                    });
                  }
                  if (isValid(rowNumber + 1, columnNumber) &&
                      board[(rowNumber + 1) * 4 + columnNumber] == 0) {
                    setState(() {
                      board[(rowNumber + 1) * 4 + columnNumber] =
                          board[rowNumber * 4 + columnNumber];
                      board[rowNumber * 4 + columnNumber] = 0;
                    });
                  }
                  if (isValid(rowNumber, columnNumber + 1) &&
                      board[(rowNumber) * 4 + columnNumber + 1] == 0) {
                    setState(() {
                      board[(rowNumber) * 4 + columnNumber + 1] =
                          board[rowNumber * 4 + columnNumber];
                      board[rowNumber * 4 + columnNumber] = 0;
                    });
                  }
                  if (isValid(rowNumber, columnNumber - 1) &&
                      board[(rowNumber) * 4 + columnNumber - 1] == 0) {
                    setState(() {
                      board[(rowNumber) * 4 + columnNumber - 1] =
                          board[rowNumber * 4 + columnNumber];
                      board[rowNumber * 4 + columnNumber] = 0;
                    });
                  }
                  if (board ==
                      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]) {
                    _handleWin();
                  }
                },
                // Flags square
                splashColor: Colors.black,
                child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Center(
                      child: Text(
                        board[rowNumber * 4 + columnNumber].toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              );
            },
            itemCount: rowCount * colCount,
          ),
        ],
      ),
    );
  }
}
