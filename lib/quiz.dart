//PAGE 3
import 'package:adv_basics/data/dummy_questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/results_screen.dart';



class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  //
  /*THIS WORKS, BUT WE CAN USE AN ALTERNATIVE 1
  //replaced var with Widget to remove any restrictions
  //but switchScreen is a bit too early here cause we haven't yet rendered the first UI and it even comes before the switchScreen() function is defined
  //Widget activeScreen = const StartScreen(switchScreen); 

// says activeScreen can be set to null as a value is only assigned after initstate is ran
    Widget? activeScreen;
    //Instead, initState is just called immediately after the object was created, but technically not during the object creation,
    //which is why technically activeScreen initially is null, which is why you must add this question mark here.

  //here comes initState to work around StartScreen calling switchScreen too early
 
  @override
  void initState() {
    //this executes before the build method runs
    //startQuiz is being referenced here as a positional parameter in start_screen.dart
    activeScreen = StartScreen(switchScreen);
    super.initState();


    void switchScreen(){

      setState ( (){
          activeScreen = const QuestionsScreen();
      })

    }
  } */

  //OUR ALTERNATIVE 2
  var activeScreen = 'start-screen';

//List of answers chosen by the users
// first answer here = for the first question... and so on
//was originally final, but once we exhuasted our answers and questions, the length of answers would now be more than the questions
  List<String> selectedAnswers = [];
/*THIS FUNCTION selectedAnswers DOES TWO  THINGS
  1. Store the response of each answer to a question
  2. Here is where we also lift state up to go to the final results screen (results summary screen)
  3. It also resets the user answers in the case of a restart.
*/


//goal here is to change screen from StartScreen to Questions screen once button is pressed
  void switchScreen() {
    //setState method is the primary way to update the state of a widget and trigger a rebuild of the widget tree.
    //This is because we originally start with activeScreen being StrtScreen() then we ask flutter to render the code again after button is pressed (to QuestionsScreen).
    setState(() {
      //this is to override the activeScreen with QuestionsScreen upon button press
      //activeScreen = const QuestionsScreen(); ALTERNATIVE 1
      activeScreen = 'questions-screen'; // ALTERNATIVE 2
    });
  }

/*
Method to this quiz state class that is able to add answers to the selected answers list.
*/
  void chooseAnswer(String answer) {
    //.add -It adds a new item to the list without reassigning that variable, instead it reaches out to that list object in memory and adds a new item to that object,
    // this is how we store those selected answers
//(answer) is a argument/parameter being referenced from quiz_questions.dart which passes both (questions) and (answers) which are arguments for the dummy data
    selectedAnswers.add(answer); 

/* Here is to make sure we check answers with index so we don't run into error page after the last index of questions
*/
//Compare the length of selectedAnswers to the length of questions. because obviously, we can't have more ansers than questions
    if (selectedAnswers.length == questions.length) {
      setState(() {
        /*selectedAnswers =[]; */ //once we exhausted our questions here, we should reset selectedAnswers back to an empty list.
        /*UPDATE AS AT QuestionsSummary
      This selectedAnswers =[]; kept on retuning an empty page even after calling our QuestionsSummary class in results_screen.dart
      We remove this line for now until we want to RESTART QUIZ
  */

    /*activeScreen = 'start-screen';*/ //was the original code prior to creating the ResultsScreen and prior to state bing rendered condtionally (questions to results)
        activeScreen = 'results-screen';
      });
    }
  }

// method to route back to QuestionsScreen() - questions_screen.dart when restart quiz button is pressed from the Results Screen
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    /*ALTERNATIVE 3 -  using ternary operators
    //VARIABLE SCOPED TO THIS BUILD METHOD
    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen) //true
        : const QuestionsScreen(); //else 
    */
    //StartScreen() accpets a this.startQuiz argument in the start_screen.dart
    Widget screenWidget = StartScreen(switchScreen);

    //here we know when the build/method is rendered for the first time it starts off as StartScreen
    //but, remember we are using our startQuiz button pointer for switchScreen function
    //so, once the button is pressed, activeScreen now becomes 'questions-screen' according to code from line 45-57 where we use setState to render build/UI again
    //and with the IF statement, we condition 'question-screen' to load QuestionsScreen()
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

//RESULTS SCREEN BEING LIFTED UP CONDITIONALLY
/*once number of questions matches the number of answers we provide*/
    if (activeScreen == 'results-screen') {
      //ResultsScreen wants a parameter chosenAnswers of type List<String> which is the selectedAnswers
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz, // the restartQuiz button here is the identifier for the activeScreen == 'results-screen'
        //ResultsScreen class passes two arguments- chosenAnswers and onRestart
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 77, 34, 150),
                Color.fromARGB(255, 80, 28, 169),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          /* child: const StartScreen(), //- without rendering conditionally (activeScreen) and lifting state */
//------------------------------------------------------------------------------------------------------------------------------------//
          // child: activeScreen, ALTERNATIVE 1 - using initState
          //this Renders content conditionally but doesn't lift state up
//------------------------------------------------------------------------------------------------------------------------------------//

          /*ALTERNATIVE 2 TO RENDERING STATE CONDITIONALLY - using ternary operators based on a condition being met
          child: activeScreen == 'start-screen' //condition yields true or false
              ? StartScreen(switchScreen) //value used if condition is met
              : const QuestionsScreen(), //value used if condition is NOT met
          //this helps us change UI accordingly as activeScreen is initially StartScreen upon first reload, then QuestionsScreen
          //refer to line 17-27 */
//--------------------------------------------------------------------------------------------------------------------------------//
          /*child : screenWidget, //ALTERNATIVE 3 */
//------------------------------------------------------------------------------------------------------------------------------------//

//------------------------------------------------------------------------------------------------------------------------------------//
          //ALTERNATIVE 4 - IF STATEMENTS
          child: screenWidget,
        ),
      ),
    );
  }
}
