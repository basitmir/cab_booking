import 'package:flutter/material.dart';
import 'home.dart';
class Login extends StatelessWidget{
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LOGIN',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Next'),
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Home(),
                ),
              ),
        ),
      ),
    );
  }
}