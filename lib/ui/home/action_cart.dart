
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zingift/model/cart/cart_model.dart';

Widget addCart(BuildContext context){
  final adddCart = Provider.of<cartModel>(context, listen: false);
  return Stack(
    children: <Widget>[
      IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.black,),iconSize: 30, onPressed: (){
        Navigator.pushNamed(context, '/cartitem');
      }),
      Consumer<cartModel>(
      builder: (context, child, model) {
        return adddCart.item.length==0?Container():Positioned(
          top: 2,
          right: 5,
          child: Container(
            padding: EdgeInsets.all(2.0),
            child: Text("${adddCart.item.length}",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),

            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
          ),
        );
      }),

    ],
  );
}