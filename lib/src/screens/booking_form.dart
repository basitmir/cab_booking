import 'package:flutter/material.dart';
// import '../models/booking_model.dart';
import '../helpers/ensure_visible.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../models/location_model.dart';
// import 'navigation.dart';
class Booking extends StatefulWidget {
  final String origin;
  final String destination;
  final int driverAssignId;
  final Function bookingDetailFun;
  Booking(this.origin, this.destination,this.bookingDetailFun,this.driverAssignId);

  @override
  State<StatefulWidget> createState() {
    return BookingForm();
  }
}

class BookingForm extends State<Booking> {
  final FocusNode _addressInputFocusNode = FocusNode();
  bool _autoValidate = false;
//  BookingModel _bookingModel;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
   TextEditingController _originController = TextEditingController();
   TextEditingController _destinationController = TextEditingController();

  Map<String, dynamic> passDetails = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _bookingDetails = {
    'bookingUserId':null,
    'driverAssignId':null,
    'name': null,
    'origin': null,
    'destination': null,
    'contact': null,
    'tripDetails': 'oneWayTrip',
    'origin landMark': null,
    'date': null,
    'time': null,
  };
//.......................date Field..........................................................

  DateTime _date = DateTime.now().toUtc();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: _date,
      lastDate: DateTime(2099),
    );
    if (picked != null) {
      print(_date.toString());
      setState(() {
        _date = picked;
        DateTime modifyDate = DateTime.parse(_date.toString());
        _dateController.text =
            "${modifyDate.day}-${modifyDate.month}-${modifyDate.year}";
        _bookingDetails['date'] = _dateController.text;
      });
    }
  }

  Widget dateField() {
    return InkWell(
      onTap: () {
        _selectDate(context); //call to date widget
      },
      child: IgnorePointer(
        child: TextFormField(
          controller: _dateController,
          maxLines: 1,
          // keyboardType: passDetails['keyboard'],

          cursorColor: Colors.orange,
          style: TextStyle(color: Colors.orange[700]),

          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(bottom: 5.0, top: 10.0, left: 10.0, right: 5.0),
            // border: UnderLineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),

            labelText: 'DATE',
            labelStyle:
                TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              child: Icon(
                Icons.date_range,
                color: Colors.orange[500],
                size: 21,
              ), // icon is 48px widget.
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please enter valid date';
            } else
              return null;
          },
          onSaved: (value) {},
        ),
      ),
    );
  }
//.........................................Date Field close ...............................................

//.........................................Time Field.........................................
  TimeOfDay _time = TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child,
        );
      },
    );
    if (picked != null && picked != _time) {
      print(_time.toString());
      setState(() {
        _time = picked;

        _timeController.text = _time.format(context);
        print(_timeController.text);
        _bookingDetails['time'] = _timeController.text;
      });
    }
  }

  Widget timeField() {
    return InkWell(
      onTap: () {
        _selectTime(context); //call to date widget
      },
      child: IgnorePointer(
        child: TextFormField(
          controller: _timeController,
          maxLines: 1,
          // keyboardType: passDetails['keyboard'],

          cursorColor: Colors.orange,
          style: TextStyle(color: Colors.orange[700]),

          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(bottom: 5.0, top: 10.0, left: 10.0, right: 5.0),
            // border: UnderLineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),

            labelText: 'TIME',
            labelStyle:
                TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            prefixIcon: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              child: Icon(
                Icons.timer,
                color: Colors.orange[500],
                size: 21,
              ), // icon is 48px widget.
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please enter valid time';
            } else
              return null;
          },
          onSaved: (value) {},
        ),
      ),
    );
  }
//..........................................Time Field Close.........................................

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

  void saveDetails() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // BookingModel(
      //   name: _bookingDetails['name'],
      //   origin: _bookingDetails['origin'],
      //   destination: _bookingDetails['destination'],
      //   contact: int.parse(_bookingDetails['contact']),
      //   tripDetails: _bookingDetails['tripDetails'],
      //   date: _bookingDetails['date'],
      //   time: _bookingDetails['time'],
      //   landMark: _bookingDetails['landMark'],
      // );
       final SharedPreferences prefs = await SharedPreferences.getInstance();
       _bookingDetails['bookingUserId']=prefs.getInt('id');
       _bookingDetails['driverAssignId']=widget.driverAssignId;
       widget.bookingDetailFun(_bookingDetails);
      Navigator.pushNamed(context, '/payment');
      // print(_bookingDetails);
    } else {
      // setState(() { 
      _autoValidate = true;
      // });
    }
  }

  Widget radioField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 20.0,
        ),
        Text(
          'ONE-WAY TRIP',
          style: new TextStyle(
              fontSize: 16.0,
              color: Colors.orange,
              fontWeight: FontWeight.bold),
        ),
        Radio(
          value: 'oneWayTrip',
          activeColor: Colors.orange,
          groupValue: _bookingDetails['tripDetails'],
          onChanged: (details) =>
              setState(() => _bookingDetails['tripDetails'] = details),
        ),
        Text(
          'ROUND TRIP',
          style: new TextStyle(
              fontSize: 16.0,
              color: Colors.orange,
              fontWeight: FontWeight.bold),
        ),
        Radio(
          value: 'roundTrip',
          activeColor: Colors.orange,
          groupValue: _bookingDetails['tripDetails'],
          onChanged: (details) =>
              setState(() => _bookingDetails['tripDetails'] = details),
        ),
      ],
    );
  }
