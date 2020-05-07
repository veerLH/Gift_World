import 'dart:async';

import 'package:flutter/material.dart';



class My_Splash extends StatefulWidget {
  @override
  _My_SplashState createState() => _My_SplashState();
}

class _My_SplashState extends State<My_Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async{
    Navigator.pushReplacementNamed(context,'/home');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 120,
            backgroundColor: Colors.white.withOpacity(0.8),
            child: CircleAvatar(
              radius: 110,
              backgroundColor: Colors.orangeAccent.withOpacity(0.5),
              backgroundImage: AssetImage('img/splash/birthday.png'),
            ),
          ),

          Text("Gift World",style: TextStyle(
              fontFamily: 'Oswald',
              color: Colors.black,
              decoration: TextDecoration.none
          ),),
          SizedBox(
            width: 20.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
              strokeWidth: 7.0,
            ),
          )

        ],
      ),
    );
  }
}

