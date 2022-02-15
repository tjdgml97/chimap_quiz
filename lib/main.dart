import 'package:chimap_quiz1/screen/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/screen_quiz.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: new ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFFFBD9D)),
      ),
      title: 'My Quiz App',
      initialRoute: '/home/quiz',
        getPages: [
          GetPage(
              name: '/home',
              page: () => HomeScreen(),
          ),
          GetPage(
            name: '/home/quiz',
            page: () => QuizScreen(quizs: [],),
          ),
        ],
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}

