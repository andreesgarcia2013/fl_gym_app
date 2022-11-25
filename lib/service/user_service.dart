import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

import '../models/userInfo_model.dart';

class UserService with ChangeNotifier{
  
  
  //  UserService(token){
  //   var idUser=this.decodeToken(token);
  //   this.getUserInfo(idUser, token);
  //  }

  Future<bool> patchData(name, email, password, token) async {
    var userId=decodeToken(token);
    print(userId);
    final url = Uri.parse('http://10.0.2.2:3000/api/v1/store/$userId');
    Map data = {
      'name': name,
      'email': email,
      'password':password
    };
    String body = json.encode(data);
    final response = await http.patch(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: body);
    if (response.statusCode==200) {
      return await true;
    }
    else{
      return await false;
    }
  }

  decodeToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);    
    return (decodedToken["userId"]);
  }

  Future getUserInfo(String token) async{
    print("cargando info");
    var idUser=this.decodeToken(token);
    final url = Uri.parse('http://10.0.2.2:3000/api/v1/store/$idUser');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    
    var dataResponse=userInfoModelFromJson(response.body);
    return dataResponse;
  }
}