// import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/location_model.dart';
import 'package:location/location.dart' as geoloc;
// LocationData locationData;

Future<LocationData> getUserLocation() async {
    final location = geoloc.Location();
    bool hasPermission =
        await location.hasPermission() && await location.serviceEnabled();

    if (!hasPermission) {
      hasPermission =
          await location.requestPermission() && await location.requestService();
    }

    if (hasPermission) {
      final currentLocation = await location.getLocation();
      final origin = await _getAddress(
          currentLocation.latitude, currentLocation.longitude);
    final LocationData locationData=LocationData(
      origin: origin,
      latitude: currentLocation.latitude,
      longitude: currentLocation.longitude,
    );
      //  print(origin);
       return locationData;
      
    } else {
      final  LocationData locationData=LocationData(
        origin: '',
        latitude: 33.7782,
        longitude: 76.5762,
      );
     
      // print(locationData.latitude);
      // print('i dont have permission');
      // print(locationData.latitude);
      return locationData;
    }
  }

  Future<String> _getAddress(double lat, double lng) async {
    final Uri uri = Uri.https('maps.googleapis.com', '/maps/api/geocode/json', {
      'latlng': '${lat.toString()},${lng.toString()}',
      'key': 'AIzaSyAYSefL-7VDaENcauwR7Z3xLn82j00e0TI'
    });
    // print('uri');
    print(uri);
    final http.Response response = await http.get(uri);
    final decodeResponse = json.decode(response.body);

    final formattedAddress = decodeResponse['results'][0]['formatted_address'];
   
    return formattedAddress;
  }

  
  
