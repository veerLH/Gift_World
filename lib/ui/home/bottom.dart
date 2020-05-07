import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zingift/model/cart/cart_model.dart';

class bottomPage extends StatefulWidget {

  Map<String,dynamic> map;
  bottomPage(this.map);
  @override
  _bottomPageState createState() => _bottomPageState();
}

class _bottomPageState extends State<bottomPage> {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.orangeAccent.withOpacity(0.4),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Expanded(
              child: _selectedWidgetDetail(
                  Icon(Icons.shopping_cart,color: Colors.red,),
                  "Add To Cart",widget.map)),
          SizedBox(
            width: 3,
            child: Container(
              color: Colors.orangeAccent,
            ),
          ),
          Expanded(
              child: _selectedWidgetDetail(
                  Icon(Icons.monetization_on,color: Colors.red,),
                  "Buy",widget.map)),

        ],
      ),
    );
  }

  Widget _selectedWidgetDetail(Icon icon,String str,Map product){
    final adding_cart = Provider.of<cartModel>(context, listen: false);
    return Consumer<cartModel>(
        builder: (context, child, model)
    {
      return InkWell(
        onTap: () {
          if (str == "Buy") {
            Navigator.pushNamed(context, '/payment',arguments: product);
          } else {
            print(product);
            adding_cart.addproduct(product);
            showAlertDialog(context);
          }
        },
        child: Container(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: icon,
              ),

              Text(str, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),)
            ],
          ),
        ),
      );
    }
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget remindButton = FlatButton(
    child: Text("Still at Page"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget cancelButton = FlatButton(
    child: Text("Search More"),
    onPressed:  () {
      Navigator.pushNamed(context, '/home');
    },
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Please Check Your cart",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          fontFamily: 'Oswald'
        ),),
        content: Image.asset('img/splash/birthday.png',width: 100,height: 100,),
        actions: [
          remindButton,
          cancelButton,
        ],
        elevation: 27,

      );
    },
  );
}

