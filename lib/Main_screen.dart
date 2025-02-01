import 'package:calculator/components.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Main_screen extends StatefulWidget {
  const Main_screen({super.key});

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {

  var user_input = "";
  var answer = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment : Alignment.bottomRight ,
                          child: Text(user_input.toString()  , style: TextStyle(color: Colors.white,fontSize: 50,), )),
                      SizedBox(height: 20,),
                      Align(
                          alignment : Alignment.bottomRight ,
                          child: Text(answer.toString() , style: TextStyle(color: Colors.white,fontSize: 50), )),
                      SizedBox(height: 20,),
                    ],
                  ),
              )),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        My_btn(
                          title: "AC",
                          color: Colors.blueGrey,
                          onPress: () {
                            user_input = "";
                            answer = "";
                            setState(() {

                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "+/-",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += "+/-";
                              setState(() {

                              });
                            }),
                        SizedBox(width: 10),
                        My_btn(
                            title: "%",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += "%";
                              setState(() {

                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "/",
                            color: Colors.deepOrange,
                            onPress: () {
                              user_input += "/";
                              setState(() {

                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        My_btn(
                          title: "7",
                          color: Colors.blueGrey,
                          onPress: () {

                            user_input += "7";
                            setState(() {

                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "8",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += "8";
                              setState(() {

                              });
                            }),
                        SizedBox(width: 10),
                        My_btn(
                            title: "9",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += "9";
                              setState(() {

                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "x",
                            color: Colors.deepOrange,
                            onPress: () {
                              user_input += "x";
                              setState(() {

                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        My_btn(
                          title: "4",
                          color: Colors.blueGrey,
                          onPress: () {
                            user_input += "4";
                            setState(() {

                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "5",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += "5";
                              setState(() {

                              });
                            }),
                        SizedBox(width: 10),
                        My_btn(
                            title: "6",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += "6";
                              setState(() {

                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "-",
                            color: Colors.deepOrange,
                            onPress: () {
                              user_input += "-";
                              setState(() {

                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        My_btn(
                          title: "1",
                          color: Colors.blueGrey,
                          onPress: () {
                            user_input += "1";
                            setState(() {

                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "2",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += "2";
                              setState(() {

                              });
                            }),
                        SizedBox(width: 10),
                        My_btn(
                            title: "3",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += "3";
                              setState(() {

                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "+",
                            color: Colors.deepOrange,
                            onPress: () {
                              user_input += "+";
                              setState(() {

                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        My_btn(
                          title: "0",
                          color: Colors.blueGrey,
                          onPress: () {
                            user_input += "0";
                            setState(() {

                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: ".",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input += ".";
                              setState(() {

                              });
                            }),
                        SizedBox(width: 10),
                        My_btn(
                            title: "DEL",
                            color: Colors.blueGrey,
                            onPress: () {
                              user_input = user_input.substring(0,user_input.length - 1);
                              setState(() {

                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        My_btn(
                            title: "=",
                            color: Colors.deepOrange,
                            onPress: () {
                              equalpress();
                              setState(() {

                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void equalpress(){

      String final_user_input  = user_input.replaceAll('x', '*');
      Parser p = Parser();
      Expression expansion = p.parse(final_user_input);
      ContextModel contextModel = ContextModel();
      double eval = expansion.evaluate(EvaluationType.REAL, contextModel);
      answer = eval.toString();


  }

}
