
import 'package:flutter/material.dart';
import 'package:zingift/ui/home/action_cart.dart';
import 'package:zingift/ui/home/drawerWidget.dart';
import 'package:zingift/ui/home/product.dart';
import 'package:zingift/ui/home/title.dart';


class My_Home extends StatefulWidget {
  @override
  _My_HomeState createState() => _My_HomeState();
}

class _My_HomeState extends State<My_Home> {
  int index=0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orangeAccent.withOpacity(0.7),
          title: titleWidge('Gift World'),
          leading: IconButton(
            icon: Icon(Icons.menu,color: Colors.black
              ,),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          actions: <Widget>[
            addCart(context)
          ],
        ),

        drawer: drawerWidget(context),
        body: SingleChildScrollView(
            child:  ProductPage()
        ),
     bottomNavigationBar: BootomNav(),
    );
  }
  Widget BootomNav(){
    return  Container(
      color: Colors.orangeAccent.withOpacity(0.7),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: index==0?_selectedWidget(Icon(Icons.home,color: Colors.white,size: 30),"Home"):IconButton(icon: Icon(Icons.home,color: Colors.black,), onPressed: (){
              setState(() {
                index=0;
              });
            }),),
          Expanded(
            child: index==1?_selectedWidget(Icon(Icons.local_florist,color: Colors.white,size: 30),"Floral"):IconButton(icon: Icon(Icons.local_florist,color: Colors.black,), onPressed: (){
              setState(() {
                index=1;
              });
            }),),
          Expanded(
            child: index==2?_selectedWidget(Icon(Icons.picture_in_picture,color: Colors.white,size: 30), "Picture"):IconButton(icon: Icon(Icons.picture_in_picture,color: Colors.black,), onPressed: (){
              setState(() {
                index=2;
              });
            }),),
          Expanded(
            child: index==3?_selectedWidget(Icon(Icons.toys,color: Colors.white,size: 30,),"Toys"):IconButton(icon: Icon(Icons.toys,color: Colors.black,), onPressed: (){
              setState(() {
                index=3;
              });
            }),),
          Expanded(
            child:index==4?_selectedWidget(Icon(Icons.store_mall_directory,color: Colors.white,size: 30),"Hand Make"):IconButton(icon: Icon(Icons.store_mall_directory,color: Colors.black,), onPressed: (){
              setState(() {
                index=4;
              });

            }),),


        ],
      ),
    );
  }




}

Widget _selectedWidget(Icon icon,String str){
  return Container(

    child: Column(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        icon,
        Text(str,style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),)
      ],
    ),
  );
}







