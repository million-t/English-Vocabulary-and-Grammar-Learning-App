// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper.internal();
//   factory DatabaseHelper() => _instance;

//   static Database? _db;

//   Future<Database?> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }

//   DatabaseHelper.internal();

//   Future<Database> initDb() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, 'language_app.db');

//     var ourDb = await openDatabase(path,
//         version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
//     return ourDb;
//   }

//   void _onCreate(Database db, int version) async {
//     await db
//         .execute('CREATE TABLE lessons (id INTEGER PRIMARY KEY, title TEXT)');
//     await db
//         .execute('CREATE TABLE exercises (id INTEGER PRIMARY KEY, title TEXT)');
//     await db
//         .execute('CREATE TABLE quizzes (id INTEGER PRIMARY KEY, title TEXT)');
//     await db.execute('CREATE TABLE questions('
//         'id INTEGER PRIMARY KEY,'
//         'exercise_id INTEGER,'
//         'question TEXT,'
//         'option_1 TEXT,'
//         'option_2 TEXT,'
//         'option_3 TEXT,'
//         'option_4 TEXT,'
//         'correct_answer INTEGER)');

//     // Insert sample data
//     await db.rawInsert(
//         "INSERT INTO lessons (title) VALUES ('Lesson 1: Greetings')");
//     await db
//         .rawInsert("INSERT INTO lessons (title) VALUES ('Lesson 2: Numbers')");
//     await db.rawInsert(
//         "INSERT INTO exercises (title) VALUES ('Exercise 1: Verb Conjugation')");
//     await db.rawInsert(
//         "INSERT INTO exercises (title) VALUES ('Exercise 2: Sentence Translation')");
//     await db
//         .rawInsert("INSERT INTO quizzes (title) VALUES ('Quiz 1: Vocabulary')");
//     await db
//         .rawInsert("INSERT INTO quizzes (title) VALUES ('Quiz 2: Grammar')");

//     // Insert sample questions into the questions table for Quiz 1
//     await db.rawInsert(
//         'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//         'VALUES(1, "Question 1", "Option 1", "Option 2", "Option 3", "Option 4", 1)');
//     await db.rawInsert(
//         'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//         'VALUES(1, "Question 2", "Option 1", "Option 2", "Option 3", "Option 4", 2)');
//     await db.rawInsert(
//         'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//         'VALUES(1, "Question 3", "Option 1", "Option 2", "Option 3", "Option 4", 3)');
//     await db.rawInsert(
//         'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//         'VALUES(1, "Question 4", "Option 1", "Option 2", "Option 3", "Option 4", 4)');
//     await db.rawInsert(
//         'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//         'VALUES(1, "Question 5", "Option 1", "Option 2", "Option 3", "Option 4", 1)');
//   }

//   Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     if (oldVersion < 2) {
//       // Drop the existing 'questions' table if it exists
//       await db.execute('DROP TABLE IF EXISTS questions');

//       // Recreate the 'questions' table with the correct schema
//       await db.execute('CREATE TABLE questions('
//           'id INTEGER PRIMARY KEY,'
//           'exercise_id INTEGER,'
//           'question TEXT,'
//           'option_1 TEXT,'
//           'option_2 TEXT,'
//           'option_3 TEXT,'
//           'option_4 TEXT,'
//           'correct_answer INTEGER)');

//       // Insert sample questions into the questions table for Quiz 1
//       await db.rawInsert(
//           'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//           'VALUES(1, "Question 1", "Option 1", "Option 2", "Option 3", "Option 4", 1)');
//       await db.rawInsert(
//           'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//           'VALUES(1, "Question 2", "Option 1", "Option 2", "Option 3", "Option 4", 2)');
//       await db.rawInsert(
//           'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//           'VALUES(1, "Question 3", "Option 1", "Option 2", "Option 3", "Option 4", 3)');
//       await db.rawInsert(
//           'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//           'VALUES(1, "Question 4", "Option 1", "Option 2", "Option 3", "Option 4", 4)');
//       await db.rawInsert(
//           'INSERT INTO questions(exercise_id, question, option_1, option_2, option_3, option_4, correct_answer) '
//           'VALUES(1, "Question 5", "Option 1", "Option 2", "Option 3", "Option 4", 1)');
//     }
//   }

//   Future<List<Map<String, dynamic>>> getLessons() async {
//     Database? dbClient = await db;
//     return await dbClient!.query('lessons');
//   }

//   Future<int> insertLesson(String title) async {
//     Database? dbClient = await db;
//     return await dbClient!.insert('lessons', {'title': title});
//   }

//   Future<List<Map<String, dynamic>>> getExercises() async {
//     Database? dbClient = await db;
//     return await dbClient!.query('exercises');
//   }

//   Future<int> insertExercise(String title) async {
//     Database? dbClient = await db;
//     return await dbClient!.insert('exercises', {'title': title});
//   }

//   Future<List<Map<String, dynamic>>> getQuizzes() async {
//     Database? dbClient = await db;
//     return await dbClient!.query('quizzes');
//   }

//   Future<int> insertQuiz(String title) async {
//     Database? dbClient = await db;
//     return await dbClient!.insert('quizzes', {'title': title});
//   }

//   Future<List<Map<String, dynamic>>> getQuestionsByQuizId(int quizId) async {
//     Database? dbClient = await db;
//     return await dbClient!
//         .query('questions', where: 'quiz_id = ?', whereArgs: [quizId]);
//   }

//   Future<List<Map<String, dynamic>>> getQuestionsByExerciseId(
//       int exerciseId) async {
//     Database? dbClient = await db;
//     return await dbClient!
//         .query('questions', where: 'exercise_id = ?', whereArgs: [exerciseId]);
//   }
// }
