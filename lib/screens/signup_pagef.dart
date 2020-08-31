import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fru/screens/home_page.dart';
import 'package:fru/screens/login_page.dart';
import 'package:fru/services/auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String email, password, name;
  AuthService authService = new AuthService();

  bool _isLoading = false;

  signUp() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      authService.signUpwithEmailandPassword(email, password).then((val) {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:_isLoading
        ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )

          : Form(
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
                      labelStyle: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.w300, color: Colors.blueGrey,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blueGrey
                        ),
                      ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blueGrey
                        ),
                      )
                    ),
                    validator: (val) => validateEmail(val)
                        ? null
                        : "Enter correct email",
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
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
                    validator: (val) => val.length < 6
                        ? "Password must be 6+ characters"
                        : null,
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
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
                    validator: (val) => val.length < 6
                        ? "Password must be 6+ characters"
                        : null,
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        return signUp();
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
                          child: Text("Sign up", style: TextStyle(fontSize: 25, fontFamily: 'Montserrat', fontWeight: FontWeight.w300, color: Colors.white), textAlign: TextAlign.center,
                          ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}