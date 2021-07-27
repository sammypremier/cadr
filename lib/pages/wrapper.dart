import 'package:cadr/models/user.dart';
import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/pages/welcomepage/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return WelcomePage();
    }else{
      return HomePage();
    }
  }
}
