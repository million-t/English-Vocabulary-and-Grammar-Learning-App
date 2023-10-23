import 'package:flutter/material.dart';


class LessonDetailsPage extends StatelessWidget {
  final dynamic lesson;

  LessonDetailsPage({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson["title"], textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Divider(
              thickness: 2.0,
            ),
            Text(lesson["definition"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            Divider(
              thickness: 2.0,
            ),
            SizedBox(height: 16.0),
            Text(lesson["explanation"], style: TextStyle(fontSize: 15.0)),
            SizedBox(height: 8),
            const Text("Examples:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            for (var example in lesson['examples'])
              Text('  • $example', style: TextStyle(fontSize: 15.0))
          ])),
    );
  }
}
