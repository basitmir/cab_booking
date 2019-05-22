import 'dart:math';

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
          body: Column(
            children: [
              Card(
                margin: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                            backgroundColor: Colors.brown,
                            child: Text(
                              'Test',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          ),
                          Container(margin: EdgeInsets.only(left: 10.00)),
                          Column(
                            children: <Widget>[
                              Text(
                                'BASIT MIR',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'JK2012-XB',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.0),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.arrow_right),
                            tooltip: 'Know More',
                            iconSize: 35.0,
                            color:Colors.brown[300],
                            onPressed: () {},

                          ),
                        ],
                      ),
                    ),
                    Image.asset('assets/car.jpg'),
                    Text('Basit Mir')
                  ],
                ),
              ),
            ],
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
