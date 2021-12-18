import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/shared/loading.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class CreateEvent extends StatefulWidget {

  State<StatefulWidget> createState() {
    return _CreateEventState();
  }
}

class _CreateEventState extends State<CreateEvent> {
  bool loading = false;

  TextEditingController _eventDetailsController = TextEditingController();
  bool _validate = false;




  File? sampleImage;
  late String topic;
  late String venue;
  late String eventDate;
  late String details;
  late String url;
  final formKey = GlobalKey<FormState>();


  Future getImage() async {
    final sampleImage = await ImagePicker().pickImage(
        source: ImageSource.camera);
    if (sampleImage == null) {
      return 'No File Selected';
    }else{
      final tempImage = File(sampleImage.path);
      setState(() =>this.sampleImage = tempImage);
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate() ) {
      form.save();
      return true;
    }
    else{
      return false;
    }
  }



  Future validateAndSaveImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    if (validateAndSave()) {
      final Reference postImageRef = storage.ref().child("Posted Events");
      var timeKey = DateTime.now();

      final UploadTask uploadTask = postImageRef.child(timeKey.toString()
          + ".jpg").putFile(sampleImage!);

      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      url = imageUrl.toString();

      goToHomePage();
      saveEventToDataBase(url);
    }
  }
  void saveEventToDataBase(String url) {
    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MMM d, yyyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {
      "image": url,
      "topic": topic,
      "venue": venue,
      "eventDate": eventDate,
      "details": details,
      "date": date,
      "time": time,
    };
    ref.child("PostedEvents").push().set(data);
  }

  void goToHomePage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage()));
  }


  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Create  ",
                  style: TextStyle( color: Colors.black)
              ),
              Text("Event",
                  style: TextStyle( color: Colors.red)
              )
            ],
          )
      ),

      body: Container(
        child: enableUpload()
      ),
    );
  }


  // Upload picture Method

  Widget enableUpload() {
    return Container(
      child: Form(
        key: formKey,

        child: SingleChildScrollView(
          child: Column (
            children: <Widget>[
              Container(
                height: 300.0, width: MediaQuery.of(context).size.width,
                child: sampleImage == null?
                Text(
                    'Remember that you cannot continue from here without image'
                ): Container(
                      child: FittedBox(
                    //fit: BoxFit.cover,
                        child: Image.file(sampleImage!,
                        width: 400.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      )
                  ),
                )
              ),
              // sampleImage != null ?
              //
              // SizedBox(height: 15.0):
              TextFormField(
                decoration: InputDecoration(labelText: 'Topic'),
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'Please Include Topic';
                  }else{
                    return null;
                  }
                },

                onSaved: (value) {
                  topic = value!;
                },

              ),

              TextFormField(
                decoration: InputDecoration(labelText: 'Venue'),
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'Please Include Venue';
                  }else{
                    return null;
                  }
                },

                onSaved: (value) {
                  venue = value!;
                },

              ),

              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'Please Include Topic';
                  }else{
                    return null;
                  }
                },

                onSaved: (value) {
                  eventDate = value!;
                },

              ),

              // Text area Field
              TextField(
                  controller: _eventDetailsController,

                  decoration: InputDecoration(
                    errorText: _validate ?
                    'Message Field cannot be Empty' : null,
                    hintText: 'Event Details',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey
                        )
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                ),


              ),

              //Floating Action Button to Add picture
              FloatingActionButton (
                backgroundColor: Colors.transparent,
                tooltip: 'ADD A GRAPHIC IMAGE OF THE EVENT ',
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.red,
                ),
                onPressed: () async {
                  if( getImage() == true) {
                    getImage;
                    setState(() => loading = true);
                  }else{
                    loading = false;
                  }


              }
              ),
              //SizedBox(height: 35.0),

              //
              Container(
                //width : 300,
                width :MediaQuery.of(context).size.width,
                child: RaisedButton (
                  elevation: 10.0,
                  child: Text("Create Event"),
                  textColor: Colors.white,
                  color: Colors.green,

                  onPressed: () async {
                    setState(() {
                      _eventDetailsController.text.isEmpty ?
                      _validate = true : details = _eventDetailsController.text.trim();
                    });

                    validateAndSaveImage();
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
