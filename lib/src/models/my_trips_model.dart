import 'package:http/http.dart' as http;
import 'dart:convert';

Future <List> myTrips(String id) async {
    final http.Response response = await http.get(
      'http://192.168.43.254:443/api/getBooking/'+id
    );
     List responseData = [{
      'error': true,
      'message': 'Something went wrong'
    }];
    if (response.statusCode == 200 || response.statusCode == 201) {
      responseData = json.decode(response.body);
    } else if (response.statusCode == 401) {
      responseData = json.decode(response.body);
    }
    return responseData;
  }