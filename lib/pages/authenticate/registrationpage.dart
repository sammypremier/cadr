import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {

  final Function toggleView;
  RegistrationPage({ required this.toggleView });

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        padding: EdgeInsets.all(
            10.0
        ),

        //Registration Form
        child: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.always,
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

                  //Last Name Padding
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                  ),

                  //Email Column
                  TextFormField(
                    controller: _emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Email cannot be empty';
                      }else {
                        return null;
                      }
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
                    obscureText: true,
                    controller: _passwordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Password cannot be empty';
                      }else {
                        return null;
                      }
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
                      final String email = _emailController.text.trim();
                      final String password = _passwordController.text.trim();

                      if(email.isEmpty|| password.isEmpty) {
                        return null;
                      }else{
                        context.read<AuthenticationService>().registerUser(
                          email,
                          password,
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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

