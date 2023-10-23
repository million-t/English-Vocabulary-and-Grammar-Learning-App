import 'package:flutter_application_1/Pages/lessonListPage.dart';
import 'package:flutter/material.dart';


class LessonsCategoryPage extends StatelessWidget {
  // final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons', textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16), // Added spacing

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                Expanded(
                  child:
                   GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LessonsSubPage(category: "parts of speech",),),
                            );
                          },
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose, // Use FlexFit.loose for flexible children
                                  child: Image.asset(
                                    'lib/images/parts.jpg', // Replace with your image asset path
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Parts of speech',
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
                ),
                SizedBox(width: 16), // Added spacing
                // sentence structure
                // Sentence Structure
                Expanded(
                  child:
                   GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LessonsSubPage(category: "sentence structure",),),
                            );
                          },
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose, // Use FlexFit.loose for flexible children
                                  child: Image.asset(
                                    'lib/images/sentence.jpg', // Replace with your image asset path
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Sentence Structure',
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
                ),
              ],
            ),

            SizedBox(height: 16), // Added spacing
// VerbForms
// verb forms
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child:
                   GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LessonsSubPage(category: "verb forms",),),
                            );
                          },
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose, // Use FlexFit.loose for flexible children
                                  child: Image.asset(
                                    'lib/images/verb.jpg', // Replace with your image asset path
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'VerbForms',
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
                ),
                SizedBox(width: 16), // Added spacing
                // tenses
                Expanded(
                  child:
                   GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LessonsSubPage(category: "tenses",),),
                            );
                          },
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose, // Use FlexFit.loose for flexible children
                                  child: Image.asset(
                                    'lib/images/tense.jpg', // Replace with your image asset path
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Tenses',
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
                ),
              ],
            ),

            SizedBox(height: 16), // Added spacing
// Sentence Types
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child:
                   GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LessonsSubPage(category: "Sentence Types",),),
                            );
                          },
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose, // Use FlexFit.loose for flexible children
                                  child: Image.asset(
                                    'lib/images/sentype.jpg', // Replace with your image asset path
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'SentenceType',
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
                ),
                SizedBox(width: 16), // Added spacing
                // agreement
                Expanded(
                  child:
                   GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LessonsSubPage(category: "agreement",),),
                            );
                          },
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose, // Use FlexFit.loose for flexible children
                                  child: Image.asset(
                                    'lib/images/agree.webp', // Replace with your image asset path
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Agreement',
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
                ),
              ],
            ),

            SizedBox(height: 16), // Added spacing
// articles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child:
                   GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LessonsSubPage(category: "articles",),),
                            );
                          },
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose, // Use FlexFit.loose for flexible children
                                  child: Image.asset(
                                    'lib/images/article.jpg', // Replace with your image asset path
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Articles',
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
                ),
                SizedBox(width: 16), // Added spacing
                Expanded(
                  child: Container(), // Empty container for spacing
                ),
              ],
            ),

            SizedBox(height: 16), // Added spacing
          ],
        ),
      ),
    );
  }
}
