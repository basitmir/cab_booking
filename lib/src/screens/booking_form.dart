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
  bool _autoValidate = false;
  Map<String, dynamic> iconList = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final Map<String, dynamic> _bookingDetails = {
    'name': null,
    'address': null,
    'origin': null,
    'destination': null,
    'contact': null,
    'oneWayTrip': null,
    'roundTrip': null,
    'landMark': null,
  };
//.......................FUunction Used..........................................................

  Widget saveButton() {
    return RaisedButton(
      elevation: 0.00,
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      onPressed: saveDetails,
      shape: StadiumBorder(side: BorderSide(color: Colors.white)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          gradient: LinearGradient(
            //  begin: FractionalOffset(0.7, 0.8),
            //  end: FractionalOffset(0.0, 0.0),
            colors: <Color>[
              Colors.orange,
              Colors.white,
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 9.9),
        child: const Text(
          'NEXT',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void saveDetails() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print(_bookingDetails);
      // Navigator.pushReplacementNamed(context, '/home');
    } else {
      // setState(() {
      _autoValidate = true;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Booking Details',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.8, 0.8),
                end: FractionalOffset(0.0, 0.8),
                colors: <Color>[
                  Color(0xFFFFFB74D),
                  Colors.white,
                ],
              ),
            ),
            child: ListView(
              children: <Widget>[
                formField(
                    _bookingDetails, 'origin', iconList = {'icon': Icons.email},initalVal: widget.origin),
                formField(_bookingDetails, 'destination',
                    iconList = {'icon': Icons.person},initalVal: widget.destination),
                formField(_bookingDetails, 'name',
                    iconList = {'icon': Icons.person}),
                formField(
                    _bookingDetails, 'address', iconList = {'icon': Icons.email}),
                formField(_bookingDetails, 'landmark',
                    iconList = {'icon': Icons.person}),
                formField(
                    _bookingDetails, 'contact', iconList = {'icon': Icons.email}),
                formField(_bookingDetails, 'onewaytrip',
                    iconList = {'icon': Icons.person}),
                formField(
                    _bookingDetails, 'roundtrip', iconList = {'icon': Icons.email}),
                formField(_bookingDetails, 'address',
                    iconList = {'icon': Icons.person}),
                saveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget formField(
    _bookingDetails, String property, Map<String, dynamic> iconList,{String initalVal=''}) {
  return TextFormField(
    initialValue: initalVal,
    decoration: InputDecoration(
      //  contentPadding: EdgeInsets.only(bottom: 0.0,top:0.0 ,left: 0.0, right: 0.0),
      // border: UnderLineInputBorder(),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),

      labelText: property.toUpperCase(),
      labelStyle: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
      prefixIcon: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
        child: Icon(
          iconList['icon'],
          color: Colors.orange[500],
          size: 21,
        ), // icon is 48px widget.
      ),
    ),
    validator: (value) {
      switch (property) {
        case 'name':
          {
            return validateName(value);
            // print('in the name');
          }
          break;
        case 'address':
          {
            print('in the address');
          }
      }
      return null;
    },
    onSaved: (value) {
      _bookingDetails[property] = value;
    },
  );
}

String validateName(value) {
  if (value.length < 3 || !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return 'Please enter valid name';
  } else
    return null;
}
