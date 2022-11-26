// To parse this JSON data, do
//
//     final purchasesModel = purchasesModelFromJson(jsonString);

import 'dart:convert';

List<PurchasesModel> purchasesModelFromJson(String str) => List<PurchasesModel>.from(json.decode(str).map((x) => PurchasesModel.fromJson(x)));

String purchasesModelToJson(List<PurchasesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchasesModel {
    PurchasesModel({
        required this.id,
        required this.idUser,
        required this.total,
        required this.discount,
        required this.date,
        required this.methodPayment,
        required this.products,
        required this.address,
        required this.cardNumber,
        required this.name,
        required this.v,
    });

    String id;
    IdUser idUser;
    double total;
    double discount;
    String date;
    String methodPayment;
    List<Product> products;
    String address;
    double cardNumber;
    String name;
    int? v;

    factory PurchasesModel.fromJson(Map<String, dynamic> json) => PurchasesModel(
        id: json["_id"],
        idUser: IdUser.fromJson(json["idUser"]),
        total: json["total"].toDouble(),
        discount: json["discount"].toDouble(),
        date: json["date"],
        methodPayment: json["method_payment"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        address: json["address"],
        cardNumber: json["cardNumber"].toDouble(),
        name: json["name"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "idUser": idUser.toJson(),
        "total": total,
        "discount": discount,
        "date": date,
        "method_payment": methodPayment,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "address": address,
        "cardNumber": cardNumber,
        "name": name,
        "__v": v == null ? null : v,
    };
}

class IdUser {
    IdUser({
        required this.name,
    });

    String name;

    factory IdUser.fromJson(Map<String, dynamic> json) => IdUser(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Product {
    Product({
        required this.idProduct,
        required this.quantity,
    });

    IdProduct idProduct;
    int quantity;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduct: IdProduct.fromJson(json["idProduct"]),
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "idProduct": idProduct.toJson(),
        "quantity": quantity,
    };
}

class IdProduct {
    IdProduct({
        required this.id,
        required this.name,
        required this.price,
        required this.gallery,
    });

    String id;
    String name;
    int price;
    List<String> gallery;

    factory IdProduct.fromJson(Map<String, dynamic> json) => IdProduct(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        gallery: List<String>.from(json["gallery"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
    };
}
