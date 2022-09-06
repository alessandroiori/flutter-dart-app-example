// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/bmi_screen.dart';
import 'package:globo_fitness/screens/intro_screen.dart';


// course: https://app.pluralsight.com/library/courses/getting-started-flutter/table-of-contents
// img: https://unsplash.com/
// flutter package: https://pub.dev/
// online flutter adn dart console: https://dartpad.dev/?
// Weather API: https://openweathermap.org/api

void main() {
  runApp(
      GlobeApp()); //show on the screen the widgeds that we put in the method
}
//shortcut: stless
class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi':(context) => BmiScreen(),
      },
      initialRoute: '/',
      //home: IntroScreen()
      );
  }
}
