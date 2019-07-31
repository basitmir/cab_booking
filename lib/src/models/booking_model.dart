import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../base.dart';

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

  Future<Map<String, dynamic>> booking(
      Map<String, dynamic> bookingDetails) async {
    print(bookingDetails);
    final http.Response response = await http.post(baseUrl + '/api/addBooking',
        body: json.encode(bookingDetails),
        headers: {'Content-Type': 'application/json'});
    print(response.body);
    bool hasError = true;
    String message = 'Something went wrong';
    if (response.statusCode == 200 || response.statusCode == 201) {
      hasError = false;
      message = 'You have sucessfully booked a cab';
    } else if (response.body.contains('Driver not available!')) {
      hasError = true;
      message = 'Driver not available!';
    }
    return {'error': hasError, 'message': message};
  }

  Future <Map<String, dynamic>> updateBooking(
      String bookingId, String driverId, String currentLocation) async {
    final Map<String, dynamic> updateData = {
      'currentLocation': currentLocation,
      'bookingId': bookingId,
      'driverId': driverId, 
    };
    final http.Response response = await http.post(
        baseUrl + '/api/updateBooking',
        body: json.encode(updateData),
        headers: {'Content-Type': 'application/json'});
    print(response.body);
    bool hasError = true;
    String message = 'Something went wrong';
    if (response.statusCode == 200 || response.statusCode == 201) {
      hasError = false;
      message = 'Trip Successfully Completed';
    }
    return {'error': hasError, 'message': message};
  }
}
