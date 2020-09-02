import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fru/screens/home_page.dart';
import 'package:fru/screens/login_page.dart';
import 'package:fru/services/users.dart';


class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return Login();
          }
        });
  }

  User _userFromFirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future getCurrentUser() async {
    return await _auth.currentUser();
  }


  Future signInEmailAndPass(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseuser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpwithEmailandPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseuser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);

  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}
