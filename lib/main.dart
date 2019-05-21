import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Card(
          child: Column(
            children: <Widget>[
              Image.asset('assets/car.jpg'),
              Text('Basit Mir')
              ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
