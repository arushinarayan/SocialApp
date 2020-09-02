import 'package:flutter/material.dart';
import 'package:fru/services/auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                  AuthService().signOut();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Icon(
                    MdiIcons.logout,
                    color: Colors.black,
                    size: 25,
                  ),
                )
            )
          ],
        ),
      body: Center(
            child: Text(
            "View Profile",
        ),
    )
    );
  }
}
