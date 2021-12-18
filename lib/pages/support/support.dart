import 'package:cadr/pages/homepage/homepage.dart';
import 'package:cadr/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class SupportPage extends StatefulWidget {

  State<StatefulWidget> createState() {
    return _SupportPage();
  }
}

class _SupportPage extends State<SupportPage> {
  bool loading = false;

  File? sampleImage;
  late String _newsTitle;
  //late String _NewsContent;
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
      final Reference postImageRef = storage.ref().child("Posted Images");
      var timeKey = DateTime.now();

      final UploadTask uploadTask = postImageRef.child(timeKey.toString()
          + ".jpg").putFile(sampleImage!);

      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      url = imageUrl.toString();

      //print("image url = " + url);
      goToHomePage();
      saveToDataBase(url);
    }
  }
  void saveToDataBase(String url) {
    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MMM d, yyyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {
      "image": url,
      "description": _newsTitle,
      "date": date,
      "time": time,
    };
    ref.child("Posts").push().set(data);
  }

  void goToHomePage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage()));
  }


  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("UPLOAD  ",
                  style: TextStyle( color: Colors.black)
              ),
              Text("NEWS",
                  style: TextStyle( color: Colors.red)
              )
            ],
          )
      ),

      body: Container(
        child: sampleImage == null?  Text(
          "Please Select the Camera Icon to Continue",

        ): enableUpload(),
      ),

      floatingActionButton: FloatingActionButton (
        backgroundColor: Colors.transparent,
        tooltip: 'ADD IMAGE',
        child: Icon(
          Icons.add_a_photo,
          color: Colors.red,
        ),
        onPressed:getImage,
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
                child: FittedBox(
                  //fit: BoxFit.cover,
                    child: Image.file(sampleImage!,
                      width: 400.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    )
                ),
              ),
              // sampleImage != null ?
              //
              // SizedBox(height: 15.0):
              TextFormField(
                decoration: InputDecoration(labelText: 'News Description'),
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'Please Include Topic';
                  }else{
                    return null;
                  }
                },

                onSaved: (value) {
                  _newsTitle = value!;
                },

              ),
              // Text area Field
              TextField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'News Content',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                ),


              ),
              //SizedBox(height: 35.0),

              //
              Container(
                //width : 300,
                width :MediaQuery.of(context).size.width,
                child: RaisedButton (

                  elevation: 10.0,
                  child: Text("Post News"),
                  textColor: Colors.white,
                  color: Colors.green,

                  onPressed: validateAndSaveImage,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

