import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../base.dart';

// void DriverModel {
// int id;
// String email;
// String userName;
// String city;
// String state;
// String country;
// String zip;
// int phone;
// String image;

// DriverModel(this.id, this.url, this.name);

Future<List> availableDrivers() async {
  final http.Response response =
      await http.get(baseUrl + '/api/getAvailableDrivers');
  List responseData = [
    {'error': true, 'message': 'Something went wrong'}
  ];
  if (response.statusCode == 200 || response.statusCode == 201) {
    responseData = json.decode(response.body);
  } else if (response.statusCode == 401) {
    responseData = json.decode(response.body);
  }
  print(responseData);
  return responseData;
}
// }
