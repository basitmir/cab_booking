import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
 
 
  Future<Map<String, dynamic>> register(
      String userName, String email, String password) async  {
    final Map<String, dynamic> registerData = {
      'userName': userName,
      'email': email,
      'password': password,
    };
       
    final http.Response response = await http.post(
        'http://192.168.43.254:443/api/userregister',
        body: json.encode(registerData),
        headers: {'Content-Type': 'application/json'});
       bool hasError=true;
       String message='Something went wrong';
    if (response.statusCode == 200) {
       hasError=false;
       message='Sucessfully Registered';
   }
   else if(response.body.contains('Integrity constraint violation')){
        hasError=true;
       message='User Already Registered';
   }
    
    return {'error': hasError, 'message': message};
   }
   
}
