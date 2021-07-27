import 'package:cadr/models/user.dart';
import 'package:cadr/pages/wrapper.dart';
import 'package:cadr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() =>runApp(Cadr());

//The Root Method that runs the application.
class Cadr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "CADR",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}