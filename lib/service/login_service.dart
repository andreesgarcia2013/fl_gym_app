import 'dart:convert';

import 'package:fl_gym_app/models/token_model.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginService {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   credentials() async {
    final url = Uri.parse('http://10.0.2.2:3000/api/v1/store/login');
    Map data = {'email': emailController.text,'password':passwordController.text};
    String body = json.encode(data);

    final resp = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (resp.statusCode == 200) {
      
      var auth = jsonDecode(resp.body);
      print(auth);
      final dataToken=tokenModelFromJson(resp.body);
      print(dataToken.token);
    } else {
      print(resp.body);
    }
  }
}
