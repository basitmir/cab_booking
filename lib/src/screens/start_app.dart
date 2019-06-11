import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'home.dart';
import '../manager/tabs_manager.dart';
import '../manager/driver_manager.dart';
import '../screens/booking_form.dart';

class Start extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartApp();
  }
}

class StartApp extends State<Start> {
  String origin;
  String destination;
  void addDetails(String start, String end) {
    setState(() {
      origin = start;
      destination = end;
    });
  }

  List<Map<String, String>> _drivers = [
    {'name': 'Basit Mir', 'cabNumber': 'JK2012-Xb', 'image': 'assets/car.jpg'},
    {'name': 'Basit', 'cabNumber': 'JK01L-2103', 'image': 'assets/car.jpg'},
    {'name': 'Sami', 'cabNumber': 'JK2012-12', 'image': 'assets/car.jpg'},
  ];

  void fetchDriver() async {
    //  var response= await get('http://www.splashbase.co/api/v1/images/random');
    //  var imageModel=ImageModel.fromJson(json.decode(response.body));
    // setState(() {
    //   _drivers.add(DriverModel);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange[500],
        iconTheme: IconThemeData(color: Colors.white),
        fontFamily: 'MyFont'
      ),
      home: StartAppScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (BuildContext context) => Login(),
        '/register': (BuildContext context) => Register(),
        '/home': (BuildContext context) => Home(addDetails),
        '/drivers': (BuildContext context) => MyApp(_drivers),
        '/booking': (BuildContext context) => Booking(origin, destination),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> driverDetails = settings.name.split('/');
        if (driverDetails[0] != '') {
          return null;
        }
        if (driverDetails[1] == 'driver') {
          final int index = int.parse(driverDetails[2]);
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                Tabs(_drivers[index]['name'], _drivers[index]['cabNumber']),
          );
        }
        return null;
      },
    );
  }
}

class StartAppScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Login'),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
            ),
            RaisedButton(
              child: Text('Register'),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/register'),
            ),
          ],
        ),
      ),
    );
  }
}
