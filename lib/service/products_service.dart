import 'package:fl_gym_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsService with ChangeNotifier{
  List<ProductModel> products=[];

  ProductsService(){
    this.getAllProducts();
  } 

  getAllProducts() async {
    print('cargando productos');
    final url=Uri.parse('http://10.0.2.2:3000/api/v1/products');
    final resp=await http.get(url);

    final productsResponse=productModelFromJson(resp.body);
    this.products.addAll(productsResponse);
    notifyListeners();
  }
}