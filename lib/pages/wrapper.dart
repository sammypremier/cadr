import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/pages/upload/uploadnews.dart';
import 'package:cadr/pages/welcomepage/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admin/adminhome.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = context.watch<User?>();
    print(user);
    if (user == null) {
      //return HomePage();
      return WelcomePage();
      //return AdminHome();
    }else{
      //return WelcomePage();
      return HomePage();
    }
  }
}
