import 'package:flutter/material.dart';
import '../screens/driver_list.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
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
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Drivers',
          style: TextStyle(color: Colors.white, fontSize: 21.0),
        ),
      ),
      body: DriverList(_drivers),
     
    );
  }
}
