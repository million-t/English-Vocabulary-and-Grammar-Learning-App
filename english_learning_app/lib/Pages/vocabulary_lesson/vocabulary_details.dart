import 'package:flutter/material.dart';

class VocabularyDetailsPage extends StatelessWidget {
  final dynamic word;

  VocabularyDetailsPage({required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word["word"], textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Divider(
              thickness: 2.0,
            ),
            SizedBox(height: 5),
            Text(word["phonetic_transcription"]),
            Text(word['part_of_speech'],
                style: TextStyle(fontWeight: FontWeight.bold)),
            Divider(
              thickness: 2.0,
            ),
            SizedBox(height: 16),
            Text(word["meaning"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            SizedBox(height: 8),
            const Text("Examples:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            for (var example in word['examples']) Text('  • $example'),
          ])),
    );
  }
}
