import 'package:flutter/material.dart';
// import 'questions.dart';
// import 'quiz_brain.dart';

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



  //Questions
  List<String> questions = [
    "1+1 =4?.",
    "4*3 =12?",
    "India\'s capital is Mumbai."
  ];

  //answers
  List<bool> answer = [
    false,
    true,
    false];






  List<Icon> scoreKeeper = [];
  int que_no = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[que_no],
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
                  bool correctans = answer[que_no];
                  if (correctans == true) {
                    print("correct");
                  } else {
                    print("incorrect");
                  }
                  scoreKeeper.add(Icon(
                    Icons.check,
                    color: Colors.lightGreenAccent,
                  ));
                  if (que_no < 2) {
                    que_no = que_no + 1;
                  } else {
                    print("Test Finished");
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
                  bool correctans = answer[que_no];
                  if (correctans == false) {
                    print("correct");
                  } else {
                    print("incorrect");
                  }
                  scoreKeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                  if (que_no < 2) {
                    que_no = que_no + 1;
                  } else {
                    print("Test Finished");
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )

        // TODO: Add a Row here as your score keeper
      ],
    );
  }
}


