import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {

  final Function toggleView;
  LoginPage({ required this.toggleView });

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final AuthenticationService _authenticate = AuthenticationService();

  //Text Field State
  String email = "";
  String password = "";

  final GlobalKey _formKey = GlobalKey<FormState>();

  // void validate(){
  //   if(_formkey.currentState!.validate()) {
  //     print ("Validated");
  //   }else{
  //     print ("Not Validated");
  //   }
  // }

  String? validatePassword(value){
    if(value.isEmpty){
      return "Password cannot be empty";
    }else if(value.length < 10){
      return "Password characters cannot be less than 10";
    }else if (value.length > 15) {
      return "Password Characers cannot be more than 15";
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],

      body: Container(
        padding: EdgeInsets.all(
            25.0
        ),
        child: Center(
          child: Form(
            autovalidate: true,
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
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),

                        labelText: "Email"
                    ),

                    validator: MultiValidator(
                        [
                          RequiredValidator(errorText: "Email Cannot be Empty"),
                          EmailValidator(errorText: "Not a Valid Email."),
                        ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          labelText: "Password"
                      ),
                      validator: validatePassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: FlatButton.icon(
                      onPressed: () async {
                        print(email);
                        print(password);
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

                  // Anonymous Lo

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}