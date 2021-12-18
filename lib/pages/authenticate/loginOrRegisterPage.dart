import 'package:cadr/pages/admin/adminhome.dart';
import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/services/auth.dart';
import 'package:cadr/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _authenticate = FirebaseAuth.instance;
final AuthenticationService _authService=  AuthenticationService();

class LoginOrRegister extends StatefulWidget {

  State<StatefulWidget> createState() {
    return _LoginOrRegister();
  }
}

enum FormType {
  login,
  register
}

class _LoginOrRegister extends State<LoginOrRegister> {

  //toast function for login success
  void login_success() {
    Fluttertoast.showToast(
        msg: 'you have successfully logged in',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightGreenAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
//toast function for login error
  void login_error() {
    Fluttertoast.showToast(
        msg: 'Error logging In',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


//toast function for Register Success
  void register_success() {
    Fluttertoast.showToast(
        msg: 'you have successfully registered, You can now login',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightGreenAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

//toast function for register_error
  void register_error() {
    Fluttertoast.showToast(
        msg: 'Error occur during Registration, Try Again',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightGreenAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  _launchURL(String url) async {
    if (!await launch(url)) {
    }else{
      throw 'Unable to open  $url';
    }
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  late User? user;

  @override
  void initState() {
    _authenticate.userChanges().listen((event) => setState(() => user = event));
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  FormType _formType = FormType.login;

  String _email = "";
  String _password = "";
  String error = "";

  //methods that checks the input fields for necessary actions in the form
  Object validateAndSave() {
    final form = _formKey.currentState!;

    if(form.validate()) {
      form.save();
      return true;

    }else {
      return false;
    }
  }

  // Method to switch to registration page
  void moveToRegister() {
    _formKey.currentState?.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

  // Method to switch to login page
  void moveToLogin() {
    _formKey.currentState?.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        padding: EdgeInsets.all(
            25.0
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createInputs() + createButtons()
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Inputs widget for email and password fields
  List<Widget> createInputs() {
    return[
      //SizedBox(height: 10.0),
      logo(),
      SizedBox(height: 50.0),
      TextFormField (
        controller : _emailController,
        decoration: InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Icons.mail_outline),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF05818F),
                )
            )

        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email Cannot be Empty';
          }else {
            setState(() => error = 'Please input a valid Email Address');
          }
        },
      ),
      SizedBox(height: 5.0),
      Text(
        error,
        style: TextStyle(color: Colors.deepOrange, fontSize: 14.0)
      ),
      SizedBox(height: 10.0),

      TextFormField (
        controller : _passwordController,
          decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Icons.vpn_key_outlined),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF05818F),
                )
              )
          ),
          obscureText: true,


          validator: (value) {
            if (value!.isEmpty) {
              return 'Password cannot be empty';

            }else if(value.length < 8){
              return 'Password Characters must be more than 7';
            }else{
              null;
            }
          },
      ),
      SizedBox(height: 20.0),
    ];
  }

  //widget for the registration and login logo
  Widget logo() {
    return Hero(
      tag: 'hero',
      child: Container(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50.0,
          child: GestureDetector(
            onLongPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminHome()));
            },
            child: Image(
              image: AssetImage("assets/cadr_logo.png"),
              height: 130,
              width: 130,
            ),
          ),
        ),
      ),
    );
  }

  //Registration and login Button Widgets
  List<Widget> createButtons() {
    if(_formType == FormType.login) {
      return[
        RaisedButton(
          child: Text("Login", style: TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          color: Color(0xFF05818F),

          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _email = _emailController.text;
              _password = _passwordController.text;
              setState(() => loading = true);
              dynamic result = await _authService.loginUser(_email, _password,);

              if (result != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                    login_success();

                // const String url = 'https://www.cadr.cymru/en/news.htm';
                // _launchURL(url);

              } else {
                setState((){
                  //error = 'Please input a valid credentials';
                  loading = false;
                  register_error();
                });
              }
            }
          },
        ),
//SignUp Button
        FlatButton(
          child: Text(
              "Not a member? Sign Up now",
              style: TextStyle(fontSize: 14.0)),
          textColor: Colors.yellow,

          onPressed: moveToRegister,
        ),

        FlatButton(
          child: Text(
              "forgot password?",
              style: TextStyle(fontSize: 14.0)),
          textColor: Colors.red,

          onPressed: moveToRegister,
        ),
      ];
    }else{
      return[
        RaisedButton(
          child: Text("Register", style: TextStyle(fontSize: 20.0)),
          textColor: Colors.white,
          color: Color(0xFF05818F),

          onPressed: () async {
            //final form = formKey.currentState!;
            if(_formKey.currentState!.validate()) {
              _email = _emailController.text;
              _password = _passwordController.text;
              setState(() => loading = true);
               dynamic result = await _authService.registerUser(
                 _email,
                 _password,
               );

              if (result != null) {
                loading = false;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginOrRegister()));
                    register_success();
              }
            }
          },
        ),

        FlatButton(
          child: Text("Already a member? Login Now", style: TextStyle(fontSize: 14.0)),
          textColor: Colors.yellow,

          onPressed: moveToLogin,
        ),
      ];
    }
  }
}