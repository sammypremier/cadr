import 'package:cadr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegistrationPage extends StatefulWidget {

  final Function toggleView;
  RegistrationPage({ required this.toggleView });

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationPage> {
  final AuthenticationService _authenticate = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],

      body: Container(
        padding: EdgeInsets.all(
            10.0
        ),

        //Registration Form
        child: Center(
          child: Form(
            autovalidate: true,
            key: _formKey,
            // Registration Columns
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  // Top Logo
                  Container(
                    margin: EdgeInsets.fromLTRB(00.0, 20.0, 0.0, 40.0),
                    child: Image(
                      image: AssetImage("assets/login person.png"),
                      height: 100,
                      width: 100,
                    ),

                  ),

                  //First Name Column
                  // TextFormField(
                  //   validator: (val) => val!.isEmpty? 'Enter an Firstname' : null,
                  //   onChanged: (val) {
                  //     setState(() => firstName = val);
                  //   },
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //       ),
                  //
                  //       labelText: "First Name"
                  //   ),
                  //   //validator: validateName,
                  // ),
                  //
                  // // First Name Padding
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: 15.0,
                  //   ),
                  // ),
                  //
                  // //Last Name Column
                  // TextFormField(
                  //   validator: (val) => val!.isEmpty? 'Enter an Lastname' : null,
                  //   onChanged: (val) {
                  //     setState(() => lastName = val);
                  //   },
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //       ),
                  //
                  //       labelText: "Last Name"
                  //   ),
                  //   //validator: validateName,
                  // ),
                  //
                  // //Last Name Padding
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: 15.0,
                  //   ),
                  // ),

                  //Email Column
                  TextFormField(
                    validator: (val) => val!.isEmpty? 'Enter an Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),

                        labelText: "Email"
                    ),
                  ),

                  // Email Padding
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                  ),

                  // Password Field
                  TextFormField(
                    validator: (val) => val!.length < 6 ? 'Enter a password 6+ characters ' : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        labelText: "Password"
                    ),
                    //validator: validatePassword,
                  ),


                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                  ),

                  FlatButton.icon(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        dynamic result = await _authenticate.registerToDataBase(email, password);
                        if (result == null){
                          setState(() => error = "Please input a valid email address");
                        }
                      }
                    },
                    icon: Icon(
                      Icons.assignment_ind_outlined,
                    ),
                    label: Text("REGISTER"),
                    color: Colors.green[200],
                    minWidth: 350,
                    height: 40,
                  ),

                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0)
                  ),


                  Container(
                    margin: EdgeInsets.fromLTRB(80.0, 0.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Already Registered?,  ",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              widget.toggleView();
                            },
                            child: Text('Login'),
                            style: TextButton.styleFrom(
                                primary: Colors.red
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}