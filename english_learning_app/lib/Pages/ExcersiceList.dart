import 'package:flutter_application_1/widget/bottom.dart';
import 'ExcersiceDetail.dart';
import 'package:flutter/material.dart';


class ExercisesPage extends StatelessWidget {
  // final DatabaseHelper databaseHelper = DatabaseHelper();
// ExerciseDetailsPage(type: "grammar",)
// ExerciseDetailsPage(type: "vocabulary",),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz', textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
      ),
      body: Column(children: [
        GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ExerciseDetailsPage(type: "grammar",)),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose, // Use FlexFit.loose for flexible children
              child: Image.asset(
                'lib/graquiz.jpg', // Replace with your image asset path
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Grammar Quiz',
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
          MaterialPageRoute(builder: (context) => ExerciseDetailsPage(type: "vocabulary",),),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose, // Use FlexFit.loose for flexible children
              child: Image.asset(
                'lib/voquiz.jpg', // Replace with your image asset path
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Vocabulary Quiz',
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
        bottomNavigationBar: Bottomnav(1),
    );
  }
}


