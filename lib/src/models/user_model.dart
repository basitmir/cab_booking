import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../base.dart';

class User {
  final String id;
  final String email;
  final String userName;
  final String password;

  User(
      {@required this.id,
      @required this.email,
      @required this.userName,
      @required this.password});

  //..................register........................................
  Future<Map<String, dynamic>> register(
      String userName, String email, String password) async {
    final Map<String, dynamic> registerData = {
      'userName': userName,
      'email': email,
      'password': password,
    };

    final http.Response response = await http.post(
        baseUrl + '/api/userregister',
        body: json.encode(registerData),
        headers: {'Content-Type': 'application/json'});
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
//.........................end register................................
//.........................login api...................................

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, dynamic> registerData = {
      'email': email,
      'password': password,
    };

    final http.Response response = await http.post(
         baseUrl + '/api/userlogin',
        body: json.encode(registerData),
        headers: {'Content-Type': 'application/json'});
    Map<String, dynamic> responseData = {
      'error': true,
      'message': 'Something went wrong'
    };
    if (response.statusCode == 200 || response.statusCode == 201) {
      responseData = json.decode(response.body);
    } else if (response.statusCode == 401) {
      responseData = json.decode(response.body);
    }
    print(responseData);
    return responseData;
  }
  //...................end login..............................
}
