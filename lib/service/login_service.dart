import 'dart:convert';

import 'package:fl_gym_app/models/token_model.dart';
import 'package:fl_gym_app/models/userInfo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:jwt_decoder/jwt_decoder.dart';

class LoginService with ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   

   Future<String> credentials() async {
    final url = Uri.parse('http://10.0.2.2:3000/api/v1/store/login');
    Map data = {
      'email': emailController.text,
      'password': passwordController.text
    };
    String body = json.encode(data);

    final resp = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (resp.statusCode == 200) {
      var auth = jsonDecode(resp.body);
      final dataToken = tokenModelFromJson(resp.body);
      return(dataToken.token);
      // decodeToken(dataToken.token);
    } else {
      return(await "Wrong");
    }
  }

  decodeToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);    
    return (decodedToken["userId"]);
  }

  // getUserInfo(String idUser, String token) async{
  //   print("cargando info");
  //   final url = Uri.parse('http://10.0.2.2:3000/api/v1/store/$idUser');
  //   final response = await http.get(url, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   });
  //   final dataResponse=userInfoModelFromJson(response.body);
  //   notifyListeners();
  //   return (dataResponse); 
  // }
}
