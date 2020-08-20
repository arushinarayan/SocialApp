import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fru/screens/home_page.dart';
import 'package:fru/screens/signup.dart';
import 'package:fru/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new AuthService();

  bool _isLoading = false;

  signIn() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      authService.signInEmailAndPass(email, password).then((val) {
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
      body: _isLoading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
          : Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Text("Welcome",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                  SizedBox(height: 6,),
                  Text("Log in to Continue",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 16,),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        )
                    ),
                    validator: (val) {
                      return val.isEmpty ? "Enter Email ID" : null;
                    },
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        )
                    ),
                    validator: (val) {
                      return val.isEmpty ? "Enter Password" : null;
                    },
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  SizedBox(height: 18,),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Forgot Password", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black87, decoration: TextDecoration.underline),),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: (){},
                        padding: EdgeInsets.all(0),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xffff5f6d),
                                Color(0xffff5f6d),
                                Color(0xffffc371),
                              ],
                            ),
                          ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(maxWidth: 300,maxHeight: 50),
                              child: Text("Log In",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                            ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?", style: TextStyle(fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Signup();
                        }));
                      },
                      child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87, decoration: TextDecoration.underline),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
