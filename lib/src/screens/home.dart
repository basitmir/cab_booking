import 'package:flutter/material.dart';
// import '../manager/driver_manager.dart';
import '../manager/driver_manager.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('My Trips'),
              onTap: () {},
            )
          ],
        ),
       
      ),
       

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 110.0),
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

class FloatingButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    onPressed: () { Scaffold.of(context).openDrawer();},
    tooltip: 'Increment',
    child: Icon(Icons.menu,color: Colors.orange[500]),
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    mini: true,
    elevation: 0.00,

    
  
  
   );
  }
}