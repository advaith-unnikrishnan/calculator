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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  children: <Widget>[
                    Button(word: 'AC'),
                    Button(word: 'C'),
                    Button(word: '+/-'),
                    Button(word: '/'),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Button(word: '7'),
                    Button(word: '8'),
                    Button(word: '9'),
                    Button(word: '/'),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Button(word: '4'),
                    Button(word: '5'),
                    Button(word: '6'),
                    Button(word: '/'),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Button(word: '1'),
                    Button(word: '2'),
                    Button(word: '3'),
                    Button(word: '/'),
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

class Button extends StatelessWidget {
  Button({this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        word,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
