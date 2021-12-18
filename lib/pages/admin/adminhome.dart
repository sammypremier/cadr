import 'package:cadr/pages/admin/privilege.dart';
import 'package:cadr/pages/admin/sendNewMessage.dart';
import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/pages/support/support.dart';
import 'package:cadr/pages/action/action.dart';
import 'package:cadr/pages/research/research.dart';
import 'package:cadr/pages/archive/archive.dart';
import 'package:cadr/pages/trend/trend.dart';
import 'package:cadr/pages/upload/uploadnews.dart';
import 'package:cadr/pages/youtubevideolink/youtubevideolink.dart';
import 'package:cadr/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'createEvent.dart';
import 'listOfUsers.dart';

class AdminHome extends StatefulWidget {

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  bool loading = false;

  late Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return loading? Loading(): Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Admin  ",
                  style: TextStyle( color: Colors.black)
              ),

              Text("Dashboard ",
                  style: TextStyle( color: Colors.red)
              )

            ],


          )
      ),

        drawer: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  'List Of Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    SizedBox(
                      height: 55.0,
                      width: 130,
                      child: ElevatedButton.icon(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          => UploadNewsPage()));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        label: Text('All'),
                        icon: Icon(
                            Icons.vpn_lock_outlined,
                            color: Colors.green,
                            size: 18

                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    SizedBox(
                      height: 55.0,
                      width: 130,
                      child: ElevatedButton.icon(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          => TrendPage()));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        label: Text('Trend'),
                        icon: Icon(
                            Icons.trending_up_outlined,
                            color: Colors.green,
                            size: 18

                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      height: 55.0,
                      width: 130,
                      child: ElevatedButton.icon(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          => SupportPage()));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        label: Text('Support'),
                        icon: Icon(
                            Icons.clean_hands_outlined,
                            color: Colors.green,
                            size: 18

                        ),
                      ),
                    ),

                    SizedBox(height: 20),


                    SizedBox(
                      height: 55.0,
                      width: 130,
                      child: ElevatedButton.icon(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          => ActionPage()));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        label: Text('Action'),
                        icon: Icon(
                            Icons.handyman_outlined,
                            color: Colors.green,
                            size: 18

                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      height: 55.0,
                      width: 130,
                      child: ElevatedButton.icon(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          => ResearchPage()));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        label: Text('Research'),
                        icon: Icon(
                            Icons.search_outlined,
                            color: Colors.green,
                            size: 18

                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      height: 55.0,
                      width: 130,
                      child: ElevatedButton.icon(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          => ArchivePage()));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        label: Text('Archive'),
                        icon: Icon(Icons.wallet_travel_outlined,
                            color: Colors.green,
                            size: 18

                        ),
                      ),
                    ),

                    SizedBox(height: 110),
                  ],
                ),
              )
            ],
          ),
        ),

      body: SingleChildScrollView(

          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()
                            )
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        maxRadius: 70.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                                Icons.home_outlined,
                                color: Colors.green,
                                size: 30
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        => UploadNewsPage()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        maxRadius: 70.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                                Icons.assignment_turned_in_outlined,
                                color: Colors.green,
                                size: 30
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Post News",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),







               ],
              ),
              new SizedBox(
                height: 20.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => NewMessage()));
                    },
                    child: new CircleAvatar(
                      backgroundColor: Colors.black54,
                      maxRadius: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                              Icons.mail_outline,
                              color: Colors.green,
                              size: 30
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "Send Message",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => ListOfUsers()));
                    },
                    child: new CircleAvatar(
                      backgroundColor: Colors.black54,
                      maxRadius: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                              Icons.visibility_outlined,
                              color: Colors.green,
                              size: 30
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "View Users",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

              new SizedBox(
                height: 20.0,
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => CreateEvent()
                          )
                      );
                    },
                    child: new CircleAvatar(
                      backgroundColor: Colors.black54,
                      maxRadius: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                              Icons.add_box_outlined,
                              color: Colors.green,
                              size: 30
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                              "Create Event",
                               style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: new CircleAvatar(
                      backgroundColor: Colors.black54,
                      maxRadius: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 30
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                              "Create Poll",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              new SizedBox(
                height: 20.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => YoutubeLink()));
                    },
                    child: new CircleAvatar(
                      backgroundColor: Colors.black54,
                      maxRadius: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                              Icons.history,
                              color: Colors.green,
                              size: 30
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                              "Upload Video",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => Privilege()));
                    },
                    child: new CircleAvatar(
                      backgroundColor: Colors.black54,
                      maxRadius: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                              Icons.person,
                              color: Colors.green,
                              size: 30
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                              "Privilege",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }


  Widget suspendButton() {
    return Container(
      child: FlatButton.icon(
          minWidth: 10.0,
          label: Text(""),
          textColor: Colors.white,
          color: Colors.yellow,
          onPressed: () {  },

          icon: Icon(Icons.warning_amber_outlined)
      ),
    );
  }



  Widget deleteButton() {
    return Container(
      child: FlatButton.icon(
          minWidth: 10.0,

          label: Text(""),
          textColor: Colors.white,
          color: Colors.red,
          onPressed: () {  },

          icon: Icon(Icons.cancel)
      ),
    );
  }
}
