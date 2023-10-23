import 'package:flutter_application_1/content/api.dart';
import 'package:flutter/material.dart';


class QuizDetailsPage extends StatefulWidget {
  final String type;

  QuizDetailsPage({required this.type});

  @override
  _QuizDetailsPageState createState() => _QuizDetailsPageState(type: type);
}

class _QuizDetailsPageState extends State<QuizDetailsPage> {
  final String type;

  _QuizDetailsPageState({required this.type});
  late List<dynamic> questions = [];
  List<int> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  void fetchQuestions() async {
    questions = await getQuizes(type);
    selectedAnswers = List<int>.filled(questions.length, -1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Details', textAlign: TextAlign.center),
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
                                questions[index]['alternatives'][optionIndex];
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
                              tileColor: selectedAnswers[index] == optionIndex
                                  ? questions[index]['answer'] == optionIndex
                                      ? Color.fromARGB(255, 184, 255, 186)
                                      : Color.fromARGB(255, 255, 162, 156)
                                  : null,
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
    );
  }
}
