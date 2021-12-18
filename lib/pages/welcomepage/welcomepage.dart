import 'package:cadr/pages/authenticate/loginOrRegisterPage.dart';
import 'package:flutter/material.dart';

//The home class
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      // The body
        body: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 65.0, 0.0, 0.0),
            // General Column that contains the header pictures and Title
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Container Row that contains the logo and the Name
                  Container(
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: [
                        // container that contains the logo
                        Container(
                          margin: EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 0.0),
                          child: Image(
                            image: AssetImage("assets/cadr_logo.png"),
                            height: 130,
                            width: 130,
                          ),

                        ),
                        SizedBox(width: 70.0,)
                      ],
                    ),
                  ),

                  //Container that wraps the home page picture
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                    child: Image(
                      image: AssetImage("assets/dementia.jpg"),

                    ),
                  ),

                  //Container that wraps the Welcome Text
                  Container(
                    child: Text(
                      "WELCOME",
                      style: TextStyle(
                        color: Color(0xFF05818F),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 60.0),
                    child: Text(
                      "Information about Ageing and Dementia is now at your fingers tips",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),

                  // Login Container
                  Container(
                    child: FlatButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginOrRegister()));
                      },
                      icon: Icon(
                          Icons.login
                      ),
                      label: Text("CONTINUE"),
                      textColor: Colors.white,
                      color: Color(0xFF05818F),
                      minWidth: 350,
                      height: 45,
                    ),
                  )
                ],
              ),
            )
        )

    );
  }
}
