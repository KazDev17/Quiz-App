// PAGE 2
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  //the datatype of the startQuiz method pointer we are referencing from the QuizScreen widget is a Function
  //const QuestionsScreen(void Function() startQuiz, {super.key}); //we can't use this in this class because we haven't stored it yet (this)
  const StartScreen(this.startQuiz, {super.key});

  final void Function()
      startQuiz; //this void Function() passes no arguments because our pointer switchScreen also passes no arguments
  //defining the function as a variable here also makes us to be able to call it in the onPressed argument that only accepts functions

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //for the column widget to take a minimal vertical space
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(140, 255, 255, 255),
          ),
          //wrap image.asset with a widget called Opacity

          // Opacity(
          //   opacity: 0.5, //takes in only values 0.0 - 1.0 with 0.0 being fully transparent/ hover your mouse on opacity to see this info
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter The Fun Way',
            style: GoogleFonts.hammersmithOne( 
              fontSize: 24,
              color: const Color.fromARGB(255, 169, 114, 232),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //add a button with visible borders.
          //we use oitlinedbutton
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: startQuiz,
            // onPressed: () {
            //   startQuiz();
            // }, //anonymous function
            icon: const Icon(Icons.arrow_right_alt),
            //label was originally child. had to change because of the '.icon' we added to the constructor function OutlinedButton
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
