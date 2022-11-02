// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    ProductModel({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.availableItems,
        required this.available,
        required this.flavor,
        required this.measure,
        required this.quantity,
        required this.filing,
        required this.brand,
        required this.category,
        required this.gallery,
    });

    String id;
    String name;
    String description;
    int price;
    int availableItems;
    bool available;
    String flavor;
    String measure;
    double quantity;
    String filing;
    Brand brand;
    Brand category;
    List<String> gallery;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        availableItems: json["available_items"],
        available: json["available"],
        flavor: json["flavor"],
        measure: json["measure"],
        quantity: json["quantity"].toDouble(),
        filing: json["filing"],
        brand: Brand.fromJson(json["brand"]),
        category: Brand.fromJson(json["category"]),
        gallery: List<String>.from(json["gallery"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "available_items": availableItems,
        "available": available,
        "flavor": flavor,
        "measure": measure,
        "quantity": quantity,
        "filing": filing,
        "brand": brand.toJson(),
        "category": category.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
    };
}

class Brand {
    Brand({
        required this.name,
    });

    String name;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
