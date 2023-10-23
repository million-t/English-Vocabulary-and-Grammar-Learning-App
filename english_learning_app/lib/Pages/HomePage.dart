import 'dart:io';
import 'package:flutter_application_1/Pages/quizCategory.dart';

import 'ExcersiceList.dart';
import 'LessonPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LanguageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Learning App',
      theme: ThemeData(
        // Customize the app's theme here
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LessonPage(),
        '/exercises': (context) => ExercisesPage(),
        '/quizzes': (context) => QuizCategory(),
      },
    );
  }
}
