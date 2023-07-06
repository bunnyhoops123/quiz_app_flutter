import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  // padding: const EdgeInsets.all(13),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: data['correct_answer'] == data['user_answer']
                          ? Colors.green.shade400
                          : Colors.red.shade400,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1)
                          .toString(), //type casting cause dart knows its object but not int specifically.
                    ),
                  ),
                ),
                Expanded(
                  //Becasue render overflow, fills column only upto widht of row or else infinite
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Color.fromRGBO(238, 109, 77, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
