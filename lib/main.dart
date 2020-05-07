import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:zingift/model/cart/cart_model.dart';
import 'package:zingift/network_util/api_service.dart';
import 'package:zingift/ui/cart/cart_item.dart';
import 'package:zingift/ui/cart/payment.dart';
import 'package:zingift/ui/home/detail.dart';
import 'package:zingift/ui/home/home.dart';
import 'package:zingift/ui/home/login.dart';
import 'package:zingift/ui/home/register.dart';
import 'package:zingift/ui/splash/splash.dart';


void main(){
  runApp(MyApp());
}

void _setupLogging(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec)=>{
    print("${rec.level.name}: ${rec.time} : ${rec.message}")
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<cartModel>(create: (context) => cartModel()),
        Provider(create: (context) => ApiService.create()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
            title: "Gift World",
            initialRoute: '/',
            routes: {
              '/':(context)=> My_Splash(),
              '/home' :(context) =>My_Home(),
              '/detail' : (context) => My_Detail(),
              '/cartitem' : (context) => cartItem(),
              '/payment' : (context) => paymentPage(),
              '/login' : (context) => loginPage(),
              '/register' : (context) => Register()
            },
      ),
    );
  }
}
