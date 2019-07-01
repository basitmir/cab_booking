import 'package:flutter/material.dart';

class BookingModel {
 String name;
 String origin;
 String destination;
 int contact;
 String tripDetails='oneWayTrip';
 String landMark;
 String date;
 String time;

  BookingModel({
    @required this.name,
    @required this.origin,
    @required this.destination,
    @required this.contact,
    @required this.tripDetails,
    @required this.landMark,
    @required this.date,
    @required this.time,
  });
}
