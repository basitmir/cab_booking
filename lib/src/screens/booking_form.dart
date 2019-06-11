import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  final String origin;
  final String destination;
  Booking(this.origin, this.destination);
  
  @override
  State<StatefulWidget> createState() {
    return BookingForm();
  }
}

class BookingForm extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Booking',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: Center(
        child: Text(widget.origin + '' + widget.destination),
      ),
    );
  }
}
