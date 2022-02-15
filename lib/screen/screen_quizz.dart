import 'package:auto_size_text/auto_size_text.dart';
import 'package:chimap_quiz1/Model/model.quiz.dart';
import 'package:chimap_quiz1/Widget/widget_candidate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz> quizs;

  QuizScreen({required this.quizs});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Quiz> qui = [
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['박성희', '김성희', '이성희', '정성희', '숭숭희'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['박성희', '김성희', '이성희', '정성희', '숭숭희'],
      'answer': 1
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['박성희', '김성희', '이성희', '정성희', '숭숭희'],
      'answer': 2
    }),
  ];

  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false, false];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('문제 '), backgroundColor: Color(0xFFFFCAB0)),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
// decoration: BoxDecoration (
// borderRadius: BorderRadius.circular(30),
// border: Border.all(color: Colors.black),
// ),
            width: width * 0.85,
            height: height * 0.75,
            child: Swiper(
                physics: NeverScrollableScrollPhysics(),
                loop: false,
                itemCount: qui.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildQuizCard(qui[index], width, height);
                }),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(Quiz quiz, double width, double height) {
    return Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// border: Border.all(color: Colors.white),
// color: Colors.black
// ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
// padding: EdgeInsets.fromLTRB(0,width*0.024, 0, width* 0.024),
// child: Text('Q' + (_currentIndex +1).toString() +'.',
// style: TextStyle(
// fontSize: width*0.06,
// fontWeight: FontWeight.bold,
// ),
// ) ,
          ),
          Container(
            width: width * 0.9,
// padding: EdgeInsets.only(top: 1),
            child: Text(
              '어제 전화한 사람은 ' + '             ' + '누구인가요? ',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gosan',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            children: _buildCandidates(width, quiz),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCandidates(double width, Quiz quiz) {
    List<Widget> _children = [];
    for (int i = 0; i < 5; i++) {
      _children.add(
        CandWidget(
          index: i,
          text: (i + 1).toString() + '  ' + quiz.candidates[i],
          width: width,
          answerState: _answerState[i],
          tap: () {
            setState(() {
              for (int j = 0; j < 5; j++) {
                if (j == i) {
                  _answerState[i] = true;
                  _answers[_currentIndex] = j;
                } else {
                  _answerState[j] = false;
                }
              }
            });
          },
        ),
      );
      _children.add(
        Padding(
          padding: EdgeInsets.all(width * 0.02),
        ),
      );
    }
    return _children;
  }
}

// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:chimap_quiz1/Model/model.quiz.dart';
// import 'package:chimap_quiz1/Widget/widget_candidate.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
//
// class QuizScreen extends StatefulWidget {
// List<Quiz> quizs;
// QuizScreen({required this.quizs});
//
// @override
// _QuizScreenState createState() => _QuizScreenState();
// }
//
// class _QuizScreenState extends State<QuizScreen> {
//
// List<Quiz> qui = [
// Quiz.fromMap({
// 'title': 'test',
// 'candidates' : ['박성희','김성희','이성희','정성희','숭숭희'],
// 'answer' : 0
// }),
// Quiz.fromMap({
// 'title': 'test',
// 'candidates' : ['박성희','김성희','이성희','정성희','숭숭희'],
// 'answer' : 1
// }),
// Quiz.fromMap({
// 'title': 'test',
// 'candidates' : ['박성희','김성희','이성희','정성희','숭숭희'],
// 'answer' : 2
// }),
// ];
//
//
//
// List<int> _answers = [-1 , -1, -1];
// List<bool> _answerState = [false,false, false, false,false];
// int _currentIndex = 0;
//
//
// @override
// Widget build(BuildContext context) {
// Size screenSize = MediaQuery.of(context).size;
// double width = screenSize.width;
// double height = screenSize.height;
//
// return SafeArea (
//
// child: Scaffold(
//   appBar: AppBar(
//   title : Text('문제 '),
//   backgroundColor: Color(0xFFFFCAB0)),
//   backgroundColor: Colors.white,
//   body: Center(
//   child: Container(
//   decoration: BoxDecoration (
//   borderRadius: BorderRadius.circular(30),
//   border: Border.all(color: Color(0xFFFFCAB0)),
//   ),
//   width: width * 0.85,
//   height: height * 0.7,
//
//     child: Swiper(
//     physics: NeverScrollableScrollPhysics(),
//     loop: false,
//     itemCount : qui.length,
//     itemBuilder: (BuildContext context, int index){
//     return _buildQuizCard(qui[index],width,height);
//          }
//         ),
//        ),
//       ),
//     ),
//   );
// }
//
// Widget _buildQuizCard(Quiz quiz, double width, double height) {
//
//
// return Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// border: Border.all(color: Colors.white),
// // color: Colors.black
// ),
//   child: Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: <Widget> [
//   Container(
//     padding: EdgeInsets.fromLTRB(0,width*0.024, 0, width* 0.024),
//       child: Text('Q' + (_currentIndex +1).toString() +'.',
//       style: TextStyle(
//       fontSize: width*0.06,
//       fontWeight: FontWeight.bold,
//     ),
//   ) ,
// ),
//   Container(
//   width: width * 0.8,
//   padding: EdgeInsets.only(top: width*0.000000002),
//   child:Text('어제 전화한 사람은 '+'             '+'누구인가요? ',
//   textAlign: TextAlign.center,
//   maxLines:2,
//   style: TextStyle(
//   fontSize: width * 0.068,
//   fontWeight: FontWeight.bold,
//   ),
//   ),
// ),
//   Expanded(
//     child: Container(),
// ),
//        Column(children: _buildCandidates(width, quiz),),
//     ],
//     ),
//   );
// }
//
// List<Widget> _buildCandidates(double width,Quiz quiz) {
//   List<Widget> _children = [];
//   for(int i=0; i<5; i++) {
//   _children.add(
//
//   CandWidget(
//   index: i,
//   text: (i+1).toString()+'  '+quiz.candidates[i],
//   width: width,
//   answerState: _answerState[i],
//   tap: () {
//   setState(() {
//     for(int j=0; j<5; j++) {
//     if(j==i ) {
//       _answerState[i] = true;
//       _answers[_currentIndex] = j;
//
//     }
//       else {
//       _answerState[j] = false;
//       }
//       }
//     });
//     },
//   ),
// );
//
//   _children.add(
//     Padding (
//       padding: EdgeInsets.all(width * 0.02),
//       ),
//     );
//     }
//     return _children;
//     }
// }