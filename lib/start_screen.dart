import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 1,
            child: Image.asset('assets/images/quizlogo.png',
                color:const  Color.fromARGB(249, 255, 238, 187)),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.robotoSlab(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz //why ()?
            ,
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                padding: const EdgeInsets.all(10),
                foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              //label for .icon in place of child
              'START QUIZ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
