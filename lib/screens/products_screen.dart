import 'package:fl_gym_app/service/products_service.dart';
import 'package:fl_gym_app/views/card_product_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
   
  const ProductsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    
    
    return  Scaffold(
      body: CardProductView(productsService.products)
    );
  }
}