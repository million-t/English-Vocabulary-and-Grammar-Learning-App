import '../content/api.dart';
import 'package:flutter/material.dart';


class ExerciseDetailsPage extends StatefulWidget {
  final String type;

  ExerciseDetailsPage({required this.type});

  @override
  _ExerciseDetailsPageState createState() => _ExerciseDetailsPageState(type: type);
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {

  final String type;

  _ExerciseDetailsPageState({required this.type});
  late List<dynamic> questions = [];
  List<int> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  void fetchQuestions() async {
    questions = await getExercises(type);
    selectedAnswers = List<int>.filled(questions.length, -1);
    setState(() {});
  }

  int getCorrectAnswersCount() {
    int count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i]['answer']) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Details', textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 58, 55, 55),
      ),
      body: questions.isNotEmpty
          ? ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          questions[index]['question'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Column(
                          children: List.generate(4, (optionIndex) {
                            String option =
                                questions[index]["alternatives"][optionIndex];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Radio<int>(
                                value: optionIndex,
                                groupValue: selectedAnswers[index],
                                onChanged: (value) {
                                  setState(() {
                                    selectedAnswers[index] = value!;
                                  });
                                },
                              ),
                              title: Text(option),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          int correctAnswersCount = getCorrectAnswersCount();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Exercise Summary'),
                content: Text(
                    'Number of correct answers: $correctAnswersCount out of ${questions.length}'),
                actions: [
                  ElevatedButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        label: Text('Finish'),
        icon: Icon(Icons.done),
      ),
    );
  }
}
