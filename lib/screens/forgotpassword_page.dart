import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           Column(
          children: <Widget>[
            SizedBox(height: 16),
            Center(
              child: TextField(
                controller: editController,
                decoration: InputDecoration(
                    labelText: "Email ID",
                    labelStyle:
                    TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: Colors.black45),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black45,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    )
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  resetPassword(context);
                },
                padding: EdgeInsets.all(0),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xD9D95B00),
                        Color(0xD9D95B00),
                        Color(0x91FFA800),
                      ],
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints:
                    BoxConstraints(maxWidth: 300, maxHeight: 50),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
  ] ),
      ) );
  }

  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
        msg:
        "Reset password link has sent your mail please use it to change the password.");
    Navigator.pop(context);
  }
}
