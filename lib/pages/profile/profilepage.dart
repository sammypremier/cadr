import 'package:cadr/pages/authenticate/loginOrRegisterPage.dart';
import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/services/auth.dart';
import 'package:flutter/material.dart';



AuthenticationService _authService = AuthenticationService();

class ProfilePage extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        padding: EdgeInsets.only(
            top: 40.0,
        ),

        //Registration Form
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  "PROFILE",
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              Container(
                child: Form(
                  autovalidateMode: AutovalidateMode.always, key: _formKey,
                  // Registration Columns
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // Top Logo
                        Container(
                          height: 230,
                          width: 400,
                          child: Card(
                            elevation: 5.0,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween ,
                                  children: <Widget>[
                                    Text(
                                      '.',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),

                                    IconButton(
                                      //alignment: Alignment.topLeft,
                                      icon: Icon(Icons.account_circle_outlined),
                                      iconSize: 30,
                                      color: Colors.blueGrey,
                                      onPressed: () {
                                        _authService.signOut();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>LoginOrRegister()));
                                      },
                                    ),
                                  ],
                                ),

                                Image(
                                  image: AssetImage("assets/login person.png"),
                                  height: 100,
                                  width: 100,
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                ),

                                Text(
                                    'First Name + Last Name goes here',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                  ),
                                ),

                                Text(
                                    '@ Username Goes Here',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),

                          ),
                        ),

                        Divider(
                          color: Colors.red,
                        ),


                        Container(
                          //height:MediaQuery.of(context).size.height,
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                //First Name Column
                                TextFormField(
                                  //Decoration
                                  decoration: InputDecoration(
                                      labelText: "First Name",
                                      prefixIcon: Icon(Icons.accessibility_new_outlined),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.lightGreenAccent
                                          )
                                      )
                                  ),

                                  //Control
                                  controller: _firstNameController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please input your First Name';
                                    }else {
                                      return null;
                                    }
                                  },
                                  //validator: validateName,
                                ),

                                // First Name Padding
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 25.0,
                                  ),
                                ),

                                //Last Name Column
                                TextFormField(
                                  //Decoration
                                  decoration: InputDecoration(
                                      labelText: "Last Name",
                                      prefixIcon: Icon(Icons.accessibility_new_outlined),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.lightGreenAccent
                                          )
                                      )
                                  ),

                                  //Control
                                  controller: _lastNameController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please input your Last Name';
                                    }else {
                                      return null;
                                    }
                                  },

                                  //validator: validateName,
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 25.0,
                                  ),
                                ),

                                TextFormField(
                                  //Decoration
                                  decoration: InputDecoration(
                                      labelText: "Username",
                                      prefixIcon: Icon(Icons.accessibility_new_outlined),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.lightGreenAccent
                                          )
                                      )
                                  ),

                                  //Control
                                  controller: _lastNameController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please input your Alias';
                                    }else {
                                      return null;
                                    }
                                  },

                                  //validator: validateName,
                                ),

                                //Last Name Padding
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 25.0,
                                  ),
                                ),

                                //Email Column
                                TextFormField(
                                  //Decoration
                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      prefixIcon: Icon(Icons.mail_outline),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.lightGreenAccent
                                          )
                                      )
                                  ),

                                  //Control
                                  controller: _emailController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Email cannot be empty';
                                    }else {
                                      return null;
                                    }
                                  },
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 25.0,
                                  ),
                                ),

                                //Phone Number
                                TextFormField(
                                  //Decoration
                                  decoration: InputDecoration(
                                      labelText: "Phone",
                                      prefixIcon: Icon(Icons.add_ic_call_outlined),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.lightGreenAccent
                                          )
                                      )
                                  ),

                                  //Control
                                  controller: _phoneNumberController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'please input a phone number';
                                    }else {
                                      return null;
                                    }
                                  },
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 25.0,
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),

                        RaisedButton(

                          child: Text("SAVE", style: TextStyle(fontSize: 20.0)),
                          textColor: Colors.white,
                          color: Colors.green,


                          onPressed: () async {
                            final String email = _emailController.text.trim();
                            final String firstName = _firstNameController.text.trim();
                            final String lastName = _lastNameController.text.trim();

                            if(email.isEmpty|| firstName.isEmpty) {
                              return null;
                            }else{
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            }

                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

