import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zingift/model/cart/cart_model.dart';
import 'package:zingift/ui/home/bottom.dart';

class My_Detail extends StatefulWidget {
  @override
  _My_DetailState createState() => _My_DetailState();
}

class _My_DetailState extends State<My_Detail> {
  int index=1;
  List<dynamic> feature_photo=[];
  @override
  Widget build(BuildContext context) {
    final adddCart = Provider.of<cartModel>(context, listen: false);
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

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.orangeAccent.withOpacity(0.8),
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                background: app_detail(context,arguments['main_photo']),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add_circle_outline,
                                color: Colors.blue[600],),
                              SizedBox(width: 20,),
                              Text(arguments['name'], style: TextStyle(
                                fontFamily: 'Bitter',
                                color: Colors.black,
                                fontSize: 20,
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.attach_money, color: Colors.blue[600],),
                              SizedBox(width: 20,),
                              Text(
                                "${arguments['price']} MMK", style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15.0, left: 8.0, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.store, color: Colors.blue[600],),
                              SizedBox(width: 13,),
                              Text("Cash On Deliever Service", style: TextStyle(
                                fontFamily: 'Bitter',
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.timer, color: Colors.red,),
                              SizedBox(width: 13,),
                              Text('Duration', style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 30,),
                              Text("May Be 1 Week, after ordering this Product",
                                style: TextStyle(
                                  fontFamily: 'Bitter',
                                  color: Colors.black,
                                  fontSize: 14,
                                ),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.description, color: Colors.purple,),
                              SizedBox(width: 13,),
                              Text('Product Description', style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 30,),
                              Flexible(
                                child: Text(
                                  arguments['description'], style: TextStyle(
                                  fontFamily: 'Bitter',
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.contact_mail, color: Colors.green,),
                              SizedBox(width: 13,),
                              Text('Contact', style: TextStyle(
                                fontFamily: 'Oswald',
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 30,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("zinlynnhtun7979@gmail.com",
                                    style: TextStyle(
                                      fontFamily: 'Bitter',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("09973442267", style: TextStyle(
                                    fontFamily: 'Bitter',
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.description, color: Colors.green,),
                              SizedBox(width: 13,),
                              Text('Feature Photo', style: TextStyle(
                                fontFamily: 'Oswald',
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: feature_photo.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  width: 260.0,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              30),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "http://restaurantpos.tunlinaing.me/public/storage/${feature_photo[index]}"),
                                            fit: BoxFit.cover,
                                            colorFilter:
                                            ColorFilter.mode(Color(0xFFfaecfb),
                                                BlendMode.colorBurn),
                                          ),
                                        ),

                                      ),


                                    ],
                                  ),
                                );
                              }),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomPage(arguments),

      )
    );
  }
}

Widget app_detail(BuildContext context,photo){
  return Container(
    color: Colors.white,
    child: Stack(
      children: <Widget>[
        Card(

          elevation:8,
          color: Colors.black,
          child: Image.network('http://restaurantpos.tunlinaing.me/public/storage/${photo}',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity
            ,),),
        Positioned(
            top: 20,
            right: 20,
            child: Row(
              children: <Widget>[
                Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white
                    ),

                    child: IconButton(icon: Icon(Icons.favorite_border,color: Colors.red,),color: Colors.pinkAccent,)
                ),
                SizedBox(width: 10),
                Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white
                    ),

                    child: IconButton(icon: Icon(Icons.shopping_cart,color: Colors.red,),color: Colors.pinkAccent,onPressed: (){
                      Navigator.pushNamed(context, '/cartitem');
                    },)
                )
              ],
            )
        ),

      ],
    ),
  );
}