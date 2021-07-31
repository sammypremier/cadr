import 'package:firebase_auth/firebase_auth.dart';
import 'package:cadr/models/user.dart';

class AuthenticationService {
  final FirebaseAuth _authenticate = FirebaseAuth.instance;

  //create user object on the firebaseUser
  User? _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth Change User Streams
  Stream<User?> get user {
    return _authenticate.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }

  // Log out function
  Future signOut() async {
    try {
      return await _authenticate.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  //Register Function
  Future registerToDataBase (String email, String password) async {
    try {
      AuthResult result = await _authenticate.createUserWithEmailAndPassword(
          email: email, password: password
      );
      FirebaseUser user = result.user;
      //return _userFromFirebaseUser(user);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register Function
  Future loginUser (String email, String password) async {
    try {
      AuthResult result = await _authenticate.signInWithEmailAndPassword(
          email: email, password: password
      );
      FirebaseUser user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      //return null;
    }
  }
}