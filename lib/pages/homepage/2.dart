import 'package:cadr/functionalityPages/messages.dart';
import 'package:cadr/helper/linkHelper.dart';
import 'package:cadr/pages/action/action.dart';
import 'package:cadr/pages/admin/adminhome.dart';
import 'package:cadr/pages/archive/archive.dart';
import 'package:cadr/pages/research/research.dart';
import 'package:cadr/pages/support/support.dart';
import 'package:cadr/pages/trend/trend.dart';
import 'package:cadr/pages/upload/uploadnews.dart';
import 'package:cadr/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<AdminHome> {
  _launchURL(String url) async {
    if (!await launch(url)) {} else {
      throw 'Unable to open  $url';
    }
  }

  List<YoutubeLinkFolder> listOfLinks = [];

  bool loading = false;

  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference().child(
        'YoutubeLinkFolder');
    ref.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      listOfLinks.clear();

      for (var individualKey in KEYS) {
        YoutubeLinkFolder youtubeLinkFolder = YoutubeLinkFolder(
          DATA[individualKey]['content'],
          DATA[individualKey]['date'],
          DATA[individualKey]['time'],
          DATA[individualKey]['title'],
        );

        listOfLinks.add(youtubeLinkFolder);
      }

      setState(() {
        print('Length : $listOfLinks.length');
      });
    });
  }

  late Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("CADR ",
                  style: TextStyle(color: Colors.black)
              ),
              Text("News ",
                  style: TextStyle(color: Color(0xFFBFB800),)
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





      body: Container(
        //height:MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          child: Column(
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      const String url = 'https://www.cadr.cymru/en/';
                                      _launchURL(url);
                                    },
                                    child: Image(
                                      image: AssetImage("assets/head.png"),
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Text(
                                    "resources",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ]
                          )
                      ),


                      Container(
                          child: Column(
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      const String url = 'https://www.cadr.cymru/en/publications.htm';
                                      _launchURL(url);
                                    },
                                    child: Image(
                                      image: AssetImage("assets/brain.png"),
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "publications",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ]
                          )
                      ),

                      Container(
                          child: Column(
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      const String url = 'https://www.cadr.cymru/en/news-archive.htm';
                                      _launchURL(url);
                                    },
                                    child: Image(
                                      image: AssetImage("assets/support.png"),
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "news",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ]
                          )
                      ),


                      Container(
                          child: Column(
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      const String url = 'https://www.cadr.cymru/en/list-of-available-presentations.htm';
                                      _launchURL(url);
                                    },
                                    child: Image(
                                      image: AssetImage("assets/trend.png"),
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Text(
                                    "events",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ]
                          )
                      ),


                      Container(
                          child: Column(
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      const String url = 'https://www.cadr.cymru/en/cadr-resources.htm';
                                      _launchURL(url);
                                    },
                                    child: Image(
                                      image: AssetImage(
                                          "assets/research.png"),
                                      height: 50,
                                      width: 50,
                                    ),

                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "research",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ]
                          )
                      ),
                    ]
                )
            ),


            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                          Container(
                              child: listOfLinks.length == 0 ? Text(
                                  "There is no content Available"
                              ): Container(
                                //height:MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: listOfLinks.length,
                                    itemBuilder: (_, index) {
                                      return Messages(
                                        listOfLinks[index].content,
                                        listOfLinks[index].date,
                                        listOfLinks[index].time,
                                        listOfLinks[index].title,
                                      );
                                    }
                                ),
                              )
                          ),
                          Container(
                              child: Image1()
                          ),

                          Container(
                              child: Image2()
                          ),

                          Container(
                              child: Image3()
                          ),
                        ]
                    )
                )
            )
          ],
        ),

        //Main News Page.


      ),


      //footer
      bottomNavigationBar: BottomAppBar(
        elevation: 1.0,
        color: Colors.white,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add_ic_call_outlined),
                iconSize: 20,
                color: Colors.blueGrey,
                onPressed: () {
                  const String url = 'https://www.cadr.cymru/en/contact-us.htm';
                  _launchURL(url);
                },

              ),
              // IconButton(
              //   icon: Icon(Icons.account_circle_outlined),
              //   iconSize: 20,
              //   color: Colors.blueGrey,
              //   onPressed: () {
              //     //_authService.signOut();
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => ProfilePage())
              //     );
              //   },
              //
              // ),

              IconButton(
                icon: Icon(Icons.add_chart),
                iconSize: 32,
                color: Color(0xFFBFB800),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminHome()));
                },

              ),

              IconButton(
                icon: Icon(Icons.mail_outline),
                iconSize: 20,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MessagesPage()));
                },

              ),

              // IconButton(
              //   icon: Icon(Icons.graphic_eq),
              //   iconSize: 20,
              //   color: Colors.blueGrey,
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => QuestionPage()));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }


  Widget Messages(String content, String date, String time, String title) {
    return Card(
        margin: EdgeInsets.all(5.0),
        elevation: 10.0,
        color: Colors.blueGrey,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container (
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: content,
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                        )
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blue,
                    progressColors: ProgressBarColors(
                        playedColor: Colors.blue,
                        handleColor: Colors.blueAccent
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }

  Widget Image1() {
    return Card(
        margin: EdgeInsets.all(5.0),
        elevation: 10.0,
        color: Colors.blueGrey,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container (
                  child: InkWell(
                    onTap: () {
                      const String url = 'https://www.cadr.cymru/en/opportunities.htm';
                      _launchURL(url);
                    },
                    child: Image(
                      image: AssetImage("assets/opportunities.PNG"),
                      width: 400.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ]
          ),
        )
    );
  }


  Widget Image2() {
    return Card(
        margin: EdgeInsets.all(5.0),
        elevation: 10.0,
        color: Colors.blueGrey,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container (
                  child: InkWell(
                    onTap: () {
                      const String url = 'https://www.cadr.cymru/en/about-us.htm';
                      _launchURL(url);
                    },
                    child: Image(
                      image: AssetImage("assets/aims.PNG"),
                      width: 400.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ]
          ),
        )
    );
  }

  Widget Image3() {
    return Card(
        margin: EdgeInsets.all(5.0),
        elevation: 10.0,
        color: Colors.blueGrey,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container (
                  child: InkWell(
                    onTap: () {
                      const String url = 'https://www.cadr.cymru/en/news-info.htm?id=252';
                      _launchURL(url);
                    },
                    child: Image(
                      image: AssetImage("assets/garden.PNG"),
                      width: 400.0,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ]
          ),
        )
    );
  }
}
