import 'package:flutter/material.dart';

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
          margin: EdgeInsets.all(10.00),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
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
                  SizedBox(height: 2.0),
                  Row(
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
                              vertical: 8.9, horizontal: 45.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
