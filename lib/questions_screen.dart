import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {super.key,
      required this.onSelectAnswer}); //why in widget class not in state class

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionNumber = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);          
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionNumber];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.robotoSlab(
                  fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // ... adds the elements of the list to the children list instead of a list being passed ot chlidren list
            //converts items of original list to new list after function on each item
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return AnswerButton(item, () {    //anonymous funsction or else it will get triggered when button created
                  answerQuestion(item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
