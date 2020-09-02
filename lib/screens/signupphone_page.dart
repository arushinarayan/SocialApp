import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fru/screens/login_page.dart';
import 'package:fru/screens/signup_page.dart';
import 'package:fru/services/auth.dart';

import 'home_page.dart';

class SignupPhone extends StatefulWidget {
  @override
  _SignupPhoneState createState() => _SignupPhoneState();
}

class _SignupPhoneState extends State<SignupPhone> {
  final _formKey = GlobalKey<FormState>();
  String name, phoneNo, verificationId, smssent;
  AuthService authService = new AuthService();

  bool codeSent = false;

  signUpwithPhone() {
    if (codeSent==true){
      authService.signInWithOTP(smssent, verificationId);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
    else
      verifyPhone(phoneNo);
  }


  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Text("Create Account,", style: TextStyle(fontSize: 26, fontFamily: 'Montserrat', fontWeight: FontWeight.w300,),),
                  SizedBox(height: 6,),
                  Text("Sign up to get started!", style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w300, color: Colors.grey.shade400),),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 16,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    validator: (val) => val.length < 2
                        ? "Name must be more than 2 letters"
                        : null,
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: "(+91) Phone Number",
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      validator: (val) => validateMobile(val)
                          ? null
                          : "Enter valid phone number",
                      onChanged: (val) {
                        phoneNo = val;
                      }
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  codeSent ? TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "OTP",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        onChanged: (val) {
                          setState(() {
                            this.smssent = val;
                          });
                        },
                      ): Container(),

                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        signUpwithPhone();
                      },
                      padding: EdgeInsets.all(0),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xD9D95B00),
                              Color(0xD9D95B00),
                              Color(0x91FFA800),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minHeight: 50, maxWidth: 300),
                          child: codeSent? Text("Sign up", style: TextStyle(fontSize: 25, fontFamily: 'Montserrat', fontWeight: FontWeight.w300, color: Colors.white), textAlign: TextAlign.center,)
                              : Text ("Verify", style: TextStyle(fontSize: 25, fontFamily: 'Montserrat', fontWeight: FontWeight.w300, color: Colors.white), textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Login();
                        }));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: Colors.blueAccent),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Signup();
                          }));
                        },
                        child: Text(
                          "Sign Up with Email",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                              color: Colors.blueAccent),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool validateMobile(String value) {
  Pattern phpattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(phpattern);
  return (!regExp.hasMatch(value)) ? false : true;
}
