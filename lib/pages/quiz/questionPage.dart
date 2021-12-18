import 'package:cadr/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cadr/pages/question/question.dart';




class QuestionPage extends StatefulWidget {

  @override
  QuestionPageState createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {

  List<Question> questions = [
    Question(question:'CADR is Centre for Ageing and Dementia Research?', answer:  true ),
    Question(question: 'Cadr is Effecting a change in research about Ageing and dementia?',  answer: true ),
    Question(question: 'Cadr is Known for Ageing and Dementia Research?',  answer: true ),
    Question(question: 'Cadr headquarter is based in Nigeria?',  answer: false ),
    Question(question: 'Cadr Research can benefit anybody regardless of age bracket?',  answer: true )
  ];

  int questionIndex = 0;
  String answer = '';
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("CADR ",
                  style: TextStyle( color: Colors.black)
              ),

              Text("Quiz ",
                  style: TextStyle( color: Color(0xFFBFB800))
              )

            ],


          )
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 600.0,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.only(top:20.0),
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          child: Text(
                            "Question${questionIndex +1}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                      ),

                      SizedBox(height: 30),


                      Container(
                          child: Text(
                            questions[questionIndex].question,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                            ),

                          )
                      ),

                      SizedBox(height: 50),

                      if (answer == 'correct')
                        Container(
                            height: 45.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${counter++}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),

                                ),

                                Text(
                                  answer,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                  ),
                                ),

                                SizedBox(
                                  width: 10.0,
                                ),

                                Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 30
                                ),

                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            )
                        )

                      else if(answer == 'Incorrect')
                        Container(
                            height: 45.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  answer,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),

                                SizedBox(
                                  width: 10.0,
                                ),

                                Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                    size: 40
                                ),

                                SizedBox(
                                  height: 10.0,
                                ),

                              ],
                            )
                        ),


                      SizedBox(
                        height: 40.0,
                      ),

                      Container(
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFBFB800),
                          maxRadius: 70.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  'Score',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),

                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '${counter}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]
                )
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment : MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 2),
                    ),

                    onPressed: () {
                      if (questionIndex < 4) {
                        if (questions[questionIndex].answer == true)
                          setState(() {
                            questionIndex++;
                            answer = 'correct';
                          });
                        else
                          setState(() {
                            questionIndex++;
                            answer = 'Incorrect';
                          });

                      }else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                      }
                    },
                    icon: Icon(
                        Icons.thumb_up_outlined
                    ),
                    label: Text(
                      "True",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    textColor: Colors.blue,
                    height: 40,
                    minWidth: 175,
                  ),
                ),

                SizedBox(
                  width: 10.0,
                ),

                Container(
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red, width: 2),
                    ),
                    onPressed: () {
                      if (questionIndex < 4) {
                        if (questions[questionIndex].answer == false)
                          setState(() {
                            questionIndex++;
                            answer = 'correct';
                          });
                        else
                          setState(() {
                            questionIndex++;
                            answer = 'Incorrect';
                          });

                      }else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                      }


                    },
                    icon: Icon(
                        Icons.thumb_down_outlined
                    ),
                    label: Text(
                      "False",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    textColor: Colors.red,
                    height: 40,
                    minWidth: 175,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
