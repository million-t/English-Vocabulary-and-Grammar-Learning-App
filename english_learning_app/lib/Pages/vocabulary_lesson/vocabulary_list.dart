import 'package:flutter_application_1/Pages/vocabulary_lesson/search.dart';

import 'vocabulary_details.dart';
import '../../content/api.dart';

import 'package:flutter/material.dart';

class VocabularyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabulary', textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getVocabularies(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> words = snapshot.data!;
            return ListView.builder(
              itemCount: words.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Column(children: [
                  ListTile(
                    title: Text(words[index]['word']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VocabularyDetailsPage(
                            word: words[index],
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
