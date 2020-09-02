import 'package:flutter/material.dart';
import 'package:fru/services/auth.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fru Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().handleAuth(),
      debugShowCheckedModeBanner: false,
    );
  }
}
