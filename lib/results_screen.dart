import 'package:adv_basics/data/dummy_questions.dart';
//import 'package:adv_basics/questions%20summary/old_questions_summary.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//PAGE 5

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart}); //all named parameters 

  final List<String> chosenAnswers;
  final void Function() onRestart;

//NEW METHOD FOR MAPPING KEYS TO VALUES

  List<Map<String, Object>> get summaryData {
    //getSummaryData should return a list of maps i.e keys and values.
    //like QuizQuestion['What are the main building blocks of Flutter UIs?'] : 'Widgets'
    final List<Map<String, Object>> summary = [];

/* to populate the list
   there are 6 number of answers

*/
    for (var i = 0; i < chosenAnswers.length; i++) {
      //({}) = is how we create map values
      summary.add(
        {
          //with reference to dummy data, we start from 0
          'questions_index': i,
          //this denotes questions = questions_index, which is 0 as gotten from the value of i in the for loop which points to index 0 of the QuizQuestion
          //taking in parameters (this.text, this.answers)
          'questions': questions[i].text,
          //It was a good call to not shuffle the answers list in the dummy data as we always want the first answer in the dummy data to be the right answer.
          //remember QuizQuestion taking in parameters (this.text, this.answers)
          'correct_answer': questions[i].answers[0],
          //This is pointing to the answers already selected by the user from the screenWidget = ResultsScreen( chosenAnswers: selectedAnswers) in quiz.dart.
          //selectedAnswers is how we store those selected answers the user chose
          'user_answer': chosenAnswers[i],
          //ALL THESE DETAILS ARE FOR THE SUMMARY (as denoted in the summary.add). THIS TI TO HAVE A SUMMARY LIST SO WE CAN OUTPUT OUR SUMMARY STATISTICS
        },
      );
    }

    return summary; //new map to summaryData
  }

  @override
  Widget build(BuildContext context) {
    //rendered redundant cause of our use of a Getter (get)
    // final summaryData =
    //     getSummaryData(); //stores the resukts of getSummaryData() so we can use it here
    final numTotalQuestions = questions.length; //use dummy data
    final numCorrectQuestions = summaryData.where((data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length; //use summary data to find this out. .where is also how we check chosenAnswers against correct answers as decided in 'correct_answer': questions[i].answers[0]

    return SizedBox(
      /*double.infinity is a special value which simply means use as much width as you can, be as wide as possible.
        we copied and pasted from the questions_screen.dart. we want this to make use of as much width as possible
      */
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        //margin helps us add spaces between the result options
        child: Column(
          //to center the items along the main axis.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //This text widget is to tell how many questions have been answered correctly
            //AT THE TOP OF THE SCREEN I.E COLUMN 1 ROW A
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 208, 46, 178),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            //here lies our statistics of rthe summary
            const SizedBox(
              height: 30,
            ),
            /*
              here comes the scrollable list of questions, where we have the question, the correct answer, and the chosen answer.
            */
            //QuestionsSummary(getSummaryData()),
            //COLUMN 1 ROW B
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            /*
              here comes that button that can be used to restart the quiz.
            */
            //COLUMN 1 ROW C
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              //child: const Text('Restart Quiz'),
              icon: const Icon(Icons.restart_alt_outlined),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
