//import 'package:cab/src/screens/home.dart';
import 'package:flutter/material.dart';
import '../screens/chat.dart';
import '../screens/navigation.dart';
import '../screens/help.dart';
import '../screens/driver_details.dart';

class Tabs extends StatefulWidget { 
   final String origin;
   final String destination;
  final Map<String,String> singleDriver;
  Tabs(this.singleDriver,this.origin,this.destination);
  @override
  State<StatefulWidget> createState() {
    return _MyTabs();
  }
}

class _MyTabs extends State<Tabs> with SingleTickerProviderStateMixin {
  int _bottomNavBarIndex = 0;
  final List<Widget> _pageOption = [
    Chat(),
   // Navigate(widget.origin,widget.destination),
    Help(),
  ];

  @override
  void initState() {
    _pageOption.insert(0, DriverDetails(widget.singleDriver));
    _pageOption.insert(2, Navigate(widget.origin,widget.destination));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   iconTheme: IconTheme.of(context),
      //   centerTitle: true,
      //   title: Text(
      //     'Driver Detail',
      //     style: TextStyle(color: Colors.white, fontSize: 21.0),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/home')),
        mini: true,
        child: Icon(Icons.home, color: Colors.orange),
        backgroundColor: Colors.white,
        elevation: 0.00,
      ),
      body: _pageOption[_bottomNavBarIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 54.00,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.orange[500],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: _bottomNavBarIndex,

          unselectedIconTheme: IconThemeData(
            size: 18.00,
          ),

          onTap: (int index) {
            setState(() {
              _bottomNavBarIndex = index;
            });
          }, // this will be set when a new tab is tapped

          items: [
            BottomNavigationBarItem(
              icon:   Icon(Icons.person_pin),
              title:  Text('Details', style: TextStyle(fontSize: 11.00),),
            ),
            BottomNavigationBarItem(
              icon:  Icon(Icons.chat),
              title:  Text('Chat',style: TextStyle(fontSize: 11.00),),
            ),
            BottomNavigationBarItem(
              icon:  Icon(Icons.location_searching),
              title:  Text('Navigate',style: TextStyle(fontSize: 11.00),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              title: Text('Help',style: TextStyle(fontSize: 11.00),),
            ),
          ],
        ),
      ),
    );
  }
}
