import 'package:chimap_quiz1/Model/model.quiz.dart';
import 'package:chimap_quiz1/screen/screen_quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test',
      'candidates' : ['a','b','c','d'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates' : ['a','b','c','d'],
      'answer' : 1
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates' : ['a','b','c','d'],
      'answer' : 2
    }),
  ];
  @override

  //퀴즈 풀기 버튼을 누를때 퀴즈를 가져오도록

  // Container productsetting() {
  //   return Container(
  //     height: 178,
  //     margin: const EdgeInsets.fromLTRB(20,30,20,30),
  //     padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
  //     decoration: BoxDecoration(
  //       color: Color(0xFF8EB680),borderRadius: BorderRadius.circle(15)
  //     ),
  //     child: Row(
  //       children: [
  //         Column(
  //           children: [
  //             Container(
  //               width:100,
  //               height: 100,
  //               decoration : const BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: Color(0xFFB2DE88),
  //               ),
  //               TextButton(
  //                 onPressed: () async {
  //
  //                 },
  //                 chidl: const Text(
  //                   "예",
  //                   style: TextStyle(
  //                     color: Colors.blank, fontWeight: FontWeight.bold
  //
  //                   )
  //                 ),
  //               )
  //             ],
  //           )
  //       ]
  //     )
  //   );
  // }
  // }
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
            // color: Colors.black
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('통화 질문'),
          backgroundColor: Color(0xFFFFCAB0),
          leading: Container(),
        ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              // Center(
              //   child: Image.asset(
              //     ''
              //     width: width*0.8
              //   )
              // ),
            Padding(
                padding: EdgeInsets.all(width * 0.024),
              ),
            Text(
              '문제를 풀어보시겠습니까?'
              //   style: TextStyle(
              //   fontSize: width * 0.065,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Container(
            padding: EdgeInsets.only(bottom: width* 0.036),
            child: Center(
              child: ButtonTheme(
                minWidth: width * 0.8,
                height: height * 0.05,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    '문제 풀기',
                    style: TextStyle(color: Colors.white),
                  ),
                  //color: Color(0xFFFFCAB0),
                    onPressed: () {
                      Get.toNamed('/home/quiz');
                    } ,
                  ),
                ),
              ),
            )
          ],
          ),
        ),
        ),
    );
  }
}

