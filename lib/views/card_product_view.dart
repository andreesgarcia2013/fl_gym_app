import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CardProductView extends StatelessWidget {
  final List<ProductModel> products;
  const CardProductView(this.products);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(products[index].name);
      },
    );
  }
}
