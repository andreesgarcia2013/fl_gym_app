// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

List<CardModel> cardModelFromJson(String str) => List<CardModel>.from(json.decode(str).map((x) => CardModel.fromJson(x)));

String cardModelToJson(List<CardModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardModel {
    CardModel({
        required this.id,
        required this.ownerId,
        required this.name,
        required this.number,
        required this.cvv,
        required this.expiresDate,
        required this.v,
    });

    String id;
    String ownerId;
    String name;
    int number;
    int cvv;
    String expiresDate;
    int v;

    factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["_id"],
        ownerId: json["ownerId"],
        name: json["name"],
        number: json["number"],
        cvv: json["cvv"],
        expiresDate: json["expires_date"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "ownerId": ownerId,
        "name": name,
        "number": number,
        "cvv": cvv,
        "expires_date": expiresDate,
        "__v": v,
    };
}
