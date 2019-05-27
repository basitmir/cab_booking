import 'package:flutter/material.dart';
import '../screens/driver_list.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _drivers = ['Basit Mir', 'Basit','Sami'];

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
      ),
      home: Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 21.0),
          ),
        ),
        body: DriverList(_drivers),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
