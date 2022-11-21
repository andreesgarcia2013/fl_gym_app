// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
    UserInfoModel({
        required this.id,
        required this.name,
        required this.email,
        required this.isAdmin,
        required this.avatarId,
        required this.v,
        required this.userInfoModelId,
    });

    String id;
    String name;
    String email;
    bool isAdmin;
    String avatarId;
    int v;
    String userInfoModelId;

    factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        isAdmin: json["isAdmin"],
        avatarId: json["avatarId"],
        v: json["__v"],
        userInfoModelId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "isAdmin": isAdmin,
        "avatarId": avatarId,
        "__v": v,
        "id": userInfoModelId,
    };
}