//.............................works on inputs for maps..............

  void initState() {
    _addressInputFocusNode.addListener(_updateLocation);
    // getStaticMap();
    super.initState();
  }

  @override
  void dispose() {
    _addressInputFocusNode.removeListener(_updateLocation);
    super.dispose();
  }

  void _updateLocation() {

    if(!_addressInputFocusNode.hasFocus){
    //  Navigate(_originController.text, _destinationController.text);
    }
    
  }

//..............................end for working on maps...............
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
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
        child: Column(children: <Widget>[
          Expanded(
            child: Card(
              margin: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
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
                    EnsureVisibleWhenFocused(
                      focusNode: _addressInputFocusNode,
                      child: formField(
                          _bookingDetails,
                          'origin',
                          passDetails = {
                            'icon': Icons.trip_origin,
                            'keyboard': TextInputType.text,
                            'lines': 4,
                          },
                          
                            // initalVal: widget.origin,
                          addressInputFocusNode: _addressInputFocusNode,
                           dataController: _originController.text=widget.origin,
                          ),
                    ),
                    EnsureVisibleWhenFocused(
                      focusNode: _addressInputFocusNode,
                    child:formField(
                        _bookingDetails,
                        'destination',
                        passDetails = {
                          'icon': Icons.place,
                          'keyboard': TextInputType.text,
                          'lines': 3,
                        },
                          // initalVal: widget.destination,
                         addressInputFocusNode: _addressInputFocusNode,
                          dataController: _destinationController.text=widget.destination,
                        // dataController: _destinationController=TextEditingController(text: widget.destination),
                         ),
                    ),
                    formField(
                        _bookingDetails,
                        'origin landMark',
                        passDetails = {
                          'icon': Icons.pin_drop,
                          'keyboard': TextInputType.text,
                          'lines': 3
                        }),
                    formField(
                        _bookingDetails,
                        'name',
                        passDetails = {
                          'icon': Icons.person,
                          'keyboard': TextInputType.text,
                          'lines': 2
                        }),
                    formField(
                        _bookingDetails,
                        'contact',
                        passDetails = {
                          'icon': Icons.contact_phone,
                          'keyboard': TextInputType.number,
                          'lines': 2
                        }),
                    dateField(),
                    timeField(),
                    SizedBox(height: 12.00),
                    radioField(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: saveButton(),
          ),
        ]),
      ),
    );
  }
}

Widget formField(
    _bookingDetails, String property, Map<String, dynamic> passDetails,
    { dynamic addressInputFocusNode, dataController}) {
  return TextFormField(
    
    //  controller: dataController,
    // focusNode: addressInputFocusNode,
    maxLines: passDetails['lines'],
    keyboardType: passDetails['keyboard'],
    cursorColor: Colors.orange,
    style: TextStyle(color: Colors.orange[700]),
    initialValue: dataController,
    decoration: InputDecoration(
      contentPadding:
          EdgeInsets.only(bottom: 5.0, top: 10.0, left: 10.0, right: 5.0),
      // border: UnderLineInputBorder(),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),

      labelText: property.toUpperCase(),
      labelStyle: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
      prefixIcon: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
        child: Icon(
          passDetails['icon'],
          color: Colors.orange[500],
          size: 21,
        ), // icon is 48px widget.
      ),
    ),
    validator: (value) {
      switch (property) {
        case 'origin':
          {
            return commonValidation(value, 'origin');
            // print('in the name');
          }
          break;
        case 'destination':
          {
            return commonValidation(value, 'destination');
          }
          break;
        case 'origin landMark':
          {
            return commonValidation(value, 'landMark');
          }
          break;
        case 'name':
          {
            return commonValidation(value, 'name');
          }
        case 'contact':
          {
            return contactValidation(value);
          }
      }
      return null;
    },
    onSaved: (value) {
      _bookingDetails[property] = value;
    },
  );
}

String commonValidation(value, msg) {
  if (value.length < 3 ||
      !RegExp(r'[#.0-9a-zA-Z\s,-]+$').hasMatch(value)) {
    return 'Please enter valid' + ' ' + msg;
  } else
    return null;
}

String contactValidation(value) {
  if (value.length != 10 || !RegExp(r'^\d{10}$').hasMatch(value)) {
    return 'Please enter valid number';
  } else
    return null;
}
