import 'package:fl_gym_app/models/purchases_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class PurchasesService {
  getHistoryPurchases(token) async {
    var userId=decodeToken(token);
    List<PurchasesModel> purchases=[];
    final url = Uri.parse('http://10.0.2.2:3000/api/v1/purchases/byUser/$userId');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode==200) {
    var dataResponse=purchasesModelFromJson(response.body);
    purchases.addAll(dataResponse);
    return purchases;
    } else {
      return null;
    }

  }
  decodeToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);    
    return (decodedToken["userId"]);
  }
}