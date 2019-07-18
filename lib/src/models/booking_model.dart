import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class BookingModel {
 
//  String name;
//  String origin;
//  String destination;
//  int contact;
//  String tripDetails='oneWayTrip';
//  String landMark;
//  String date; 
//  String time; 

//   BookingModel({
//     @required this.name,
//     @required this.origin,
//     @required this.destination,
//     @required this.contact,
//     @required this.tripDetails,
//     @required this.landMark,
//     @required this.date,
//     @required this.time,
//   });

Future<Map<String, dynamic>> booking(Map<String,dynamic> bookingDetails) async {
   print('tttttttttttttttttttttttttttttttttttttttt');
   print(bookingDetails);

    final http.Response response = await http.post(
        'http://192.168.43.254:443/api/addBooking',
        body: json.encode(bookingDetails),
        headers: {'Content-Type': 'application/json'});
        print(response.body);
    bool hasError = true;
    String message = 'Something went wrong';
    if (response.statusCode == 200 || response.statusCode == 201) {
      hasError = false;
      message = 'Sucessfully Registered';
    } else if (response.body.contains('Integrity constraint violation')) {
      hasError = true;
      message = 'User Already Registered';
    }
 
    return {'error': hasError, 'message': message};
  }

}
