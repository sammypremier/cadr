import 'package:firebase_auth/firebase_auth.dart';



class AuthenticationService {
  final FirebaseAuth _authenticate;

  AuthenticationService(this._authenticate);

  Stream<User?> get authStateChanges => _authenticate.idTokenChanges();


  // Log out function
  Future signOut() async {
    try {
      return await _authenticate.signOut();
    } catch(e){
      print(e.toString());
      //return null;
    }
  }
  //Register Function
  Future registerUser (String email, String password) async {
    try {
      await _authenticate.createUserWithEmailAndPassword(
          email: email, password: password
      );
      return "Logged in";
      //return user;
    }catch(e){
      print(e.toString());
      //return null;
    }
  }

  //Loginuser method
  Future loginUser (String email, String password) async {
    try {
      await _authenticate.signInWithEmailAndPassword(
          email: email, password: password
      );
      return "Logged in";
    }catch(e){
      print(e.toString());
      //return null;
    }
  }
}