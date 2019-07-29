import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.2, 0.8),
            end: FractionalOffset(0.0, 0.0),
            colors: <Color>[
              Color(0xFFFFFB74D),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: paymentDetails(context),
            ),
            Expanded(
              child: paymentDetails(context),
            ),
            Expanded(
              child: paymentDetails(context),
            ),
            Expanded(
              child: paymentDetails(context),
            ),
            // SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget paymentDetails(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(12.00, 40.00, 12.00, 00.00),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset(0.7, 0.8),
                  end: FractionalOffset(0.6, 0.0),
                  colors: <Color>[
                    Color(0xFFFFFB74D),
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'You will be charged ₹5.00 for every minute from the time of booking',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '“You have to give payment to the driver when the trip is completed”',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topCenter,
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/coin.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
