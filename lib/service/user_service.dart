import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class UserService {
  patchData(name, email, password, token) async {
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
      print("Datos Modificados");
    }
    else{
      print(response.body);
    }
  }

  decodeToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);    
    return (decodedToken["userId"]);
  }
}