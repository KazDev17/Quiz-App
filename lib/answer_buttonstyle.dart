import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  //we want the arguments passed in this AnswerButton constructor function to be named and compulsory. as named parameters are optional by default

  const AnswerButton({required this.answerText, required this.onTap, super.key});

  //there is nothing wrong with using positional, we just wanted to see the fun in using named.
  // const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, //when tap i.e an answer is picked, it initiates the  currentQuestionsIndex++;
      style: ElevatedButton.styleFrom(
        /*padding: EdgeInsets.all(value), //applies padding in all directions */
        padding: const EdgeInsets.symmetric(
          //allows for specific values configuration for vertical and horizontal
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 96, 23, 222), //button color
        foregroundColor: Colors.white, //for the text
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center, //this is to center the multiple line answer options after we change index
      ),
    );
  }
}
