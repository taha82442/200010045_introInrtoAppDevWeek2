import 'package:flutter/material.dart';
import './que.dart';

void main() {
  runApp(MaterialApp(
    home: quiz(),
  ));
}

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  int index = 0;

  List<Question> que_a = [
    Question(que: "Are there 24 hours in a day ?", ans: "True"),
    Question(que: 'Are Penguins fish ?', ans: "False"),
    Question(que: 'Is tomoato a fruit', ans: "True"),
    Question(que: "Is Winter coming ?", ans: "True"),
    Question(que: "Autumn Semester will start next", ans: "True"),
    Question(que: "Are dolphins omnivores", ans: "False"),
  ];
  int score = 0;

  void tch_ans() {
    if (que_a[index].ans == "True") {
      score = score + 1;
    }
  }

  void fch_ans() {
    if (que_a[index].ans == "False") {
      score = score + 1;
    }
  }

  void tindex_update() {
    setState(() {
      tch_ans();
      index = index + 1;
    });
  }

  void findex_update() {
    setState(() {
      fch_ans();
      index = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Quiz"), backgroundColor: Colors.black,
        ),
        body: index < 6
            ? Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(45),
                child: Text(
                  '${que_a[index].que}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 120),
            FlatButton(
              padding: EdgeInsets.all(35),
              color: Colors.green,
              onPressed: tindex_update,
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
            SizedBox(height: 50),
            FlatButton(
              padding: EdgeInsets.all(35),
              color: Colors.red,
              onPressed: findex_update,
              child: Text(
                "False",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'score : $score/6',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
            : Container(
          padding: EdgeInsets.all(50),
          margin: EdgeInsets.all(50),
          child:Center( child: Text(
            "$score/6",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ),)
    );
  }
}
