import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'messages_page.dart';
class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text("Hello, ${user?.displayName}",style: TextStyle(color: Colors.black), ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return MessagesPage();
                  }));
                },
                child: Icon(
                  Icons.message,
                  color: Colors.black,
                  size: 25,
                ),
              )
          )
        ],
      ),
      body: Center(
        child: Text(
          "View Feed",
        ),
      ),
    );
  }
}
