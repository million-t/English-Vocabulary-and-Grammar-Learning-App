import 'package:flutter_application_1/Pages/ExcersiceList.dart';
import 'package:flutter_application_1/Pages/LessonCatagory.dart';
import 'package:flutter_application_1/Pages/quizCategory.dart';
import 'package:flutter_application_1/Pages/vocabulary_lesson/vocabulary_list.dart';
import 'package:flutter_application_1/widget/bottom.dart';
import 'package:flutter/material.dart';



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
class LessonPage extends StatefulWidget {
  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lessons', textAlign: TextAlign.center),
          backgroundColor: Color.fromARGB(255, 58, 55, 55),
        ),
        body: Column(children: [
          GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LessonsCategoryPage()),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose, // Use FlexFit.loose for flexible children
              child: Image.asset(
                'lib/grgrg.webp', // Replace with your image asset path
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Grammar',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VocabularyList()),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose, // Use FlexFit.loose for flexible children
              child: Image.asset(
                'lib/vovv.jpg', // Replace with your image asset path
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Vocabulary',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
        ]

        ),
        bottomNavigationBar: Bottomnav(0),

      
        );
  }
}
