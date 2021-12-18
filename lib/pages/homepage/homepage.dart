import 'package:cadr/functionalityPages/messages.dart';
import 'package:cadr/helper/linkHelper.dart';
import 'package:cadr/pages/admin/adminhome.dart';
import 'package:cadr/pages/quiz/questionPage.dart';
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

class HomePageState extends State<HomePage> {

  _launchURL(String url) async {
    if (!await launch(url)) {} else {
      throw 'Unable to open  $url';
    }
  }

  List<YoutubeLinkFolder> listOfLinks = [];


  bool loading = false;
//Logic that fetch the youtube video through the link added to the database
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

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("CADR ",
                  style: TextStyle(
                    color: Color(0xFF05818F),
                  )
              ),
              Text("News ",
                  style: TextStyle(color: Color(0xFFBFB800),)
              )

            ],
          )
      ),

//list of categories toggle
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
                        const String url = 'https://www.cadr.cymru/en/jdr.htm';
                        _launchURL(url);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      label: Text('JDR'),
                      icon: Icon(
                          Icons.vpn_lock_outlined,
                          color: Color(0xFF05818F),
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
                        const String url = 'https://www.cadr.cymru/en/enrich-cyrmu.htm';
                        _launchURL(url);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      label: Text('Enrich Cymru'),
                      icon: Icon(
                          Icons.trending_up_outlined,
                          color: Color(0xFF05818F),
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
                        const String url = 'https://www.cadr.cymru/en/past-research.htm';
                        _launchURL(url);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      label: Text('Archive'),
                      icon: Icon(
                          Icons.clean_hands_outlined,
                          color: Color(0xFF05818F),
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
                        const String url = 'https://www.cadr.cymru/en/key-links.htm';
                        _launchURL(url);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      label: Text('Key Links'),
                      icon: Icon(
                          Icons.handyman_outlined,
                          color: Color(0xFF05818F),
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
                        const String url = 'https://www.cadr.cymru/en/team.htm';
                        _launchURL(url);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      label: Text('Team'),
                      icon: Icon(
                          Icons.search_outlined,
                          color: Color(0xFF05818F),
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
                        const String url = 'https://www.cadr.cymru/en/photo-gallery.htm';
                        _launchURL(url);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      label: Text('Photos'),
                      icon: Icon(Icons.wallet_travel_outlined,
                          color: Color(0xFF05818F),
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

      //body
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

// Logic that reveals news data from the database
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                          Container(
                              child: listOfLinks.length == 0 ? Text(
                                  "There is no content Available",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                    color: Colors.white
                                  )
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
                iconSize: 25,
                color: Color(0xFF05818F),
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

              // IconButton(
              //   icon: Icon(Icons.add_chart),
              //   iconSize: 32,
              //   color: Color(0xFF05818F),
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => AdminHome()));
              //   },
              //
              // ),

              IconButton(
                icon: Icon(Icons.mail_outline),
                iconSize: 25,
                color: Color(0xFF05818F),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MessagesPage()));
                },

              ),

              IconButton(
                icon: Icon(Icons.graphic_eq),
                iconSize: 20,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => QuestionPage()));
                },
              ),
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
        color: Color(0xFF05818F),
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
  //News Image Card
  Widget Image1() {
    return Card(
        margin: EdgeInsets.all(5.0),
        elevation: 10.0,
        color: Color(0xFF05818F),
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
        color: Color(0xFF05818F),
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
        color: Color(0xFF05818F),
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


// import 'package:cadr/functionalityPages/events.dart';
// import 'package:cadr/functionalityPages/messages.dart';
// import 'package:cadr/helper/Posts.dart';
// import 'package:cadr/helper/linkHelper.dart';
// import 'package:cadr/pages/admin/adminhome.dart';
// import 'package:cadr/pages/profile/profilepage.dart';
// import 'package:cadr/pages/quiz/questionPage.dart';
// import 'package:cadr/shared/loading.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
//
//
//
// //List<CategoriesOfNews> categories = Utils.getMockedCategories();
//
// class HomePage extends StatefulWidget {
//
//   @override
//   HomePageState createState() => HomePageState();
// }
//
// class HomePageState extends State<HomePage> {
//
//   _launchURL(String url) async {
//     if (!await launch(url)) {} else {
//       throw 'Unable to open  $url';
//     }
//   }
//
//
//   List<Posts> listOfPosts = [];
//
//   bool loading = false;
//
//   void initState() {
//     super.initState();
//     DatabaseReference ref = FirebaseDatabase.instance.reference().child(
//         'Posts');
//     ref.once().then((DataSnapshot snap) {
//       var KEYS = snap.value.keys;
//       var DATA = snap.value;
//
//       listOfPosts.clear();
//
//       for (var individualKey in KEYS) {
//         Posts posts = Posts(
//           DATA[individualKey]['image'],
//           DATA[individualKey]['description'],
//           DATA[individualKey]['date'],
//           DATA[individualKey]['time'],
//         );
//
//         listOfPosts.add(posts);
//       }
//
//       setState(() {
//         print('Length : $listOfPosts.length');
//       });
//     });
//   }
//
//
//
//     @override
//     Widget build(BuildContext context) {
//       return loading ? Loading() : Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//             backgroundColor: Colors.white,
//             elevation: 0.2,
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text("CADR ",
//                     style: TextStyle(color: Colors.black)
//                 ),
//                 Text("News ",
//                     style: TextStyle(color: Color(0xFFBFB800),)
//                 )
//
//               ],
//             )
//         ),
//
//         //body
//         body: Container(
//           child: Column(
//
//             children: [
//               Container(
//                   height: 70.0,
//
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Container(
//                             child: Column(
//                                 children: <Widget>[
//                                   Container(
//                                     child: InkWell(
//                                       onTap: () {
//                                         const String url = 'https://www.cadr.cymru/en/';
//                                         _launchURL(url);
//                                       },
//                                       child: Image(
//                                         image: AssetImage("assets/head.png"),
//                                         height: 50,
//                                         width: 50,
//                                       ),
//                                     ),
//                                   ),
//
//                                   Container(
//                                     child: Text(
//                                       "resources",
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                     ),
//                                   )
//                                 ]
//                             )
//                         ),
//
//
//                         Container(
//                             child: Column(
//                                 children: <Widget>[
//                                   Container(
//                                     child: InkWell(
//                                       onTap: () {
//                                         const String url = 'https://www.cadr.cymru/en/publications.htm';
//                                         _launchURL(url);
//                                       },
//                                       child: Image(
//                                         image: AssetImage("assets/brain.png"),
//                                         height: 50,
//                                         width: 50,
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     child: Text(
//                                       "publications",
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                     ),
//                                   )
//                                 ]
//                             )
//                         ),
//
//                         Container(
//                             child: Column(
//                                 children: <Widget>[
//                                   Container(
//                                     child: InkWell(
//                                       onTap: () {
//                                         const String url = 'https://www.cadr.cymru/en/news-archive.htm';
//                                         _launchURL(url);
//                                       },
//                                       child: Image(
//                                         image: AssetImage("assets/support.png"),
//                                         height: 50,
//                                         width: 50,
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     child: Text(
//                                       "news",
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                     ),
//                                   )
//                                 ]
//                             )
//                         ),
//
//
//                         Container(
//                             child: Column(
//                                 children: <Widget>[
//                                   Container(
//                                     child: InkWell(
//                                       onTap: () {
//                                         const String url = 'https://www.cadr.cymru/en/list-of-available-presentations.htm';
//                                         _launchURL(url);
//                                       },
//                                       child: Image(
//                                         image: AssetImage("assets/trend.png"),
//                                         height: 50,
//                                         width: 50,
//                                       ),
//                                     ),
//                                   ),
//
//                                   Container(
//                                     child: Text(
//                                       "events",
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                     ),
//                                   )
//                                 ]
//                             )
//                         ),
//
//
//                         Container(
//                             child: Column(
//                                 children: <Widget>[
//                                   Container(
//                                     child: InkWell(
//                                       onTap: () {
//                                         const String url = 'https://www.cadr.cymru/en/cadr-resources.htm';
//                                         _launchURL(url);
//                                       },
//                                       child: Image(
//                                         image: AssetImage(
//                                             "assets/research.png"),
//                                         height: 50,
//                                         width: 50,
//                                       ),
//
//                                     ),
//                                   ),
//                                   Container(
//                                     child: Text(
//                                       "research",
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                     ),
//                                   )
//                                 ]
//                             )
//                         ),
//                       ]
//                   )
//               ),
//
//               // Expanded(
//               //   child: listOfPosts.length == 0 ? Text(
//               //       "There is no News Available",
//               //     style: TextStyle(
//               //     color: Colors.white,
//               //   ),
//               //   ): Container(
//               //     width:MediaQuery.of(context).size.width,
//               //     child: ListView.builder(
//               //       itemCount: listOfPosts.length,
//               //       itemBuilder: (_, index) {
//               //         return PostLayout(
//               //           listOfPosts[index].image,
//               //           listOfPosts[index].description,
//               //           listOfPosts[index].date,
//               //           listOfPosts[index].time,
//               //         );
//               //       }
//               //     ),
//               //   )
//               // )
//             ],
//           ),
//
//           //Main News Page.
//
//
//         ),
//
//
//         //footer
//         bottomNavigationBar: BottomAppBar(
//           elevation: 1.0,
//           color: Colors.white,
//           child: Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.add_ic_call_outlined),
//                   iconSize: 20,
//                   color: Colors.blueGrey,
//                   onPressed: () {
//                     const String url = 'https://www.cadr.cymru/en/contact-us.htm';
//                     _launchURL(url);
//                   },
//
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.account_circle_outlined),
//                   iconSize: 20,
//                   color: Colors.blueGrey,
//                   onPressed: () {
//                     //_authService.signOut();
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ProfilePage())
//                     );
//                   },
//
//                 ),
//
//                 IconButton(
//                   icon: Icon(Icons.add_chart),
//                   iconSize: 32,
//                   color: Color(0xFFBFB800),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => AdminHome()));
//                   },
//
//                 ),
//
//                 IconButton(
//                   icon: Icon(Icons.mail_outline),
//                   iconSize: 20,
//                   color: Colors.blueGrey,
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(
//                         builder: (context) => MessagesPage()));
//                   },
//
//                 ),
//
//                 IconButton(
//                   icon: Icon(Icons.graphic_eq),
//                   iconSize: 20,
//                   color: Colors.blueGrey,
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(
//                         builder: (context) => QuestionPage()));
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
//
//
// // Post Layout Function
// // Widget PostLayout(String image, String description, String date,
// //     String time) {
// //   return Card(
// //     elevation: 10.0,
// //     margin: EdgeInsets.all(10.0),
// //
// //     child: Container(
// //       padding: EdgeInsets.all(15.0),
// //
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //
// //         children: <Widget>[
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: <Widget>[
// //               // Text(
// //               //   date,
// //               //   style: Theme.of(context).textTheme.subtitle2,
// //               //   textAlign: TextAlign.center,
// //               //
// //               // ),
// //               //
// //               // Text(
// //               //   time,
// //               //   style: Theme.of(context).textTheme.subtitle2,
// //               //   textAlign: TextAlign.center,
// //               // ),
// //             ],
// //           ),
// //
// //           SizedBox(height: 10.0,),
// //
// //           InkWell(
// //             onTap: () {
// //
// //             },
// //             child: Image.network(
// //               image,
// //               width: 400.0,
// //               height: 180.0,
// //               fit: BoxFit.cover,
// //
// //
// //             ),
// //
// //           ),
// //           SizedBox(height: 10.0,),
// //
// //           Text(
// //             description,
// //             style: TextStyle(
// //               color: Colors.blueGrey,
// //               fontSize: 15.0,
// //
// //             ),
// //             textAlign: TextAlign.center,
// //           ),
// //
// //         ],
// //       ),
// //     ),
// //   );
// // }
//
