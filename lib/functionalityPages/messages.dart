import 'package:cadr/helper/MessagesHelper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {

  @override
  MessagesPageState createState() => MessagesPageState();
}

class MessagesPageState extends State<MessagesPage> {

  List<MessagesFolder> listOfMessages = [];

  void initState() {

    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference().child('MessagesFolder');
    ref.once().then((DataSnapshot snap){
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      listOfMessages.clear();

      for(var individualKey in KEYS) {
        MessagesFolder messagesFolder = MessagesFolder (
          DATA[individualKey]['content'],
          DATA[individualKey]['date'],
          DATA[individualKey]['time'],
          DATA[individualKey]['title'],
        );

        listOfMessages.add(messagesFolder);
      }

      setState((){
        print('Length : $listOfMessages.length');
      });
    });
  }




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
                Text("Available  ",
                    style: TextStyle(color: Colors.black)
                ),

                Text("Messages ",
                    style: TextStyle(color: Colors.red)
                )

              ],
            )
        ),

        body: Container(
            child: Container(
                child: listOfMessages.length == 0 ? Text(
                    "There is no message Available"
                ): Container(
                  //height:MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: listOfMessages.length,
                      itemBuilder: (_, index) {
                        return Messages(
                          listOfMessages[index].content,
                          listOfMessages[index].date,
                          listOfMessages[index].time,
                          listOfMessages[index].title,
                        );
                      }
                  ),
                )

            )
        )
    );
  }

  Widget Messages(String content, String date, String time, String title) {
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.blueGrey,
      //width: 78.0,
      height: 78.0,

      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                          color: Colors.white,

                      ),

                    ),

                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.end,
            ),
          ),

          Container(
            child: Text(
              content,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
