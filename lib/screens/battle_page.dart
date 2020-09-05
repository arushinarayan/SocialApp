import 'package:flutter/material.dart';
class BattlePage extends StatefulWidget {
  @override
  _BattlePageState createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 400,
        
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("\t\t\t\tOpen Battles", 
            style: TextStyle(
            fontSize: 28.0, color: Colors.black,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic
            
          ),
          ),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
              decoration: BoxDecoration(
                color: const Color(0xff888888),
                border: Border.all(
                  color: const Color(0xff888888),
                    width: 68,
                    ),
                    borderRadius: BorderRadius.circular(12),
                      shape: BoxShape.rectangle
              ),
             ),
             Container(
              decoration: BoxDecoration(
                color: const Color(0xff888888),
                border: Border.all(
                  color: const Color(0xff888888),
                    width: 68,
                    ),
                    borderRadius: BorderRadius.circular(12),
                      shape: BoxShape.rectangle
              ),
             ),
            ],
          ),
          Text("\t\t\t\tCommunity Battles", 
            style: TextStyle(
            fontSize: 28.0, color: Colors.black,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic
            
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
              decoration: BoxDecoration(
                color: const Color(0xff888888),
                border: Border.all(
                  color: const Color(0xff888888),
                    width: 68,
                    ),
                    borderRadius: BorderRadius.circular(12),
                      shape: BoxShape.rectangle
              ),
             ),
             Container(
              decoration: BoxDecoration(
                color: const Color(0xff888888),
                border: Border.all(
                  color: const Color(0xff888888),
                    width: 68,
                    ),
                    borderRadius: BorderRadius.circular(12),
                      shape: BoxShape.rectangle
              ),
             ),
            ],
          ),
          ],
        )
        
      )
    );
  }
}
