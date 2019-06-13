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
  String origin = '';
  String destination = '';
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      floatingActionButton: Container(
        child: FloatingButtons(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
          margin: EdgeInsets.fromLTRB(10.00, 35.00, 10.00, 00.00),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                     flex: 10,
                    child: Column(
                      children: <Widget>[
                        TextField(
                            decoration: InputDecoration(
                              //  border: InputBorder(
                              //    borderSide:BorderSide(width:10.00)
                              //  ),
                              contentPadding: EdgeInsets.only(
                                  bottom: 5.0, left: 10.0, right: 10.0),

                              labelText: 'Origin',
                              prefixIcon: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.trip_origin,
                                  color: Colors.orange[500],
                                  size: 21,
                                ), // icon is 48px widget.
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                origin = value;
                              });
                            }),

                        // flex: 3,
                        TextField(
                            decoration: InputDecoration(
                              labelText: 'Destination',
                              prefixIcon: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.orange[500],
                                ), // icon is 48px widget.
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                destination = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 10.0,0.0),
                      
                     child: IconButton(
                        icon: Icon(Icons.play_circle_outline,
                            color: Colors.orange, size: 40),
                        onPressed: () {
                          widget.addDetails(origin, destination);
                          Navigator.pushNamed(context, '/drivers');
                        },
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
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
            Navigator.popAndPushNamed(context, '/login');
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
