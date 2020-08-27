import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_p/modules/signup_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Sign in to Continue",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: Colors.black45),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Username",
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
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
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
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: Colors.blueAccent,
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
                      onPressed: () {},
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
                            "Login",
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
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupPage();
                        }));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: Colors.blueAccent,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
