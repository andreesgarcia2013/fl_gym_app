import 'dart:convert';

import 'package:fl_gym_app/models/card_model.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class CardsService {
  getAllCards(String token) async {
    print("Cargando cards");
    List<CardModel> cards=[];
    var idUser = this.decodeToken(token);
    final url = Uri.parse('http://10.0.2.2:3000/api/v1/cards/byuser/$idUser');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode==200) {
      final cardsResponse=cardModelFromJson(response.body);
      cards.addAll(cardsResponse);
      return cards;
    } else {
      return null;
    }
  }

  decodeToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return (decodedToken["userId"]);
  }

  Future<bool> addCard(name, number,cvv, expiresDate, token) async {
    print('agregando tarjeta');
    var idUser = this.decodeToken(token);
    final url = Uri.parse('http://10.0.2.2:3000/api/v1/cards');
    final newValue = number.replaceAll(" ", "");
    Map data = {
      'ownerId':idUser,
      'name': name,
      'number': int.parse(newValue),
      'cvv':int.parse(cvv),
      'expires_date':expiresDate
    };
    String body = json.encode(data);
    final response = await http.post(url, headers: {
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
}
