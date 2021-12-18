import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/shared/loading.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YoutubeLink extends StatefulWidget {

  @override
  YoutubeLinkState createState() => YoutubeLinkState();
}

class YoutubeLinkState extends State<YoutubeLink> {
  bool loading = false;
  final utube=RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");

  TextEditingController _contentController = TextEditingController();
  bool _validate = false;

  final _formKey = GlobalKey<FormState>();
  late String _videoTitle;
  late String _videoLink;
  late String image;


  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate() ) {
      form.save();
      return true;
    }
    else{
      return false;
    }
  }


  void saveMessageToDatabase() {
    DatabaseReference dbRef = FirebaseDatabase.instance.reference();

    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MMM d, yyyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);




    var data = {
      "title": _videoTitle,
      "date": date,
      "time": time,
      "content": _videoLink,
      "image": image,
    };
    //FirebaseFirestore.instance.collection("messagesFolder").add(data);
    dbRef.child("YoutubeLinkFolder").push().set(data);
    //
    // Flushbar(
    //   title: 'Link Added',
    //   message: 'updating...'
    // )

    goToHomePage();

  }


  void goToHomePage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage()));
  }



  @override

  void initState() {
    super.initState();
    _UploadMessageToDatabase();
  }


  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Add  ",
                    style: TextStyle( color: Colors.black)
                ),

                Text("New Link ",
                    style: TextStyle( color: Colors.red)
                )

              ],
            )
        ),

        body: Container(
            child: _UploadMessageToDatabase()
        )
    );
  }

  Widget _UploadMessageToDatabase() {
    return Container(
      child: Container(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          // Registration Columns
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Top Logo
                Container(
                  child: Image(
                    image: AssetImage("assets/sms logo.jpg"),
                    height: 150,
                    width: 150,
                  ),

                ),

                Card(
                  elevation: 10.0,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      TextFormField(
                        //Logic of the Message Title form
                        validator:(value) {
                          if (value!.isEmpty) {
                            return 'Please Input Title';
                          }else{
                            _videoTitle = value;
                          }
                        },


                        onSaved: (value) {
                          _videoTitle = value!;
                        },

                        //Decoration of the Message Title form
                        decoration: InputDecoration(
                          labelText: 'Title',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              )
                          ),
                        ),
                      ),


                      // Email Padding
                      Padding(
                        padding: EdgeInsets.only(
                          top: 45.0,
                        ),
                      ),

                      TextField(
                        controller: _contentController,
                        decoration: InputDecoration(
                          labelText: 'Input A link',
                          errorText: _validate ?
                          'Field cannot be Empty' : null,

                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              )
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                        ),

                      ),


                      Padding(
                        padding: EdgeInsets.only(
                          top: 55.0,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: 55.0,
                  ),
                ),

                FlatButton.icon(
                  onPressed: () async {
                    setState(() {
                      _contentController.text.isEmpty ?
                      _validate = true : _videoLink = _contentController.text.trim();
                    });
                    saveMessageToDatabase();
                  },
                  icon: Icon(
                    Icons.assignment_ind_outlined,
                  ),
                  label: Text("Post"),
                  color: Colors.green,
                  minWidth: 350,
                  height: 40,
                ),
              ],
            ),


          ),
        ),
      ),
    );
  }
}
