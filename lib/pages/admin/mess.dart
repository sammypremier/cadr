import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MESS extends StatefulWidget {
  const MESS({Key? key}) : super(key: key);

  @override
  _MESSState createState() => _MESSState();
}

class _MESSState extends State<MESS> {

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New  ",
                  style: TextStyle( color: Colors.black)
              ),

              Text("Message ",
                  style: TextStyle( color: Colors.red)
              )

            ],
          )
      ),


      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  //Logic of the Message Title form
                  validator:(value) {
                    if (value!.isEmpty) {
                      return 'Please Input Title';
                    }else{
                      return null;
                    }
                  },
                  onSaved: (value) {
                    //messageTitle = value!;
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
