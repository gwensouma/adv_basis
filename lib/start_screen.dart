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
        spacing: 20,
        children: [
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset('assets/images/quiz-logo.png', width: 300),
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 40),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(255, 237, 223, 252),
            ),
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(),
              ),
              side: WidgetStateProperty.all<BorderSide>(
                BorderSide(color: Color.fromRGBO(249, 156, 59, 1)),
              ),
            ),
            icon: Icon(Icons.arrow_right_alt, color: Colors.white),
            label: Text('Start Quiz', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
