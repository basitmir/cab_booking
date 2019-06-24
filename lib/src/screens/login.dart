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

  Widget _loginEmail() {
    return TextField(
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
    );
  }

  Widget _loginPassword() {
    return TextField(
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
    );
  }

  Widget _loginButton() {
    return Padding(
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
              padding: EdgeInsets.symmetric(vertical: 9.9, horizontal: 45.0),
              child: const Text(
                'LOGIN',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
         _forgotPassword(),
        ],
      ),
    );
  }

 Widget _forgotPassword(){
   return  Text(
            'Forgot Password ?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          );
 }

  @override
  void initState() {
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
          margin: EdgeInsets.fromLTRB(10.00, 0.00, 10.00, 50.00),
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
                    height: 60.0,
                  ),
                  _loginEmail(),
                  SizedBox(height: 7.0),
                  _loginPassword(),
                  _loginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:bottomNavBar(context),
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

Widget bottomNavBar(context){
  return  Container(
        width: MediaQuery.of(context).size.width,
        height: 30.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: RaisedButton(
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: Container(
                  padding: EdgeInsets.only(top: 6.0),
                  width: MediaQuery.of(context).size.width,
                  height: 30.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset(0.4, 0.8),
                      end: FractionalOffset(0.0, 0.0),
                      colors: <Color>[
                        Color(0xFFFFA726),
                        Colors.white,
                      ],
                    ),
                  ),
                  // padding: EdgeInsets.symmetric(
                  // vertical: 9.9, horizontal: 100.0),
                  child: Text(
                    "Dont't have an account? SIGNUP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}