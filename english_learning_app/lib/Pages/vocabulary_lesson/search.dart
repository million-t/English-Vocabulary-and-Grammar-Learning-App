import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  List<Map<String, dynamic>>? _meanings;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _fetchWordData() async {
    final word = _controller.text.trim();

    if (word.isNotEmpty) {
      try {
        final data = await fetchWordData(word);
        setState(() {
          _meanings = data;
        });
      } catch (e) {
        print(e);
        setState(() {
          _meanings = null;
        });
      }
    } else {
      setState(() {
        _meanings = null;
      });
    }
  }

  Future<List<Map<String, dynamic>>> fetchWordData(String word) async {
    final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final meanings = json[0]['meanings'];

      return List<Map<String, dynamic>>.from(meanings.map((meaning) {
        final definition = meaning['definitions'][0]['definition'];
        final synonyms = meaning['definitions'][0]['synonyms'];
        final partOfSpeech = meaning['partOfSpeech'];
        final examples = meaning['definitions'][0]['examples'];

        return {
          'definition': definition,
          'synonyms': synonyms != null
              ? List<String>.from(synonyms.map((synonym) => synonym['text']))
              : null,
          'partOfSpeech': partOfSpeech,
          'examples': examples != null
              ? List<String>.from(examples.map((example) => example['text']))
              : null,
        };
      }));
    } else {
      throw Exception('Failed to fetch word data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary Search', textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a word',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _fetchWordData,
                ),
              ),
            ),
            SizedBox(height: 16),
            if (_meanings != null && _meanings!.isNotEmpty) ...[
              for (final meaning in _meanings!) ...[
                SizedBox(height: 16),
                if (meaning['partOfSpeech'] != null) ...[
                  Text(meaning['partOfSpeech'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
                SizedBox(height: 8),
                Text(meaning['definition']),
                if (meaning['synonyms'] != null &&
                    meaning['synonyms'].isNotEmpty) ...[
                  SizedBox(height: 8),
                  Text('Synonyms: ${meaning['synonyms'].join(', ')}'),
                ],
                if (meaning['examples'] != null &&
                    meaning['examples'].isNotEmpty) ...[
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: meaning['examples']
                        .map((example) => Text('• $example'))
                        .toList(),
                  ),
                ],
              ],
            ] else ...[
              Text('Enter a word to search'),
            ],
          ],
        ),
      ),
    );
  }
}
