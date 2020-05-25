import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  double num1=0.0,num2=0.0;
  String output='0',_output='0',opr,a='0';
  bool flag;
  buttonPressed(String txt){
    if(txt=='AC'){
      a='';
      _output='0';
      output='0';
      num1=0;
      num2=0;
    }
    else if(txt=='C'){
      _output='0';
      a='0';
    }
    else if(txt=='+'||txt=='-'||txt=='*'||txt=='/'||txt=='%'){
      if(flag==false){
        num2=double.parse(output);
        if(opr=='+')
          output=(num1+num2).toString();
        else if(opr=='-')
          output=(num1-num2).toString();
        else if(opr=='*')
          output=(num1*num2).toString();
        else if(opr=='/')
          output=(num1/num2).toString();
        else if(opr=='%')
          output=(num1%num2).toString();
        num1=0;
        num2=0;
      }
      num1=double.parse(output);
      a+=txt;
      opr=txt;
      _output='0';
    }
    else if(txt=='.'){
      if(_output.contains('.'))
        print('Already exists');
      else{
        _output+=txt;
        a+=txt;
      }

    }
    else if(txt=='='){
      num2=double.parse(output);
      if(opr=='+')
        _output=(num1+num2).toString();
      else if(opr=='-')
        _output=(num1-num2).toString();
      else if(opr=='*')
        _output=(num1*num2).toString();
      else if(opr=='/')
        _output=(num1/num2).toString();
      else if(opr=='%')
        _output=(num1%num2).toString();
      num2=0;
      num1=0;
    }
    else if(txt=='DEL'){
      _output=_output.substring(0,_output.length-1);
      a=a.substring(0,a.length-1);
    }
    else{
      _output+=txt;
      a+=txt;
    }
    setState(() {
      output=double.parse(_output).toStringAsFixed(2);
    });
  }


  Widget button({String word,int value}) {

      Color col1 = Color(0xff000000);
      Color col2 = Color(0xffE91E63);

    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(20),
        color: col1,
        onPressed: ()=>buttonPressed(word),
        child: Text(
          word,
          style: TextStyle(color: col2, fontSize: 28),
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
          backgroundColor: Color(0xffE91E63),
        ),
        backgroundColor: Color(0xff000000),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Color(0xffE91E63),
                  child: Text(
                    a,
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
                  color: Color(0xffE91E63),
                  child: Text(
                    output,
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



