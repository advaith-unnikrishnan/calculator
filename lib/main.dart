import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var num1=0.0,num2=0.0;
  String out1='0',out2='0',prev='',operand='';
  buttonPressed(String txt){
    if(txt=='AC'){
      num1=0.0;num2=0.0;
      prev='';operand='';
      out1='0';out2='0';
    }
    else if(txt=='C'){
      out2='0';
    }
    else if(txt=='%'||txt=='/'||txt=='*'||txt=='-'||txt=='+'){
      operand=txt;
      if(num1!=0.0 && num2!=0.0){
        switch(operand){
          case '+':
            out1=(num1+num2).toString();
            break;
          case '-':
            out1=(num1-num2).toString();
            break;
          case '*':
            out1=(num1*num2).toString();
            break;
          case '/':
            out1=(num1/num2).toString();
            break;
          case '%':
            out1=(num1%num2).toString();
            break;
        }
      }
      num1=double.parse(out1);
      print(num1);
      num2=0.0;
      prev+=txt;
      operand='';
    }
    else if(txt=='DEL'){
      prev=prev.substring(0,prev.length-1);
    }
    else if(txt=='=') {
      if (num1 != 0.0 && num2 != 0.0) {
        switch (operand) {
          case '+':
            out1 = (num1 + num2).toString();
            break;
          case '-':
            out1 = (num1 - num2).toString();
            break;
          case '*':
            out1 = (num1 * num2).toString();
            break;
          case '/':
            out1 = (num1 / num2).toString();
            break;
          case '%':
            out1 = (num1 % num2).toString();
            break;
        }
      }
      num1=double.parse(out1);
      num2=0.0;
      prev+=txt;
      operand='';
      setState(() {
        out2=out1;
      });
    }
    else if(txt=='.'){
      if(operand=='' && !num1.toString().contains('.'))
        num1=double.parse(num1.toString()+txt);
      else if(!num2.toString().contains('.'))
        num2=double.parse(num2.toString()+txt);
      prev+=txt;
    }
    else{
      if(operand=='')
        num1=num1*10+double.parse(txt);
      else
        num2=num2*10+double.parse(txt);
      prev+=txt;
    }
    setState(() {
      out2=num1.toStringAsFixed(2);
    });
  }



  Widget button({String word,int value}) {
    Color col1=Colors.white;
    Color col2=Colors.blueAccent;
    if(value==1) {
      col1 = Colors.blueAccent;
      col2 = Colors.white;
    }
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(20),
        color: col1,
        onPressed: ()=>buttonPressed(word),
        child: Text(
          word,
          style: TextStyle(color: col2, fontSize: 25),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    prev,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    out2,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.blueAccent,
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
                    button(word: '*',value: 1),
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



