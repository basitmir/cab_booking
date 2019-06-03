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
       bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),

          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.chat),
            title: new Text('Chat'),
          ),
           BottomNavigationBarItem(
            icon: new Icon(Icons.network_cell),
            title: new Text('Navigate'),
          ),
          
          BottomNavigationBarItem(
              icon: Icon(Icons.help_outline), title: Text('Help'),
              ),
        ],
      ),
    );
  }
}
