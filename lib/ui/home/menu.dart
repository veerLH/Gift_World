import 'package:flutter/material.dart';

Widget Menu(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Menu",style: TextStyle(
          fontFamily: 'Oswald',
          color: Colors.black87,
          letterSpacing: 3.5,
          fontSize: 24
      ),),

      Container(
        height: 50,
        margin: EdgeInsets.all(1.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2/1,child: Chip(
              shadowColor: Colors.grey.shade800,
              backgroundColor: Color(0xFFfaecfb),
              elevation: 5,
              avatar: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('img/menuicon/palette.png',width: 20,),
              ),
              label: Text("Art"),
            ),),
            AspectRatio(
              aspectRatio: 4/2,
              child: Chip(
                shadowColor: Colors.grey.shade800,
                backgroundColor: Color(0xFFfaecfb),
                elevation: 5,
                avatar: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset('img/menuicon/nature.png',width: 20,),
                ),
                label: Text("Floral"),
              ),),

            AspectRatio(
              aspectRatio: 3/1,child: Chip(
              shadowColor: Colors.grey.shade800,
              backgroundColor: Color(0xFFfaecfb),
              elevation: 5,
              avatar: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('img/menuicon/cup.png',width: 20,),
              ),
              label: Text("Hand Made"),
            ),),

            AspectRatio(
              aspectRatio: 2/1,child: Chip(
              shadowColor: Colors.grey.shade800,
              backgroundColor: Color(0xFFfaecfb),
              elevation: 5,
              avatar: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('img/menuicon/animal.png',width: 20,),
              ),
              label: Text("Toys"),
            ),),

          ],
        ),
      )


    ],
  );
}