import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  GoogleSignIn _googleSignIn;
  Status _status = Status.Uninitialized;
  String _errMessage = 'Something went wrong, try again';

  UserProvider.initialize()
      : _auth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Status get status => _status;
  User get user => _user;
  String get errMessage => _errMessage;

  Future<bool> signUp(String email, String password, String name) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await user.updateProfile(displayName: name);
      /* store users data in firestore database */
      await storeUserData(name, email);
      return true;
    } on FirebaseAuthException catch (e) {
      _status = Status.Unauthenticated;
      if (e.code == 'weak-password') {
        _errMessage = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        _errMessage = 'An account already exists with this email.';
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return false;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      _status = Status.Unauthenticated;
      switch (e.code) {
        case 'operation-not-allowed':
        case 'too-many-requests':
          _errMessage = 'Operation not allowed, please try again later';
          break;
        case 'user-not-found':
          _errMessage = 'User does not exist';
          break;
        case 'wrong-password':
          _errMessage = 'Email or password is incorrect';
          break;
      }
      print('Failed with error code: ${e.code}');
      print(e.message);
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
      await storeUserData(user.displayName, user.email);
      return true;
    } catch (e) {
      print('Google pop up error');
      print(e);
      _errMessage = 'Cancelled by user';
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
      print(_user);
    }
    notifyListeners();
  }

  Future storeUserData(String name, String email) async {
    await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
      "name": name,
      "email": email,
      "photoURL": user.photoURL,
      "createdAt": FieldValue
          .serverTimestamp(), // https://stackoverflow.com/questions/50907151/flutter-firestore-server-side-timestamp
      "updatedAt": FieldValue.serverTimestamp()
    });
    await user.reload();
    _user = _auth.currentUser;
  }
}
