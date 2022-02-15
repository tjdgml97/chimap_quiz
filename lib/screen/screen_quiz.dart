import 'package:auto_size_text/auto_size_text.dart';
import 'package:chimap_quiz1/Model/model.quiz.dart';
import 'package:chimap_quiz1/Widget/widget_candidate.dart';
import 'package:chimap_quiz1/screen/screen_result.dart';
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
      'candidates': ['기미미미', '이이이이', '아아아ㅏㅇ', 'ㅁㅁ미미', '숭숭희'],
      'answer': 1
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['바ㅏㅏ희', 'ㅁㅁㅁ희', '이', '정성희', '숭숭희'],
      'answer': 2
    }),
  ];

  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false, false];
  int _currentIndex = 0;
  SwiperController _controller = SwiperController();
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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
// decoration: BoxDecoration (
// borderRadius: BorderRadius.circular(30),
// border: Border.all(color: Colors.black),
// ),
              width: width * 0.85,
              height: height * 0.75,
              child: Swiper(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  loop: false,
                  itemCount: qui.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildQuizCard(qui[index], width, height);
                  }),
            ),
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
//           Container(
// // padding: EdgeInsets.fromLTRB(0,width*0.024, 0, width* 0.024),
// // child: Text('Q' + (_currentIndex +1).toString() +'.',
// // style: TextStyle(
// // fontSize: width*0.06,
// // fontWeight: FontWeight.bold,
// // ),
// // ) ,
//               ),
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
//
          Container(
            // padding: EdgeInsets.all(width * 0.02),
            child: Center(
              child: ButtonTheme(
                buttonColor: Colors.black,
                minWidth: width * 0.5,
                height: height * 0.05,
                shape : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child:ElevatedButton(
                  child: _currentIndex == widget.quizs.length -1
                      ? Text('결과보기',
                  style: TextStyle(
                    color: Colors.white,
                  ),)
                      : Text('다음문제',
                    style: TextStyle(
                      color: Colors.black,
                    ),),
                  onPressed: _answers[_currentIndex] == -1 //_answers[_currentIndex] -1 ? null : () {
                      ? null
                      : () {
                    if(_currentIndex == widget.quizs.length -1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>ResultScreen(
                              answers: _answers,
                              quizs: widget.quizs,
                          ),
                        ),
                      );
                    }else {

                      // while(true) {
                      //   if (_answers[_currentIndex] == quiz.answer) {
                      //     _answerState = [false, false, false, false, false ];
                      //     _currentIndex += 1;
                      //     _controller.next();
                      //     break;
                      //
                      //   }
                      //   else {
                      //     quiz.removeAt(0);
                      //     quiz[0].remove(3);	// 3번 인덱스의 값을 지운다.
                      //
                      //
                      //   }
                      // }

                     // for(int i=0; i<3; i++) {
                     //
                     //   while(true) {
                     //     if( _answers[_currentIndex]==);
                     //
                     //     )
                     //   }
                     //   do {
                     //
                     //
                     //   } while(true);
                     // }


                      //여기 알고리즘 짜서 넣으면 될듯
                      //여기서 else 란 - 마지막 문제가 아닐 경우임!!
                      //초기값 설정 - 만약 여기서 loop 돌 생각이면 - 초기값 설정 안하는게 나을듯
                      // answer값이 - 같을경우에는 - 끝내고 . 아닐경우 - 그 정답을 배열? 에서 삭제한뒤 - linkedlist?
                     // 그거 뺴고 for 문 덜 돌려서 넣기
                     //  if()
                      _answerState = [false, false, false, false, false];
                      _currentIndex += 1;
                      _controller.next();
                    }
                  },
                ),
              ),
            ),
          )
          //
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
                  print(_answers[_currentIndex]);
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