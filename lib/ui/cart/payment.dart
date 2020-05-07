import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zingift/ui/home/title.dart';


class paymentPage extends StatefulWidget {
  @override
  _paymentPageState createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  List<dynamic> feature_photo=[];
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null)
    {
      feature_photo= json.decode(arguments['feature_photo']);
      print(feature_photo.length);
      print(arguments['name'].toString());
      print(arguments['main_photo'].toString());
      print(arguments['feature_photo']);
      print(arguments['description'].toString());
      print(arguments['price']);
      print(arguments['qty']);
    };
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent.withOpacity(0.8),
        title: titleWidge("Payment"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30,bottom: 10,left: 30,right: 30),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Easy Pay for Product",style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'Bitter',
                color: Colors.blue,
              ),),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Card(
              margin: EdgeInsets.only(top: 20,bottom: 10,left: 30,right: 30),
              elevation: 2,
              child: Row(

                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),

                        image: DecorationImage(
                            image: AssetImage('img/payment/kbz_pay.png'),
                            fit: BoxFit.cover)
                    ),
                  ),
                  Text("KBZ Payment",style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bitter',
                    color: Colors.black,
                  ),)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Card(
              margin: EdgeInsets.only(top: 10,bottom: 10,left: 30,right: 30),
              elevation: 2,
              child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),

                        image: DecorationImage(
                            image: AssetImage('img/payment/wave_pay.png'),
                            fit: BoxFit.cover)
                    ),
                  ),
                  Text("WavePay ",style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bitter',
                      color: Colors.black
                  ),)
                ],
              ),
            ),
          ),
          
          Expanded(
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withOpacity(0.8),

              child: CircleAvatar(
                radius: 90,
                backgroundColor: Colors.orangeAccent.withOpacity(0.5),
                backgroundImage: AssetImage('img/splash/birthday.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
