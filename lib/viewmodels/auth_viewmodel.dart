import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'; 

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthViewmodel with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  GoogleSignIn _googleSignIn;
  Status _status = Status.Uninitialized;

  AuthViewmodel.instance()
      : _auth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Status get status => _status;
  User get user => _user;

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating; 
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated; 
      notifyListeners();
      return false;
    }
  }
  
  Future<bool> signInWithGoogle() async {
    try {
      _status = Status.Authenticating; 
      notifyListeners();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated; 
      notifyListeners();
      return false;
    }

  }

  Future signOut() async {
    _auth.signOut();
    _googleSignIn.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated; 
    } 
    notifyListeners();
  }

}