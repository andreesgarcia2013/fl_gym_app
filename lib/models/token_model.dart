// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
    TokenModel({
       required this.user,
        required this.token,
    });

    String user;
    String token;

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        user: json["user"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "token": token,
    };
}
