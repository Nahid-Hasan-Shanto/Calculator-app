import 'package:a_b_c/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Card(
                            elevation: 5,
                            child: MyButton(
                              buttonTap: () {
                                setState(() {
                                  userQuestion = '';
                                  userAnswer = '';
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.green,
                              textColor: Colors.white,
                            ));
                      } else if (index == 1) {
                        return Card(
                          elevation: 5,
                          child: MyButton(
                              buttonTap: () {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.red,
                              textColor: Colors.white),
                        );
                      } else if (index == buttons.length - 1) {
                        return Card(
                          elevation: 5,
                          child: MyButton(
                              buttonTap: () {
                                setState(() {
                                  equalPressed();
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.indigo,
                              textColor: Colors.white),
                        );
                      } else if (index == buttons.length - 2) {
                        return Card(
                          elevation: 5,
                          child: MyButton(
                              buttonTap: () {
                                setState(() {
                                  equalPressed();
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.deepOrange,
                              textColor: Colors.white),
                        );
                      } else {
                        return Card(
                          elevation: 5,
                          child: MyButton(
                            buttonTap: () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.white,
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          ),
                        );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
