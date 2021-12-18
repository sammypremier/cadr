import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/cadr_logo2.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
        child: SpinKitCircle(
          color: Colors.lightGreen,
          size: 50.0,
        ),

      ),
    );
  }
}
