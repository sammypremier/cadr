
import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegistrationPage extends StatefulWidget {

  final Function toggleView;
  RegistrationPage({ required this.toggleView });

  @override
  _RegistrationPage createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  final AuthenticationService _authenticate = AuthenticationService();

  //Text Field State
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String error = "";

  final formKey = GlobalKey<FormState>();


  //Name Validation Method
  String? validateName(value) {
    if(value.isEmpty) {
      return "Name cannot be Empty";
    }else if(value < 2) {
      return "Name must be at least two characters";
    }else if(value > 25) {
      return "Name Cannot be longer than 25 Characters";
    }else{
      return null;
    }
  }

  // Password Validation Method
  String? validatePassword(value) {
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
            10.0
        ),

        //Registration Form
        child: Center(
          child: Form(
            autovalidate: true,
            key: formKey,

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
                  TextFormField(
                    onChanged: (val) {
                      setState(() => firstName = val);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),

                        labelText: "First Name"
                    ),
                    validator: validateName,
                  ),

                  // First Name Padding
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                  ),

                  //Last Name Column
                  TextFormField(
                    onChanged: (val) {
                      setState(() => lastName = val);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),

                        labelText: "Last Name"
                    ),
                    validator: validateName,
                  ),

                  //Last Name Padding
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                  ),

                  //Email Column
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

                  // Email Padding
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                  ),

                  // Password Field
                  TextFormField(
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


                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                  ),

                  FlatButton.icon(
                    onPressed: () async {
                      if(formKey.currentState!.validate()){
                        print ("Error, Form Cannot be validated");
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      }else {
                        dynamic result = await _authenticate.registerToDataBase(firstName, lastName, email, password);

                        if (result == null ) {
                          setState(() => error = "Please check the information you provided");
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