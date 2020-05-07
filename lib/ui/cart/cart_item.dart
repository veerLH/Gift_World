import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zingift/model/cart/cart_model.dart';
import 'package:zingift/ui/home/title.dart';

class cartItem extends StatefulWidget {
  @override
  _cartItemState createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {


  @override
  Widget build(BuildContext context) {
    final adddCart = Provider.of<cartModel>(context, listen: false);
    final total=adddCart.item;
    return Consumer<cartModel>(
        builder: (context, child, model)
    {
      return WillPopScope(
        onWillPop: () {
         _backhome(context);
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.orangeAccent.withOpacity(0.7),
            title: titleWidge("Cart Item"),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  adddCart.clearproduct();
                  setState(() {

                  });
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.clear, color: Colors.red,),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text("CLEAR",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold

                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          body: total.length == 0 ? Center(
            child: Text("No items in Cart",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.red
            ),),
          )
              : Column(

            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: total.length,
                  itemBuilder: (context, index) {
                    print(total.length);
                    return Stack(
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap:(){
                                  Navigator.pushNamed(context, '/detail',
                                      arguments:{
                                        'id': total[index]['id'],
                                        'main_photo': total[index]['main_photo'],
                                        'price':total[index]['prices'],
                                        'name':total[index]['name'],
                                        'category_id':total[index]['category_id'],
                                        'feature_photo':total[index]['feature_photo'],
                                        'description' : total[index]['description'],
                                        'qty': total[index]['qty']
                                      });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  width: 120,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.purple,
                                      ),
                                      borderRadius: BorderRadius.circular(20),

                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'http://restaurantpos.tunlinaing.me/public/storage/${total[index]['main_photo']}'),
                                          fit: BoxFit.cover)
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(total[index]['name'], style: TextStyle(
                                    fontFamily: 'Oswald',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),),
                                  SizedBox(height: 20,),
                                  Text(total[index]['qty'].toString() + " X " +
                                      total[index]['price'].toString(),
                                    style: TextStyle(
                                      fontFamily: 'Oswald',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),)
                                ],
                              ),
                              Row(

                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        adddCart.addproduct(total[index]);
                                      },
                                      color: Colors.green, iconSize: 35,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        adddCart.removeproduct(total[index]);
                                      },
                                      color: Colors.red, iconSize: 35,
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        Positioned(
                            top: -10,
                            right: 2,
                            child: Container(
                                child: IconButton(icon: Icon(
                                  Icons.delete, color: Colors.red,),
                                  color: Colors.pinkAccent,
                                  onPressed: () {
                                    setState(() {
                                          total.removeWhere((item) => item['id'] == total[index]['id']);
                                          adddCart.claculatetotal_zin(product: total);

                                    });
                                  },)
                            )
                        ),
                      ],
                    );
                  },
                ),
              ),

              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text("Total", style: TextStyle(
                          fontFamily: 'Bitter',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 45,
                        ),),
                        margin: EdgeInsets.all(10),
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            child: Text('${adddCart.totalcost.toString()}', style: TextStyle(
                              fontFamily: 'Bitter',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 25,
                            ),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("MMK", style: TextStyle(
                              fontFamily: 'Bitter',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13,
                            ),),
                          ),
                        ],
                      ),

                    ],
                  ),


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 35, bottom: 10),
                    child: FlatButton(
                        color: Colors.orangeAccent.withOpacity(0.7),
                        onPressed: () {

                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.only(top: 10),
                          width: 120,
                          height: 50,
                          child: Text("Buy", style: TextStyle(
                            fontSize: 25,

                          ), textAlign: TextAlign.center,),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
    );
  }

  void _backhome(BuildContext context){
    Navigator.of(context).pushNamed('/home');
  }
}


