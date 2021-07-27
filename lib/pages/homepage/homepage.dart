import 'package:cadr/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cadr/services/auth.dart';


class HomePage extends StatelessWidget {
  final AuthenticationService _authenticate = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[200],
        title: Text("CADR"),
        //elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text(""),
              onPressed: () async {
                // Sign out on clicked
                await _authenticate.signOut();
              }
          )
        ],
      )

    );
  }
}
