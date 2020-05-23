import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Text(
                    '0',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Text(
                    '0',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button(word: 'AC'),
                    button(word: 'C'),
                    button(word: '%'),
                    button(word: '/',value: 1),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button(word: '7'),
                    button(word: '8'),
                    button(word: '9'),
                    button(word: 'x',value: 1),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button(word: '4'),
                    button(word: '5'),
                    button(word: '6'),
                    button(word: '-',value: 1),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button(word: '1'),
                    button(word: '2'),
                    button(word: '3'),
                    button(word: '+',value: 1),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    button(word: '.'),
                    button(word: '0'),
                    button(word: 'DEL'),
                    button(word: '=',value: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget button({String word,int value}) {
  Color col=Colors.black;
  if(value==1)
    col=Colors.teal;
  return Expanded(
    child: FlatButton(
      padding: EdgeInsets.all(20),
      color: col,
      onPressed: () {},
      child: Text(
        word,
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    ),
  );
}
