import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Payment',
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
              child: Container(
                alignment: AlignmentDirectional.topCenter,
                child: CircleAvatar(
                  radius: 140.0,
                  backgroundImage: AssetImage('assets/payment.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Expanded(
              child: paymentDetails(context),
            ),
            // SizedBox(height: 50),
            RaisedButton(
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.orange.withOpacity(0.5),
                        title: Icon(Icons.sentiment_very_satisfied, size: 60.0),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Thank you for choosing RIDz',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0)),
                            Text(
                              'You have sucessfully booked a cab',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.popUntil(
                                  context, ModalRoute.withName('/home'));
                            },
                          ),
                        ],
                      );
                    });
                // Navigator.pushReplacementNamed(context, '/login');
              },
              shape: StadiumBorder(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.7, 0.8),
                    end: FractionalOffset(0.0, 0.0),
                    colors: <Color>[
                      Color(0xFFFFFB74D),
                      Colors.white,
                      // Colors.orange
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 9.9),
                child: const Text(
                  'HIRE A CAB',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget paymentDetails(BuildContext context) {
  return ListView(
    children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(12.00, 80.00, 12.00, 00.00),
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
                  height: 60.0,
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
                  'Note: Online Payment services will be included soon...',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white70,
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
              radius: 70.0,
              backgroundImage: NetworkImage(
                  'https://image.flaticon.com/icons/png/512/199/199558.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    ],
  );
}
