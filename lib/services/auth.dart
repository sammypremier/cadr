import 'package:firebase_auth/firebase_auth.dart';
import 'package:cadr/models/user.dart';

class AuthenticationService {
  //final FirebaseAuth _authenticate;

  // AuthenticationService(this._authenticate);
   Stream<User?> get authStateChanges => _authenticate.idTokenChanges();


  final FirebaseAuth _authenticate = FirebaseAuth.instance;

  // User? _userFromFirebaseUser(UserCredential user) {
  //   return user!= null ? UserObject(uid: user.id): null;
  // }
  //
  // Stream<User?> get user {
  //   return _authenticate.onAuthStateChanges.map(_userFromFirebaseUser);
  // }







  //Register Function
  Future registerUser (String email, String password) async {
      try {
      UserCredential result = await _authenticate.createUserWithEmailAndPassword(
      email: email, password: password
      );
      User? user = result.user;
      return user?.uid;

      }catch(e){
        print(e.toString());
        return null;
      }
  }



  //Loginuser method
  Future loginUser(String email, String password) async {
     try {
       UserCredential result = await _authenticate.signInWithEmailAndPassword(
           email: email, password: password
       );
       User? user = result.user;
       return user?.uid;
     }catch(e){
       print(e.toString());
       return null;
     }
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

}