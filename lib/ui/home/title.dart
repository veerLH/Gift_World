
import 'package:flutter/material.dart';

Widget titleWidge(String str){

  return Row(

    children: <Widget>[
      Text(str,style: TextStyle(
          fontFamily: 'Oswald',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 32
      ),),

    ],
  );

}