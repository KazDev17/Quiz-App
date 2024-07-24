//PAGE 5.2
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    //isCorrectAnswer is the pointer to determine right and wrong in the number
    //this is used in question_identifier
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    //wrapped Row in padding so as to add spacing between summary item data
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        //CrossAxisAlignment.start - makes the numbers aligned to the top of the row
        //ignoring it just makes the numbers seem centered rather than on the same line as the question
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            //questionIndex: itemData['question_index'] as int,
            questionIndex: itemData['questions_index']as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              //this helps align the question, chosenAnswer and correct answer to the left, as opposed to everything becoming jumbled
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [//HERE IS THE VERTICAL STRUCTURE OF THE RESULTS SCREEN
                Text(
                  //remember this is how we call values of its respective key pair
                  itemData['questions'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  //remember this is how we call values of its respective key pair
                  itemData['user_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252),
                  ),
                ),
                Text(
                  //remember this is how we call values of its respective key pair
                  itemData['correct_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
