import 'package:flutter/material.dart';

class DriverDetails extends StatelessWidget {
  final String name;
  final String number;
  DriverDetails(this.name,this.number);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Driver Detail',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: Center(
        child: Text(name + ' ' + number),
      ),
    );
  }
}
