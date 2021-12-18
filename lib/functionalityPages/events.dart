import 'package:cadr/helper/PostedEvents.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {

  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
  List<PostedEvents> listOfEvents = [];
  void initState() {

    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference().child('PostedEvents');
    ref.once().then((DataSnapshot snap){
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      listOfEvents.clear();

      for(var individualKey in KEYS) {
        PostedEvents postedEvents = PostedEvents (
          DATA[individualKey]['image'],
          DATA[individualKey]['topic'],
          DATA[individualKey]['venue'],
          DATA[individualKey]['eventDate'],
          DATA[individualKey]['details'],
          DATA[individualKey]['date'],
          DATA[individualKey]['time'],
        );

        listOfEvents.add(postedEvents);
      }

      setState((){
        print('Length : $listOfEvents.length');
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
                Text("upcoming  ",
                    style: TextStyle(color: Colors.black)
                ),

                Text("Events ",
                    style: TextStyle(color: Colors.red)
                )

              ],
            )
        ),

        body: Container(
            child: Container(
                child: listOfEvents.length == 0 ? Text(
                    ""
                ): Container(
                  //height:MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: listOfEvents.length,
                      itemBuilder: (_, index) {
                        return Events(
                          listOfEvents[index].image,
                          listOfEvents[index].topic,
                          listOfEvents[index].venue,
                          listOfEvents[index].eventDate,
                          listOfEvents[index].details,
                          listOfEvents[index].date,
                          listOfEvents[index].time,
                        );
                      }
                  ),
                )

            )
        )
      );
    }

    Widget Events(String image, String topic, String venue, String eventDate,
        String details, String date, String time) {
      return Card(
          elevation: 10.0,
          margin: EdgeInsets.all(5),
          child: Container(
            width:MediaQuery.of(context).size.width,
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Image.network(
                      image,
                      width: 400.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),


                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text('TOPIC'),
                              Text(
                                topic,
                                style: Theme.of(context).textTheme.subtitle2,
                                textAlign: TextAlign.center,

                              ),
                            ],
                          )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Text('VENUE'),

                                Text(
                                  venue,
                                  style: Theme.of(context).textTheme.subtitle2,
                                  textAlign: TextAlign.center,

                                ),
                              ],
                            )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Text('EVENT DATE'),
                                Text(
                                  eventDate,
                                  style: Theme.of(context).textTheme.subtitle2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Text('EVENT DETAILS'),
                                Text(
                                  details,
                                  style: Theme.of(context).textTheme.subtitle2,
                                  textAlign: TextAlign.center,

                                ),
                              ],
                            )
                        ),
                      ],
                    )
                  ),

                  Container(
                      child: Row(
                        children: [
                          Text(
                            date,
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.center,

                          ),

                          Text(
                            time,
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.center,

                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
        )
      );
    }
}
