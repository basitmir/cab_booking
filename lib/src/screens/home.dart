import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Function addDetails;
  Home(this.addDetails);
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final Map<String, dynamic> _homePageDetails = {
    'origin': null,
    'destination': null,
  };

  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _originFeild() {
    return TextFormField(
        decoration: InputDecoration(
          //  border: InputBorder(
          //    borderSide:BorderSide(width:10.00)
          //  ),
          enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.orange),   
                      ),
         contentPadding: EdgeInsets.only(bottom: 0.0,top:0.0 ,left: 0.0, right: 0.0),

          labelText: 'Origin',
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: Icon(
              Icons.trip_origin,
              color: Colors.orange[500],
              size: 21,
            ), // icon is 48px widget.
          ),
        ),
        validator: (String value) {
          if (value.length < 3 || !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            return 'Please enter valid origin';
          } else
            return null;
        },
        onSaved: (String value) {
          // setState(() {
          _homePageDetails['origin'] = value;
          // });
        });
  }

  Widget _destinationFeild() {
    return TextFormField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.orange),   
                      ),
           contentPadding: EdgeInsets.only(bottom: 0.0,top:5.0, left: 0.0, right: 0.0),
          labelText: 'Destination',
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: Icon(
              Icons.pin_drop,
              color: Colors.orange[500],
            ), // icon is 48px widget.
          ),
        ),
        validator: (String value) {
          if (value.length < 3 || !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            return 'Please enter valid destination';
          } else
            return null;
        },
        onSaved: (String value) {
          setState(() {
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

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      floatingActionButton: Container(
        child: FloatingButtons(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(10.00, 35.00, 10.00, 00.00),
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
                            _originFeild(),
                            _destinationFeild(),
                          ],
                        ),
                      ),
                      _nextButton(),
                    ],
                  ),
                ),
              ],
            )),
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
            Navigator.pushNamed(context, '/login');
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
