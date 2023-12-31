import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'questions.dart';
import 'quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  // //Step-1
  // //Questions
  // List<String> questions = [
  //   "1+1 =4?.",
  //   "4*3 =12?",
  //   "India\'s capital is Mumbai."
  // ];
  //
  // //answers
  // List<bool> answer = [
  //   false,
  //   true,
  //   false];

//   //Step -2
// List<Question> questionBank = [
// Question('1+1 =4?', false),
// Question('4*3 =12?', true),
// Question('India\'s capital is Mumbai.', false),
// ];

//step -3  Abstraction

//concept of abstraction
 QuizBrain quizBrain = QuizBrain();


  List<Icon> scoreKeeper = [];
  int que_no = 0;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  // questions[que_no],   //step -1
                  // questionBank[que_no].queText, //step-2
                  //need of encapsulation
                  // quizBrain.questionBank[que_no].queText ="jell", //we are able to change the question so its a problem
                  quizBrain.getQuestionText(), //now the que text cannot be changed
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                // Color: Colors.white,
                // color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.greenAccent.shade400,
                    fontSize: 20.0,
                  ),
                ),

                onPressed: () {
                  setState(() {
                    quizBrain.queNumber();
                    // bool correctans = answer[que_no];   //Step-1
                    // bool correctans = questionBank[que_no].correctAns; //step-2
                    //need of encapsulation
                    // quizBrain.questionBank[que_no].correctAns=true; //the answer is set to true for clicking true
                    //                                               // so this will always be correct
                    //                                               // therefore we need : encapsulation
                    // bool correctans = quizBrain.questionBank[que_no].correctAns; //change here
                    bool correctans = quizBrain.getCorrectAns();
                    if (correctans == true) {
                      print("correct");
                    } else {
                      print("incorrect");
                    }

                    if (que_no < 12) {
                      que_no = que_no + 1;
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.lightGreenAccent,
                      ));
                    } else {
                      print("Test Finished");
                      Alert(context: context, title: "Test Finished", desc: "Try Again.").show();
                    }
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                // color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    quizBrain.queNumber();
                    // bool correctans = answer[que_no]; //step-1
                    // bool correctans = questionBank[que_no].correctAns;  //step -2
                    //need of encapsulation
                    // quizBrain.questionBank[que_no].correctAns=false; //the answer is set to false for clicking false
                    //                                               // so this will always be correct
                    //                                               // therefore we need : encapsulation
                    bool correctans = quizBrain.getCorrectAns();
                    if (correctans == false) {
                      print("correct");
                    } else {
                      print("incorrect");
                    }

                    if (que_no < 12) {
                      que_no = que_no + 1;
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    } else {
                      print("Test Finished");
                      print("Test Finished");
                      Alert(context: context, title: "Test Finished", desc: "Try Again.").show();
                    }
                  });
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )

        ],
      ),
    );
  }
}


