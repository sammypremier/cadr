import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  final Function toggleView;
  LoginPage({ required this.toggleView });

  @override
  _LoginPage createState() => _LoginPage();
}
class _LoginPage extends State<LoginPage> {
  //final AuthenticationService _authenticate = AuthenticationService();
  final GlobalKey _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        padding: EdgeInsets.all(
            25.0
        ),
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 70.0),
                    child: Image(
                      image: AssetImage("assets/login person.png"),
                      height: 100,
                      width: 100,
                    ),

                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Email Cannot be Empty';
                      }else {
                        return val;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),

                        labelText: "Email"
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                  ),

                  TextFormField(
                    controller: _passwordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Password Cannot be Empty';
                      }else {
                        return val;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),

                        labelText: "Password"
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: FlatButton.icon(
                      onPressed: () async {
                        final String email = _emailController.text.trim();
                        final String password = _passwordController.text.trim();

                        if(email.isEmpty || password.isEmpty) {
                          return null;
                        }else{
                          context.read<AuthenticationService>().loginUser(
                            email,
                            password,
                          );
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      icon: Icon(
                          Icons.login
                      ),
                      label: Text("LOGIN"),
                      color: Colors.green[200],
                      minWidth: 350,
                      height: 40,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(80.0, 30.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Not a Member?,  ",
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
                            child: Text('Register'),
                            style: TextButton.styleFrom(
                            primary: Colors.red
                            )
                        )
                      ],
                    ),
                  ),

                  TextButton(
                      onPressed: () async {

                      },
                      child: Text('Forgot Password?'),
                      style: TextButton.styleFrom(
                          primary: Colors.red
                      )
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}