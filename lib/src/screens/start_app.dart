import 'driver_list.dart';
import 'payment_details.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'my_trips.dart';
import 'register.dart';
import 'login.dart';
import 'payments.dart';
import 'notifications.dart';
import 'home.dart';
import 'driver_dashboard.dart';
import 'help.dart';
import 'offers.dart';
import '../manager/tabs_manager.dart';
import '../screens/booking_form.dart';
// import '../widgets/location_widget.dart';
import '../models/location_model.dart';
// import '../models/driver_model.dart';

class Start extends StatefulWidget {
  final Map<String, dynamic> savedData;
  final LocationData getLocationDetails;
  Start(this.savedData, this.getLocationDetails);
  @override
  State<StatefulWidget> createState() {
    return StartApp();
  }
}

class StartApp extends State<Start> {
  String origin;
  String destination;
  String userEmail;
  String userName;
  List _drivers;
  int driverAssignId;
  Map<String, dynamic> bookingDetails;
  // DriverModel driverModelList;

  //  List <Map<String,String>> singleDriver;
  // LocationData getLocationDetails;
  @override
  void initState() {
   
    // setState(() {
    //   driversList();
    // });

    super.initState();
  }

  @override
  void dispose() {
    // _addressInputFocusNode.removeListener(_updateLocation);
    super.dispose();
  }

  // void getUserLocationDetails() async {
  //   getLocationDetails = await getUserLocation();

  // }

  void bookDetails(Map<String, dynamic> booking) {
    setState(() {
      bookingDetails = booking;
    });
  }

  void addDetails(String start, String end) {
    setState(() {
      origin = start;
      destination = end;
    });
  }

  void getDriverDetails(List driver){
    setState(() {
     _drivers=driver;
    });
  }

  void authDetails(String username, String email) {
    setState(() {
      userName = username;
      userEmail = email;
    });
  }

  // void driversList() async {
  //   _drivers = await availableDrivers();
  // }

  // List<Map<String, String>> _drivers
  // [
  //   {
  //     'name': 'Basit Mir',
  //     'cabNumber': 'JK2012-Xb',
  //     'image': 'assets/car.jpg',
  //     'address': 'Naseem Bagh',
  //     'city': 'Srinagar',
  //     'state': 'j&k',
  //     'age': '54',
  //     'experience': '20',
  //     'gender': 'male',
  //     'vacancy': '4',
  //     'mobile': '9419476521',
  //     'email': 'basitmir98@gmail.com',
  //     'rating': '5',
  //   },
  //   {
  //     'name': 'Basit',
  //     'cabNumber': 'JK01L-2103',
  //     'image': 'assets/car.jpg',
  //     'address': 'Naseem Bagh',
  //     'city': 'Srinagar',
  //     'state': 'j&k',
  //     'age': '54',
  //     'experience': '20',
  //     'gender': 'male',
  //     'vacancy': '4',
  //     'mobile': '9419476521',
  //     'email': 'basit@gmail.com',
  //     'rating': '5',
  //   },
  //   {
  //     'name': 'Sami',
  //     'cabNumber': 'JK2012-12',
  //     'image': 'assets/car.jpg',
  //     'address': 'Naseem Bagh',
  //     'city': 'Srinagar',
  //     'state': 'j&k',
  //     'age': '54',
  //     'experience': '20',
  //     'gender': 'male',
  //     'vacancy': '4',
  //     'mobile': '9419476521',
  //     'email': 'basit@gmail.com',
  //     'rating': '5',
  //   },
  // ];

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
                fontFamily: 'myFont',
                accentColor: Colors.orange,
                unselectedWidgetColor: Colors.white),
            home: widget.savedData['token'] != null
                ? Home(addDetails, widget.getLocationDetails,
                    widget.savedData['userName'], widget.savedData['email'])
                : StartAppScreen(),
            debugShowCheckedModeBanner: false,
            routes: {
              '/login': (BuildContext context) => Login(authDetails),
              '/register': (BuildContext context) => Register(),
              '/home': (BuildContext context) => Home(
                  addDetails, widget.getLocationDetails, userName, userEmail),
              '/drivers': (BuildContext context) => DriverList(getDriverDetails),
              '/booking': (BuildContext context) =>
                  Booking(origin, destination, bookDetails, driverAssignId),
              '/payment': (BuildContext context) => Payment(bookingDetails),
              '/trips': (BuildContext context) => MyTrips(),
              '/help': (BuildContext context) =>Help(),
              '/payments': (BuildContext context) =>Payments(),
               '/offers': (BuildContext context) =>Offers(),
               '/driverDashboard':(BuildContext context) =>Dashboard(),
              '/notifications': (BuildContext context) =>Notifications(),
            },
            onGenerateRoute: (RouteSettings settings) {
              final List<String> driverDetails = settings.name.split('/');
              if (driverDetails[0] != '') {
                return null;
              }
              if (driverDetails[1] == 'driver') {
                final int index = int.parse(driverDetails[2]);
                driverAssignId = _drivers[index]['id'];
                Map<String, dynamic> _singleDriver = {
                  'userName': _drivers[index]['userName'],
                  'cabNumber': _drivers[index]['cabNumber'],
                  'id': _drivers[index]['id'],
                  'zip': _drivers[index]['zip'],
                  'age': _drivers[index]['age'],
                  'experience': _drivers[index]['experience'],
                  'gender': _drivers[index]['gender'],
                  'vacancy': _drivers[index]['vacancy'],
                  'phone': _drivers[index]['phone'],
                  'email': _drivers[index]['email'],
                  'city': _drivers[index]['city'],
                  'state': _drivers[index]['state'],
                  'address': _drivers[index]['address'],
                  //'rating': _drivers[index]['rating'],
                  'rating': '5',
                };
                return MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Tabs(_singleDriver, origin, destination),
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
      backgroundColor: Colors.orange[100],
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
    alignment: AlignmentDirectional.bottomCenter,
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
          fontSize: 110.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,

          // letterSpacing: 3.0
        ),
      ),
      Text(
        'Joyfull and Comfortable travel',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
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

// Widget _dataProcessing(BuildContext context) {
//   return MaterialApp(
//     theme: ThemeData(
//         primaryColor: Colors.orange[500],
//         iconTheme: IconThemeData(color: Colors.white),
//         fontFamily: 'myFont',
//         accentColor: Colors.white,
//         unselectedWidgetColor: Colors.white),
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       backgroundColor: Colors.orange[100],
//       body: Container(
//         padding:
//             EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0, top: 15.00),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage('assets/background.jpg'),
//             colorFilter: ColorFilter.mode(
//                 Colors.orange.withOpacity(0.4), BlendMode.luminosity),
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             textAtTop(),
//             Align(
//               alignment: Alignment.center,
//               child: AlertDialog(
//                 contentPadding: EdgeInsets.all(0.0),
//                 elevation: 0.0,
//                 backgroundColor: Colors.transparent,
//                 content: Center(
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         'Please Wait...',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       CircularProgressIndicator(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.00),
//           ],
//         ),
//       ),
//     ),
//   );
// }
