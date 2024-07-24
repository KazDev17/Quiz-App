//BLUEPRINT FOR THE DUMMY DATA

//And this will now not extend anything because it will not be a widget and there is nothing else that this class would need to extend.

class QuizQuestion {
  const QuizQuestion(this.text,this.answers); //constructor function so we can reuse this class

  final String text;
  final List<String> answers;

  //Adding a method (function in a class)
  //also returns a string of values
  List<String> get shuffledAnswers{
//so List is not just a type but also a class built into Dart.
//And this offers a couple of utility constructor functions

//So now the new list will be the shuffled one and the old list(from dummy data) will be untouched because we copied the list and then shuffled the copied list.
//we're calling a method (.shuffle) on the result of calling another functional method (.of (answwers)) which is a list of copied answers as we don't want our origanal list to change and Shuffle changes that list order
//This is called a CHAIN(ING) COMMAND
    //List.of(answers).shuffle();

    //SO SHUFFLE RETURNS VOID AND DOES NOT YIELD THE SHUFFLED LIST AND GIVE YOU THE UPDATED ONE
    //TO WORK AROUND THAT.....

    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;

    /*NOTES
    1.We had to first create the copy of the answers lst - final shuffledList = List.of(answers);
    2.Then we store this copy in a variable - final shuffledList
    3.Then we call Shuffle - shuffledList.shuffle(); which changes the list in place
    4.Then we return the updated shuffle list.
    5.Final is used here to indicate the variable shuffledList doesn't change and can't be reassigned. i.e ahuffledList = ['Hello World] .... this won't work
    
    */
  }
}
