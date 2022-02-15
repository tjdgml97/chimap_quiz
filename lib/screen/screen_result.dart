
import 'package:chimap_quiz1/Model/model.quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget{
  List<int> answers;
  List<Quiz> quizs;
  ResultScreen({required this.answers, required this.quizs});

  @override

  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for(int i=0; i<quizs.length; i++) {
      if(quizs[i].answer == answers[i]) {
        score += 1;
      }
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar (
              title: Text('My Quiz App'),
              //backgroundColor: Colors.white,
              leading: Container(),
            ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color:Colors.white),
            ),
          width: width*0.85,
          height: height*0.5,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child:Text('수고하셨습니다!!'),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}