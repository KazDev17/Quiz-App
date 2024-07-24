// import 'package:flutter/material.dart';


// class QuestionsSummary extends StatelessWidget {
//   const QuestionsSummary(this.summaryData, {super.key});

//   final List<Map<String, Object>> summaryData;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: SingleChildScrollView(
//         child: Column(
//             //here lies our map data from ResultsScreen per row for 6 possible rows vertically (column)
//             //children wants to collect lists of  Widgets but we already have one list of Map in summaryData(which is a pointer to ResultsScreen) To combat this we map it from a list of Map to a list of Widgets
//             children: summaryData.map(
//           (data) {
//             //Row widget is opposite of the Column and also takes a children Widget
//             return Row(
//               children: [
//                 /*data['question_index'] is instantky accessing var i. this type of listing speaks to the value and not the key.
//                   (data['question_index'] as int) +1 - And with that, we should be outputting the question number here as a first item in this row of widgets here.
//                   we had to typecast as an integer (as int) because we have already stated (in final List<Map<String, Object>> summary = [];) that we want to collect Strings and Objects is undefined, so we are strongarming dart to convert the string to integer.
//                   then we just convert everything to a String on the Row
//                 */
//                 Text(((data['question_index'] as int) + 1).toString()),

//                 /*EXPANDED
//           We wrapped this inner column with the 'Expanded' widget because the initial output of this screen wasn't neat
//           Because without expanded, column actually takes an infinite amount of width, even if that goes beyond the screen boundaries.
//           Expanded basically allows its child- in this case column- to take the available space along the flex widgets main axis -which in this case is the Row widget in line 17.
//           Therefore, if you use expanded inside of a row, the widget that is passed as a child to expanded *Column on line 35*, can't take more than the width of that row. That's what expanded guarantees.
//           It restricts the width of the Column widget inside the Row Widget
//       */
//                 Expanded(
//                   //We use column inside of the row bcause we want to group 3 rows vertically (The Question, The chosenAnswer, The correctanswer- which is always the first option in dummy data)
//                   child: Column(
//                     children: [
//                       //remember this is how we assess values of an already defined list (which points to summary.add in results_screen.dart)
//                       Text(data['question'] as String),
//                       const SizedBox(height: 5),
//                       /*for chosenAnswer*/
//                       Text(data['user_answer'] as String),
//                       /*for correct Answer*/
//                       Text(data['correct_answer'] as String),
//                     ],
//                   ),
//                 ) /*You have rows inside of columns which then might contain more columns so that you can restructure the content on your screen exactly as you want to structure it.*/,
//               ],
//             );
//           },
//         ).toList() //this converst from iterable (which is a property of using a map) to list,
//             ),
//       ),
//     );
//   }
// }
