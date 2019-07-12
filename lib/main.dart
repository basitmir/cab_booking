import 'package:flutter/material.dart';
import 'src/models/location_model.dart';
import 'src/widgets/location_widget.dart';
// import 'package:map_view/map_view.dart';
//  import 'src/manager/driver_manager.dart';
// import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/screens/start_app.dart';

void main() async{
  // getLocationDetails;
  // debugPaintSizeEnabled=true;
  // LocationData getLocationDetails;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   final Map<String,dynamic> savedData = {
      'userName':prefs.getString('userName'),
      'email':prefs.getString('email'),
      'token':prefs.getString('token'),
    };
  
  
    LocationData getLocationDetails = await getUserLocation();
  
 
  runApp(Start(savedData,getLocationDetails));
 
}

