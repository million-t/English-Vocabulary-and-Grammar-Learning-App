import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<dynamic>> getGrammarExercises() async {
  final jsonString = await rootBundle.loadString('lib/content/exercise.json');
  final List<dynamic> jsonData = jsonDecode(jsonString)
      .where((question) => question["type"] == "vocabulary")
      .toList();
  return jsonData;
}

Future<List<dynamic>> getExercises(String type) async {
  final jsonString = await rootBundle.loadString('lib/content/exercise.json');
  final List<dynamic> jsonData = jsonDecode(jsonString)
      .where((question) => question["type"] == type)
      .toList();
  jsonData.shuffle();

  return jsonData.sublist(0, 5);
}

Future<List<dynamic>> getVocabularyExercises() async {
  final jsonString = await rootBundle.loadString('lib/content/exercise.json');
  final List<dynamic> jsonData = jsonDecode(jsonString)
      .where((question) => question["type"] == "vocabulary")
      .toList();
  return jsonData;
}

Future<List<dynamic>> getGrammarLessons(String category) async {
  final jsonString = await rootBundle.loadString('lib/content/grammar.json');
  final List<dynamic> jsonData = jsonDecode(jsonString)
      .where((lesson) => lesson["category"] == category)
      .toList();
  return jsonData;
}

Future<List<dynamic>> getVocabularies() async {
  final jsonString = await rootBundle.loadString('lib/content/vocabulary.json');
  final List<dynamic> jsonData = jsonDecode(jsonString);
  return jsonData;
}

Future<List<dynamic>> getVocabularyQuizes() async {
  final jsonString = await rootBundle.loadString('lib/content/quizes.json');
  final List<dynamic> jsonData = jsonDecode(jsonString)
      .where((question) => question["type"] == "vocabulary")
      .toList();

  jsonData.shuffle();

  return jsonData.sublist(0, 5);
}

Future<List<dynamic>> getQuizes(String type) async {
  final jsonString = await rootBundle.loadString('lib/content/quizes.json');
  final List<dynamic> jsonData = jsonDecode(jsonString)
      .where((question) => question["type"] == type)
      .toList();
  return jsonData;
  
}

Future<List<dynamic>> getGrammarQuizes() async {
  final jsonString = await rootBundle.loadString('lib/content/quizes.json');
  final List<dynamic> jsonData = jsonDecode(jsonString)
      .where((question) => question["type"] == "grammar")
      .toList();

  jsonData.shuffle();

  return jsonData.sublist(0, 5);
}
