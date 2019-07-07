import 'package:flutter/material.dart';
import '../helpers/ensure_visible.dart';
// import 'package:map_view/map_view.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'dart:async';
import '../models/location_model.dart';
// import 'package:location/location.dart' as geoloc;
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../models/location_model.dart';

class Home extends StatefulWidget {
  final Function addDetails;
  final LocationData getLocationDetails;
  Home(this.addDetails, this.getLocationDetails);
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  List<Marker> allMarkers = [];
  Completer<GoogleMapController> _controller = Completer();
  LocationData _locationData;

  @override
  void initState() {
    _locationData = widget.getLocationDetails;
    allMarkers.add(Marker(
        markerId: MarkerId('current'),
        position: LatLng(_locationData.latitude, _locationData.longitude),
        infoWindow: InfoWindow(title: 'current'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        )));
  _originController.text=_locationData.origin;
    super.initState();
  }

  @override
  void dispose() {
    // _addressInputFocusNode.removeListener(_updateLocation);
    super.dispose();
  }

  final FocusNode _addressInputFocusNode = FocusNode();

  final Map<String, dynamic> _homePageDetails = {
    'origin': null,
    'destination': null,
  };

  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Widget _location() {
  //   return Column(
  //     children: <Widget>[],
  //   );
  // }

  Widget _originFeild() {
    return TextFormField(
        controller: _originController,
        focusNode: _addressInputFocusNode,
        cursorColor: Colors.orange,
        style: TextStyle(
          color: Colors.orange[800],
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          //  border: InputBorder(
          //    borderSide:BorderSide(width:10.00)
          //  ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          contentPadding:
              EdgeInsets.only(bottom: 0.0, top: 0.0, left: 0.0, right: 0.0),

          labelText: 'Origin',
          labelStyle: TextStyle(
            color: Colors.orange[700],
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: Icon(
              Icons.trip_origin,
              color: Colors.orange[600],
              size: 21,
            ), // icon is 48px widget.
          ),
        ),
        validator: (String value) {
          value = _originController.text;
          if (value.length < 3 ||
              !RegExp(r'[#.0-9a-zA-Z\s,-]+$').hasMatch(value)) {
            return 'Please enter valid origin';
          } else
            return null;
        },
        onSaved: (String value) {
          // setState(() {
          _homePageDetails['origin'] = value;
          // _locationData.origin = _originController.text;
          // });
        });
  }

  Widget _destinationFeild() {
    return TextFormField(
        controller: _destinationController,
        //  focusNode: _addressInputFocusNode,
        cursorColor: Colors.orange,
        style: TextStyle(
          color: Colors.orange[800],
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          contentPadding:
              EdgeInsets.only(bottom: 0.0, top: 5.0, left: 0.0, right: 0.0),
          labelText: 'Destination',
          labelStyle: TextStyle(
            color: Colors.orange[700],
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: Icon(
              Icons.place,
              color: Colors.orange[600],
            ), // icon is 48px widget.
          ),
        ),
        validator: (String value) {
          value = _destinationController.text;
          if (value.length < 3 ||
              !RegExp(r'[#.0-9a-zA-Z\s,-]+$').hasMatch(value)) {
            return 'Please enter valid destination';
          } else
            return null;
        },
        onSaved: (String value) {
          setState(() {
            // _locationData.destinaiton = _destinationController.text;
            _homePageDetails['destination'] = value;
          });
        });
  }

  Widget _nextButton() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
          child: IconButton(
            icon:
                Icon(Icons.play_circle_outline, color: Colors.orange, size: 40),
            onPressed: nextPage,
          ),
        ),
      ],
    );
  }

  void nextPage() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.addDetails(
          _homePageDetails['origin'], _homePageDetails['destination']);
      Navigator.pushNamed(context, '/drivers');
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

//..............................end for working on maps...............

  Widget _googleMap() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(_locationData.latitude, _locationData.longitude),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _controller.complete(controller);
          });
        },
        markers: Set.from(allMarkers),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      floatingActionButton: Container(
        child: FloatingButtons(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: <Widget>[
          _googleMap(),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                ),
                height: 202,
                padding: EdgeInsets.fromLTRB(10.00, 35.00, 10.00, 00.00),
                child: ListView(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Column(
                              children: <Widget>[
                                EnsureVisibleWhenFocused(
                                  focusNode: _addressInputFocusNode,
                                  child: _originFeild(),
                                ),
                                _destinationFeild(),
                              ],
                            ),
                          ),
                          _nextButton(),
                        ],
                      ),
                    ),
                    // Image.network('https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg'),
                    // Navigate(_originController.text, _destinationController.text),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            'Basit Mir',
            style: TextStyle(color: Colors.white),
          ),
          accountEmail: Text(
            'basitmir@gmail.com',
            style: TextStyle(color: Colors.white70),
          ),
          currentAccountPicture: CircleAvatar(
            radius: 30.0,
            // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            backgroundColor: Colors.black12,
            child: Text(
              'Test',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
        ),
        ListTile(
          title: Text('My Trips'),
          leading: Icon(Icons.directions_car, color: Colors.orange[500]),
          onTap: () {},
        ),
        Divider(height: 0.0),
        ListTile(
          title: Text('Notifications'),
          leading: Icon(Icons.notifications_none, color: Colors.orange[500]),
          onTap: () {},
        ),
        Divider(height: 0.0),
        ListTile(
          title: Text('Payments'),
          leading: Icon(Icons.payment, color: Colors.orange[500]),
          onTap: () {},
        ),
        Divider(height: 0.0),
        ListTile(
          title: Text('Help'),
          leading: Icon(Icons.help, color: Colors.orange[500]),
          onTap: () {},
        ),
        Divider(height: 0.0),
        ListTile(
          title: Text('Settings'),
          leading: Icon(Icons.settings, color: Colors.orange[500]),
          onTap: () {},
        ),
        Divider(height: 0.0),
        ListTile(
          title: Text('Spread The Word'),
          leading: Icon(Icons.share, color: Colors.orange[500]),
          onTap: () {},
        ),
        Divider(height: 0.0),
        ListTile(
          title: Text('Rate Us'),
          leading: Icon(Icons.star, color: Colors.orange[500]),
          onTap: () {},
        ),
        Divider(height: 0.0),
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.power_settings_new, color: Colors.orange[500]),
          onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
          },
        ),
        Divider(height: 0.0),
      ],
    ),
  );
}

class FloatingButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(00.0, 90.0, 00.0, 0.0),
          child: FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, color: Colors.orange[500]),
            backgroundColor: Colors.transparent,
            heroTag: 0,
            foregroundColor: Colors.transparent,
            mini: true,
            elevation: 0.00,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 94.0, 32.0, 0.0),
          child: FloatingActionButton(
            onPressed: () {
              // Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.notifications, color: Colors.orange[500]),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            heroTag: 1,
            mini: true,
            elevation: 0.00,
          ),
        ),
      ],
    );
  }
}

// Marker currentLocation=Marker(
// markerId: MarkerId('current'),
// position: LatLng(lat, lng),
// infoWindow: InfoWindow(title:'current'),
// icon:BitmapDescriptor.defaultMarkerWithHue(
//   BitmapDescriptor.hueOrange,
// ),
// );

// Container(
//         padding:
//             EdgeInsets.only(bottom: 0.0, left: 0.0, right: 0.0, top: 0.00),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//              image:NetworkImage(_staticMapUri.toString()),
//               ),
//         ),
