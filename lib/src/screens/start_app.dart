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
          fontFamily: 'myFont'),
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
      body: Container(
        padding: EdgeInsets.only(bottom: 70.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
                  child: Text(
                    'RIDEz',
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Colors.orange,
                            blurRadius: 3.0,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                        color: Colors.white,
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                         fontStyle: FontStyle.italic,
                        // letterSpacing: 3.0
                        ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 310.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RaisedButton(
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  shape: StadiumBorder(),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                        begin: FractionalOffset(0.6, 0.8),
                        end: FractionalOffset(0.0, 0.0),
                        colors: <Color>[
                          Colors.orange,
                          Colors.white,
                        ],
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.8, horizontal: 57.0),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                   shape: StadiumBorder(),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                         begin: FractionalOffset(0.6, 0.8),
                        end: FractionalOffset(0.0, 0.0),
                        colors: <Color>[
                          Colors.orange,
                          Colors.white,
                        ],
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.8, horizontal: 50.0),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
