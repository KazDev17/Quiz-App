//PAGE 4

import 'package:adv_basics/answer_buttonstyle.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/dummy_questions.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  //This is how we change the after an answer button has been clicked/answer has been selected.
  var currentQuestionsIndex = 0; //set to 0 so that we start with the first Question.




/*THIS FUNCTION DOES THREE THINGS
  1. Change the index and show new questions - currentQuestionsIndex++
  2. Store the response of each answer to a question - widget.onSelectAnswer(selecteddAnswers)
  3. Make sure that we don't continue incrementing this question index until we run out of questions.
*/
  //when an answer is selected, this function is to change the index and move to the next dummy data [1]
  void answerQuestion(String selecteddAnswers) {
    widget.onSelectAnswer(selecteddAnswers);
    setState(() {
      /*currentQuestionsIndex = currentQuestionsIndex + 1; //the right side exeecutes first (+1) and is stored on the left*/
      //currentQuestionsIndex += 1;
      currentQuestionsIndex++; //increments value by 1, bu this starts with 0
    });
  }

  @override
  Widget build(context) {
    /*final currentQuestion = questions[0];*/
    final currentQuestion = questions[currentQuestionsIndex]; // so this starts from 0 and then increments by 1. 
    //but this also means we would need to run the build again, hence the setState function


    //return const Text('Questions Screen');
    /*
    we of course wanna output the question text and then below that, the answers to the question.
    So, we have a couple of widgets above each other here and that of course screams for a column.
    */
//alternatively, we could just wrap Column with center and insode Column
    //use the mainAxisSize: MainAxisSize.max,
    return SizedBox(
      //double.infinity is a special value which simply means use as much width as you can, be as wide as possible.
      width: double.infinity,
      child: Container(
        //MARGIN HELPS ADD SPACES BETWEEN ANSWER OPTIONS 
        margin: const EdgeInsets.all(40),
        //had to Refractor and wrap Column with Container so we can make use of margin
        child: Column(
          //do not have to align center as double infinity has done most of the work
          //we can play around with this (MainAxisAlignment.end or .spaceAround or .spaceEvenly)
          mainAxisAlignment: MainAxisAlignment.center,
          //This provides vertical feature to the columns whh are naturally vertical
          //stretch makes it take all available space horizontally (left to right) within the SizedBox's double infinity
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text, //.text comes from the quiz_questions.dart which is a blueprint for dummy data which takes in parameters .text and .answers
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 171, 106, 233),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),

              //to align that Questions text to the center
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            //MANUALLY GENERATING THE ANSWERS BUTTON

            //button for different answers (4 possible answers per question)
            //This would be generated dynamically later on.
            //this is how we call named paramters
            //for named arguments, the position is also not important

            //ALTERNATIVE 1 - If you do not want to shuffle answers and instead make it fixed values.
            /* AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
        AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
        AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
        AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
          */

            //DYNAMICALLY GENERATING THE ANSWERS BUTTON - this whole code was just to dynamically generate an output list content
            //answers (which is a list -a list of strings, has the luxury of assessing a variety of built-in methods)
            //Map allows you to convert, to transform, you could say, the values in a list to other values (answer) or (item).
            //in this case values in list answers- dummydata to (answer)

            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer); 
                    //answerQuestion(answer) is used to signify currentQuestionsIndex++ when an answer has been selected 
                    //void answerQuestion(String selecteddAnswers) where selectedAnswers is now linked to (answer)
                    //(answer) is a call to the shuffledAnsers getter function in quiz_questions.dart which has a 'shuffledList = List.of(answers)'
                  }
                  /*  answerQuestion, // now once we see any shuffled option, and select an answer, the index changes (currentQuestionsIndex++)
                  */
                  );
              //shuffle can also be called on lists, it's a built-in method that can be called on lists to change the order of the items in the list.
            })

            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Answer 2'),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Answer 3'),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Answer 4'),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Answer 5'),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Answer 6'),
            // ),
          ],
        ),
      ),
    );
  }
}
