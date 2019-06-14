import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return LoginScreen();
  }
}

class LoginScreen extends State<Login> {
  String email;
  String password;
  @override
void initState(){
  super.initState();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]);
}
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.orange.withOpacity(0.6), BlendMode.dstATop),
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(10.00,50.00,10.00,10.00),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'EMAIL',
                      filled: true,
                      fillColor: Colors.orange.withOpacity(0.4),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ), // icon is 48px widget.
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.go,
                    onChanged: (String value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(height: 7.0),
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'PASSWORD',

                      filled: true,
                      fillColor: Colors.orange.withOpacity(0.4),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ), // icon is 48px widget.
                    ),
                    textInputAction: TextInputAction.go,
                    obscureText: true,
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  // SizedBox(height: 2.0),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: FractionalOffset(0.6, 0.8),
                                end: FractionalOffset(0.0, 0.0),
                                colors: <Color>[
                                  Colors.orange,
                                  Colors.white,
                                ],
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 9.9, horizontal: 45.0),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ),
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
                    child: Row(
                     
                      children: <Widget>[
                        Expanded(
                          flex: 10,
                          child:Padding( 
                            padding: EdgeInsets.symmetric(horizontal: 60.00),
                         child: TextField(
                           textAlign: TextAlign.center, 
                            readOnly: true,
                            decoration: InputDecoration(
                               contentPadding: EdgeInsets.symmetric(horizontal:20.0,vertical: 8.0),
                              border: InputBorder.none,
                              hintText: "Don't have an account? SignUp ",
                        
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.orange.withOpacity(0.5),

                              // icon is 48px widget.
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
    
  }
  @override
dispose(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  super.dispose();
}
}
