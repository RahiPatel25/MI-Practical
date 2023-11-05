import 'dart:convert';

import 'package:mi_practical/modules/home/domain/entities/albums_entity.dart';

List<AlbumsModel> albumsModelFromJson(String str) => List<AlbumsModel>.from(json.decode(str).map((x) => AlbumsModel.fromJson(x)));

String albumsModelToJson(List<AlbumsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsModel {
  int? userId;
  int? id;
  String? title;

  AlbumsModel({
    this.userId,
    this.id,
    this.title,
  });

  factory AlbumsModel.fromJson(Map<String, dynamic> json) => AlbumsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}

extension AlbumsModelExtension on AlbumsModel {
  AlbumsEntity get toAlbumsEntity => AlbumsEntity(
        userId: userId,
        id: id,
        title: title,
      );
}
