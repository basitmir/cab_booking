import 'package:flutter/material.dart';

class DriverDetails extends StatelessWidget {
  final String name;
  final String number;
  DriverDetails(this.name, this.number);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Text(name + ' ' + number),
          RaisedButton(
            child: Text('Next'),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/booking'),
          ),
        ],
      ),
    );
  }
}
