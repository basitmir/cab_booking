import 'package:cab/src/screens/driver_list.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'home.dart';
import '../manager/tabs_manager.dart';
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
  //  List <Map<String,String>> singleDriver;
  void addDetails(String start, String end) {
    setState(() {
      origin = start;
      destination = end;
    });
  }

  List<Map<String, String>> _drivers = [
    {
      'name': 'Basit Mir',
      'cabNumber': 'JK2012-Xb',
      'image': 'assets/car.jpg',
      'address': 'Naseem Bagh',
      'city':'Srinagar',
      'age': '54',
      'experience': '20',
      'gender': 'male',
      'vacancy': '4',
      'mobile': '9419476521',
      'email' : 'basitmir98@gmail.com',
      'rating': '5',
    },
    {
      'name': 'Basit',
      'cabNumber': 'JK01L-2103',
      'image': 'assets/car.jpg',
      'address': 'Naseem Bagh',
       'city':'Srinagar',
      'age': '54',
      'experience': '20',
      'gender': 'male',
      'vacancy': '4',
      'mobile': '9419476521',
      'email' : 'basit@gmail.com',
      'rating': '5',
    },
    {
      'name': 'Sami',
      'cabNumber': 'JK2012-12',
      'image': 'assets/car.jpg',
      'address': 'Naseem Bagh',
       'city':'Srinagar',
      'age': '54',
      'experience': '20',
      'gender': 'male',
      'vacancy': '4',
      'mobile': '9419476521',
      'email' : 'basit@gmail.com',
      'rating': '5',
    },
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
        '/drivers': (BuildContext context) => DriverList(_drivers),
        '/booking': (BuildContext context) => Booking(origin, destination),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> driverDetails = settings.name.split('/');
        if (driverDetails[0] != '') {
          return null;
        }
        if (driverDetails[1] == 'driver') {
          final int index = int.parse(driverDetails[2]);
           Map<String,String> _singleDriver={
               'name':_drivers[index]['name'],
                'cabNumber':_drivers[index]['cabNumber'],
                'image':_drivers[index]['image'],
                'address':_drivers[index]['address'],
                'age':_drivers[index]['age'],
                'experience':_drivers[index]['experience'],
                'gender':_drivers[index]['gender'],
                'vacancy':_drivers[index]['vacancy'],
                'mobile':_drivers[index]['mobile'],
                'email':_drivers[index]['email'],
                 'city':_drivers[index]['city'],
                'rating':_drivers[index]['rating'],
          
           };
          return MaterialPageRoute(
            builder: (BuildContext context) => Tabs(
               _singleDriver
                ),
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
        padding:
            EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0, top: 15.00),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.orange.withOpacity(0.4), BlendMode.luminosity),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            textAtTop(),
            buttonAtBottom(context),
          ],
        ),
      ),
    );
  }
}

Widget textAtTop() {
  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: <Widget>[
      Text(
        'RIDEz',
        textAlign: TextAlign.center,
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
      Text(
        'Joyfull and Comfortable travel',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget buttonAtBottom(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      RaisedButton(
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
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
                Colors.orange,
                Colors.white,
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 9.9),
          child: const Text(
            'LOGIN',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
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
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            gradient: LinearGradient(
              begin: FractionalOffset(0.7, 0.8),
              end: FractionalOffset(0.0, 0.0),
              colors: <Color>[
                Colors.orange,
                Colors.white,
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 9.9),
          child: const Text(
            'REGISTER',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}
