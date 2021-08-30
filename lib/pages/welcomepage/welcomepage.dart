import 'package:cadr/pages/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

//The home class
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
      // The body
        body: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 65.0, 0.0, 0.0),
            // General Column that contains the header pictures and Title
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Container Row that contains the logo and the Name
                  Container(
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment : MainAxisAlignment.center,
                        children: [
                          // container that contains the logo
                          Container(
                            margin: EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 0.0),
                            child: Image(
                              image: AssetImage("assets/cadr-logo.png"),
                              height: 130,
                              width: 130,
                            ),

                          ),
                          SizedBox(width: 70.0,)
                        ],
                      ),
                    ),
                  ),

                  //Container that wraps the home page picture
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 60.0),
                    child: Image(
                      image: AssetImage("assets/dementia.png"),

                    ),
                  ),

                  //Container that wraps the Welcome Text
                  Container(
                    child: Text(
                      "WELCOME",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 110.0),
                    child: Text(
                      "Information about Dementia is now at your immediate reach",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),

                  // Login Container
                  Container(
                    child: FlatButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Authenticate()));
                      },
                      icon: Icon(
                          Icons.login
                      ),
                      label: Text("CONTINUE"),
                      color: Colors.green[200],
                      minWidth: 350,
                      height: 40,
                    ),
                  )
                ],
              ),
            )
        )

    );
  }
}
