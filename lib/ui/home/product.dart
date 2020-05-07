import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:zingift/model/product/product_model.dart';
import 'package:zingift/network_util/api_service.dart';
class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> itemcount=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return _ListFutureTask(context);
  }


  FutureBuilder _ListFutureTask(BuildContext context){

    return FutureBuilder<ProductModel>(
        future: Provider.of<ApiService>(context,listen: false).getproductall(),
        builder: (BuildContext context,AsyncSnapshot<ProductModel> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Column(
                children: <Widget>[
                  Center(
                    child: Text("Something Wrond"),
                  ),
                ],
              );
            }
            final tasks = snapshot.data;
            List<dynamic> product =tasks.data;
            List<Map<String,dynamic>> ss=[];
            product.forEach((zin){
              Map<String,dynamic> dy= {
                'id': zin['id'],
                'main_photo': zin['main_photo'],
                'price':zin['prices'],
                'name':zin['name'],
                'category_id':zin['category_id'],
                'feature_photo':zin['feature_photo'],
                'description' : zin['description'],
                'qty': 1
              };
              ss.add(dy);
            });
            return _ListTask(context: context,product : ss);
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 300,
                ),
                Center(
                    child: SpinKitPumpingHeart(
                      color: Colors.pinkAccent,
                      size: 50.0,
                    ),
                  ),

              ],
            );
          }
        }
    );
  }

  Widget _ListTask({BuildContext context ,product}){

    product.forEach((dd){
      itemcount.add(dd['main_photo']);
    });
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child:Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(

                    autoPlay: true,
                    aspectRatio:2.0,
                    enlargeCenterPage: true,
                  ),
                  items:  itemcount.map((item)=>
                    Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                    "http://restaurantpos.tunlinaing.me/public/storage/${item}", fit: BoxFit.cover, width: 1000.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),

                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    )
                  ).toList()

                ),
              ],
            ),

          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: 280,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Art Collection",style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),

                Container(
                    height: 240,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.length,
                        itemBuilder: (BuildContext context,int index){
                          Map<String,dynamic> name= json.decode(product[index]['name']);
                          if(product[index]['category_id']=='2'){
                            return Container(
                              padding: EdgeInsets.all(15),
                              width: 260.0,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, '/detail',
                                      arguments:{
                                    'id' : product[index]['id'],
                                    'name': name['en'],
                                    'price' : product[index]['price'],
                                     'main_photo':product[index]['main_photo'],
                                    'feature_photo': product[index]['feature_photo'],
                                     'description':product[index]['description'],
                                      'qty' : product[index]['qty']
                                      });
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: NetworkImage("http://restaurantpos.tunlinaing.me/public/storage/${product[index]['main_photo']}"),
                                          fit: BoxFit.cover,
                                          colorFilter:
                                          ColorFilter.mode(Color(0xFFfaecfb), BlendMode.colorBurn),
                                        ) ,
                                      ),

                                    ),
                                    Positioned(
                                        top: 15,
                                        right: 20,
                                        child: Row(
                                          children: <Widget>[
                                            Container(

                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    color: Colors.white
                                                ),
                                                padding: EdgeInsets.all(5),
                                                child: Icon(Icons.favorite_border,color: Colors.pinkAccent,)
                                            )
                                          ],
                                        )
                                    ),

                                    Positioned(
                                        bottom: 15,
                                        left: 20,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    color: Colors.white
                                                ),
                                                padding: EdgeInsets.all(7),
                                                child: Text('${name['en']}',style: TextStyle(
                                                  fontFamily: 'Oswald',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,

                                                ),)
                                            )
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return Container();

                        })
                )

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10.0,left: 10),
            height: 270,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Toys Collection",style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),

                Container(
                  height: 240,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.length,
                      itemBuilder: (BuildContext context,int index){
                        Map<String,dynamic> name= json.decode(product[index]['name']);

                        return product[index]['category_id']=='3'?Container(
                          padding: EdgeInsets.all(15),
                          width: 260.0,
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/detail',
                                  arguments:{
                                    'id' : product[index]['id'],
                                    'name': name['en'],
                                    'price' : product[index]['price'],
                                    'main_photo':product[index]['main_photo'],
                                    'feature_photo': product[index]['feature_photo'],
                                    'description':product[index]['description'],
                                    'qty' : product[index]['qty']
                              });

                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: NetworkImage("http://restaurantpos.tunlinaing.me/public/storage/${product[index]['main_photo']}"),
                                      fit: BoxFit.cover,
                                      colorFilter:
                                      ColorFilter.mode(Color(0xFFfaecfb), BlendMode.colorBurn),
                                    ) ,
                                  ),

                                ),
                                Positioned(
                                    top: 15,
                                    right: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Container(

                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Colors.white
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Icon(Icons.favorite_border,color: Colors.pinkAccent,)
                                        )
                                      ],
                                    )
                                ),

                                Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Colors.white
                                            ),
                                            padding: EdgeInsets.all(7),
                                            child: Text('${name['en']}',style: TextStyle(
                                              fontFamily: 'Oswald',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,

                                            ),)
                                        )
                                      ],
                                    )
                                )
                              ],
                            ),
                          ),
                        ):Container();
                      }),
                )

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10.0,left: 10),
            height: 270,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Floral Collection",style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),

                Container(
                  height: 240,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.length,
                      itemBuilder: (BuildContext context,int index){
                        Map<String,dynamic> name= json.decode(product[index]['name']);
                        return product[index]['category_id']=='1'?Container(
                          padding: EdgeInsets.all(15),
                          width: 260.0,
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/detail',
                                  arguments:{
                                    'name': name['en'],
                                    'price' : product[index]['price'],
                                    'main_photo':product[index]['main_photo'],
                                    'feature_photo': product[index]['feature_photo'],
                                    'description':product[index]['description'],
                                    'qty' : product[index]['qty']
                              });
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: NetworkImage("http://restaurantpos.tunlinaing.me/public/storage/${product[index]['main_photo']}"),
                                      fit: BoxFit.cover,
                                      colorFilter:
                                      ColorFilter.mode(Color(0xFFfaecfb), BlendMode.colorBurn),
                                    ) ,
                                  ),

                                ),
                                Positioned(
                                    top: 15,
                                    right: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Container(

                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Colors.white
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Icon(Icons.favorite_border,color: Colors.pinkAccent,)
                                        )
                                      ],
                                    )
                                ),

                                Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Colors.white
                                            ),
                                            padding: EdgeInsets.all(7),
                                            child: Text('${name['en']}',style: TextStyle(
                                              fontFamily: 'Oswald',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,

                                            ),)
                                        )
                                      ],
                                    )
                                )
                              ],
                            ),
                          ),
                        ):Container();
                      }),
                )

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:10.0,left: 10),
            height: 270,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Hand Made Collection",style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),

                Container(
                  height: 240,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.length,
                      itemBuilder: (BuildContext context,int index){
                        Map<String,dynamic> name= json.decode(product[index]['name']);
                        return product[index]['category_id']=='4'?Container(
                          padding: EdgeInsets.all(15),
                          width: 260.0,
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/detail',
                                  arguments:{
                                    'id' : product[index]['id'],
                                    'name': name['en'],
                                    'price' : product[index]['price'],
                                    'main_photo':product[index]['main_photo'],
                                    'feature_photo': product[index]['feature_photo'],
                                    'description':product[index]['description'],
                                    'qty' : product[index]['qty']
                              });
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: NetworkImage("http://restaurantpos.tunlinaing.me/public/storage/${product[index]['main_photo']}"),
                                      fit: BoxFit.cover,
                                      colorFilter:
                                      ColorFilter.mode(Color(0xFFfaecfb), BlendMode.colorBurn),
                                    ) ,
                                  ),

                                ),
                                Positioned(
                                    top: 15,
                                    right: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Container(

                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Colors.white
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Icon(Icons.favorite_border,color: Colors.pinkAccent,)
                                        )
                                      ],
                                    )
                                ),

                                Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Colors.white
                                            ),
                                            padding: EdgeInsets.all(7),
                                            child: Text('${name['en']}',style: TextStyle(
                                              fontFamily: 'Oswald',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,

                                            ),)
                                        )
                                      ],
                                    )
                                )
                              ],
                            ),
                          ),
                        ):Container();
                      }),
                )

              ],
            ),
          ),
        ]);

  }

}
