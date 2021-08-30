import 'dart:async';

import 'package:cadr/pages/wrapper.dart';
import 'package:cadr/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

    runApp(Cadr());


}

//The Root Method that runs the application.
class Cadr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthenticationService>().
                                            authStateChanges, initialData: null, 
          ),
        ],
        child: MaterialApp(
          title: "CADR",
          home: Wrapper(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          )

        )
    );
  }
}