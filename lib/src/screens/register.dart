import 'package:flutter/material.dart';
import 'home.dart';
class Register extends StatelessWidget{
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Register',
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