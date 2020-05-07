import 'package:flutter/material.dart';


class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final _fomkey = GlobalKey<FormState>();
  final _scaffoldKey= GlobalKey<ScaffoldState>();
  var email;
  bool _isLoading = false;
  var password;
  bool _show=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: WillPopScope(
        onWillPop: () {
      _backhome(context);
    },
    child:Container(
      color: Colors.orangeAccent.withOpacity(0.8),
      child: Stack(
        children: <Widget>[
          Positioned(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 50),
                  elevation: 3.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        key: _fomkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email,color: Colors.grey,),
                                  labelText: 'Email'
                              ),

                              validator: (emailValue){
                                if(emailValue.isEmpty){
                                  return 'Please Enter email';
                                }
                                email=emailValue;
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: !_show,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key,color: Colors.grey,),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        print(!_show);
                                        _show=!_show;
                                      });
                                    },
                                    icon: Icon(Icons.remove_red_eye,color: _show?Colors.blue:Colors.grey,),
                                  )
                              ),

                              validator: (passwordValue){
                                if(passwordValue.isEmpty){
                                  return 'Please Enter Password';
                                }
                                password=passwordValue;
                                return null;
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(onPressed: (){
                                if(_fomkey.currentState.validate()){

                                }
                              }, child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(_isLoading? 'Proccessing...': 'Login',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                                color: Colors.teal,
                                disabledColor: Colors.grey,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(16.0)
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                InkWell(
                  onTap:() {
                   Navigator.pushNamed(context, '/register');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Create New Account",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        decoration: TextDecoration.none
                    ),),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ),
      )
    );
  }
  void _backhome(BuildContext context){
    Navigator.of(context).pushNamed('/home');
  }
}
