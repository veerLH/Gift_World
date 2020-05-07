
import 'package:flutter/material.dart';

Widget drawerWidget(BuildContext context){
  bool _islooad=false;
  return Drawer(
    child: ListView(
      children: <Widget>[

        _islooad==false?Container(
            color: Colors.orangeAccent.withOpacity(0.6),
            height: 200,
            padding: EdgeInsets.only(top: 20,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.orangeAccent.withOpacity(0.5),
                      backgroundImage: AssetImage("img/splash/birthday.png")),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Zin Lynn Htun",style: TextStyle(
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("zinlynnhut7979@gmail.com",style: TextStyle(
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 19
                  ),),
                )


              ],
            )
        ):Container(),
        ListTile(leading: Icon(Icons.home,color: Colors.red,), title: Text("Home"),onTap: (){
          _viewProduct(context);
        },),
        ListTile(leading: Icon(Icons.grid_on,color: Colors.red,), title: Text("Products"),onTap: (){
          _viewProduct(context);
        },),

        ListTile(leading: Icon(Icons.contacts,color: Colors.red,), title: Text("Contact Us"),onTap: (){
          _viewProduct(context);
        },),
        ListTile(leading: Icon(Icons.email,color: Colors.red,), title: Text("Login"),onTap: (){
          Navigator.pushNamed(context, '/login');
        },),
        ListTile(leading: Icon(Icons.info,color: Colors.red,), title: Text("Register"),onTap: (){
          _viewProduct(context);
        },),
      ],
    )
    );
}

_viewProduct(context){
  Navigator.of(context).pop();
}