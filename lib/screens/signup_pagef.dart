import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_p/modules/otp.dart';

class SignupPage extends StatelessWidget {
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
                    "Create Account,",
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Sign up to get started!",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade400
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: Colors.blueGrey,
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,),
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
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
                  ),
                  GestureDetector(
                    onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) {
                        return Otp();
                       }));
                    },
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
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
                          constraints:
                              BoxConstraints(minHeight: 50, maxWidth: 300),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "I'm already a member.",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign in.",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: Colors.blueAccent),
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
