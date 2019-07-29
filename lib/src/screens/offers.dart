import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Offers',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            //  height: MediaQuery.of(context).size.height,
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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: paymentDetails(
                      context,
                      'Biggest booking festival - Upto ₹500 cashback',
                      '“Get upto ₹500 cashback on booking 10 cabs within 30 days”'),
                ),
                Expanded(
                  child: paymentDetails(
                      context,
                      'Booking for Airpot- Get Flat ₹150 cashback',
                      '“Make 3 cab booking for Airpot in 90 days”'),
                ),

                // SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            // height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.3, 0.2),
                end: FractionalOffset(0.5, 0.8),
                colors: <Color>[
                  Color(0xFFFFFB74D),
                  Colors.white,
                ],
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: paymentDetails(
                      context,
                      'Round Way Trip - Flat ₹100 cashback',
                      '“Book 4 Round Way trip in 40 days”'),
                ),
                Expanded(
                  child: paymentDetails(
                      context,
                      'Book your first ride - Flat 20% cashback',
                      '“Get 20% cashback on payment of above ₹500 on your first ride”'),
                ),

                // SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentDetails(BuildContext context, String data1, String data2) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(12.00, 60.00, 12.00, 00.00),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset(0.7, 0.8),
                  end: FractionalOffset(0.0, 0.0),
                  colors: <Color>[
                    Color(0xFFFFFB74D),
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                // topLeft: Radius.circular(40.0),
                // topRight: Radius.circular(40.0)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    data1,
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
                    // '“Terms and Condition Applied*”',
                    data2,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topCenter,
              child:
                  Image.asset('assets/gift.png', width: 130.00, height: 130.00),
            ),
          ],
        ),
      ],
    );
  }
}
