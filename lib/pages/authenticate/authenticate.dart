import 'package:cadr/pages/authenticate/loginpage.dart';
import 'package:cadr/pages/authenticate/registrationpage.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}


class _AuthenticateState extends State<Authenticate> {

  bool showLoginPage = true;
  void toggleView() {
    setState(() => showLoginPage = !showLoginPage);
  }

  @override
  Widget build(BuildContext context) {
      if (showLoginPage) {
        return RegistrationPage(toggleView:toggleView);
      }else{
        return LoginPage(toggleView:toggleView);

      }
  }
}
