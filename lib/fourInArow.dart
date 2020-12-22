import 'dart:math';
import 'package:flutter/material.dart';

class BoardCircle {
  bool isVisited;
  int val;

  BoardCircle({this.isVisited = false, this.val = 0});
}

Image getImage(num) {
  if (num == 0)
    return Image.asset('images/empty.jpg');
  else if (num == 1)
    return Image.asset('images/red.png');
  else
    return Image.asset('images/blue.jpg');
}

class FourInARow extends StatefulWidget {
  @override
  _FourInARowState createState() => _FourInARowState();
}

class _FourInARowState extends State<FourInARow> {
  int rowCount = 18;
  int colCount = 10;
  int move;
  List<List<BoardCircle>> board;
  @override
  void initState() {
    super.initState();
    _initialiseGame();
  }

  void _initialiseGame() {
    board = List.generate(rowCount, (i) {
      return List.generate(colCount, (j) {
        return BoardCircle();
      });
    });
    move = 0;
    setState(() {});
  }

  bool isValid(int x, int y) {
    if (x >= 0 && x < rowCount && y >= 0 && y < colCount)
      return true;
    else
      return false;
  }

  void _handlemove(int x, int y, int val) {
    for (int i = max(0, x - 3); i <= x; i++) {
      for (int j = max(0, y - 3); j <= y; j++) {
        if (isValid(i + 3, j) &&
            board[i][j].val == val &&
            board[i + 1][j].val == val &&
            board[i + 2][j].val == val &&
            board[i + 3][j].val == val) {
          _handleWin();
          return;
        }
        if (isValid(i + 3, j + 3) &&
            board[i][j].val == val &&
            board[i + 1][j + 1].val == val &&
            board[i + 2][j + 2].val == val &&
            board[i + 3][j + 3].val == val) {
          _handleWin();
          return;
        }
        if (isValid(i, j + 3) &&
            board[i][j].val == val &&
            board[i][j + 1].val == val &&
            board[i][j + 2].val == val &&
            board[i][j + 3].val == val) {
          _handleWin();
          return;
        }
      }
    }

    for (int j = 0; j <= 3; j++) {
      int i = x - j + 3;
      int k = y + j - 3;
      if (isValid(i, k) &&
          board[i][k].val == val &&
          board[i - 1][k + 1].val == val &&
          board[i - 2][k + 2].val == val &&
          board[i - 3][k + 3].val == val) {
        _handleWin();
        return;
      }
    }
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
                _initialiseGame();
                Navigator.pop(context);
              },
              child: Text("Play again"),
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                    _initialiseGame();
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
                  if (board[rowNumber][columnNumber].isVisited == false) {
                    setState(() {
                      board[rowNumber][columnNumber].isVisited = true;
                      board[rowNumber][columnNumber].val = (move % 2) + 1;
                      move += 1;
                    });
                    _handlemove(rowNumber, columnNumber,
                        board[rowNumber][columnNumber].val);
                  }
                },
                // Flags square
                splashColor: Colors.black,
                child: Container(
                  color: Colors.black,
                  child: getImage(board[rowNumber][columnNumber].val),
                ),
              );
            },
            itemCount: rowCount * colCount,
          ),
        ],
      ),
    );
  }
}
