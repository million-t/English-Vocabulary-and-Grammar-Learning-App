import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/QuizList.dart';
import 'package:flutter_application_1/widget/bottom.dart';


class QuizCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise', textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
      ),
      body: Column(children: [
        GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizDetailsPage(type: "grammar",)),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose, // Use FlexFit.loose for flexible children
              child: Image.asset(
                'lib/graexc.jpg', // Replace with your image asset path
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Grammar Exersice',
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
          MaterialPageRoute(builder: (context) => QuizDetailsPage(type: "vocabulary",),),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose, // Use FlexFit.loose for flexible children
              child: Image.asset(
                'lib/vocexec.jpg', // Replace with your image asset path
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Vocabulary Exercise',
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
        bottomNavigationBar: Bottomnav(2),
    );
  }
}


