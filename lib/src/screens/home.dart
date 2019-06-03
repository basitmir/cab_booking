import 'package:flutter/material.dart';
// import '../manager/driver_manager.dart';
import '../manager/driver_manager.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      floatingActionButton: Container(
        child: FloatingButtons(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Center(
        child: RaisedButton(
          child: Text('Next'),
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyApp(),
                ),
              ),
        ),
      ),
    );
  }
}

Widget drawer(){
  return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Basit Mir'),
              accountEmail: Text('basitmir@gmail.com'),
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
              leading: Icon(Icons.add_call),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('My Trips'),
              leading: Icon(Icons.add_call),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('My Trips'),
              leading: Icon(Icons.add_call),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('My Trips'),
              leading: Icon(Icons.add_call),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('My Trips'),
              leading: Icon(Icons.add_call),
              onTap: () {},
            ),
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
          padding: const EdgeInsets.fromLTRB(0.0, 110.0, 25.0, 0.0),
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
          padding: const EdgeInsets.fromLTRB(0.0, 110.0, 32.0, 0.0),
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
