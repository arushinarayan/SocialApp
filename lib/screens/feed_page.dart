import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'messages_page.dart';
import 'battle_page.dart';

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
      body: Container(
        width: 450,
        height: 590,
        //color: Colors.blue,
        padding: EdgeInsets.only(left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Expanded(child:
                Container(
                  height: 130,
                  width: 90,
                  //padding: EdgeInsets.only(right: 10),
                  //color: Colors.lime,
                  decoration: BoxDecoration(
                    //shape: BoxShape.rectangle,
                    color: Colors.grey,
                    //color: const Color(0xff888888),
                    border: Border.all(
                    //color: Colors.grey
                    color: const Color(0xff888888),
                    //width: 38,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                //),
                /*Container(
                  child: Text("\t")
                ),*/
                //Expanded(child:
                 Container(
                   height: 130,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    border: Border.all(
                    color: const Color(0xff888888),
                    //width: 48,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                //),
                 Container(
                   height: 130,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    border: Border.all(
                    color: const Color(0xff888888),
                    //width: 48,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                   height: 130,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                    border: Border.all(
                    color: const Color(0xff888888),
                    //width: 48,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Container(
                      height: 40,
                      width: 130,
                      child: FlatButton(
                        onPressed: (){
                          return FeedPage();
                        },
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
                            child: Text("Feed",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "\t\t\t"
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 130,
                      child: FlatButton(
                        onPressed: (){
                          return BattlePage();
                        },
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
                            child: Text("Battle Info",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
              ],
            ),

            Container(
                  height: 140,
                  width: 320,
                  //padding: EdgeInsets.only(right: 10),
                  //color: Colors.lime,
                  decoration: BoxDecoration(
                    //shape: BoxShape.rectangle,
                    color: Colors.grey,
                    //color: const Color(0xff888888),
                    border: Border.all(
                    //color: Colors.grey
                    color: const Color(0xff888888),
                    //width: 38,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 140,
                  width: 320,
                  //padding: EdgeInsets.only(right: 10),
                  //color: Colors.lime,
                  decoration: BoxDecoration(
                    //shape: BoxShape.rectangle,
                    color: Colors.grey,
                    //color: const Color(0xff888888),
                    border: Border.all(
                    //color: Colors.grey
                    color: const Color(0xff888888),
                    //width: 38,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
          ],
        )
      )
     /*Center(
        child: Text(
          "View Feed",
        ),*/
      //), 
    );
  }
}
