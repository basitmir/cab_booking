import 'package:flutter/material.dart';
import '../screens/driver_list.dart';



class MyApp extends StatelessWidget {
 final List<Map<String,String>> drivers;
   MyApp(this.drivers);
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
      body: DriverList(drivers),
    );
  }
}
