import 'LessonDetail.dart';
import '../content/api.dart';
import 'package:flutter/material.dart';


class LessonsSubPage extends StatelessWidget {
  final String category;
  LessonsSubPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons', textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getGrammarLessons(category),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> lessons = snapshot.data!;
            return ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Column(children: [
                  ListTile(
                    title: Text(lessons[index]['title']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonDetailsPage(
                            lesson: lessons[index],
                          ),
                        ),
                      );
                    },
                  )
                ]));
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
