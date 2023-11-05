import 'dart:convert';

import 'package:mi_practical/modules/home/domain/entities/photos_entity.dart';

List<HomeAlbumsEntity> homeAlbumsEntityFromJson(String str) =>
    List<HomeAlbumsEntity>.from(json.decode(str).map((x) => HomeAlbumsEntity.fromJson(x)));

String homeAlbumsEntityToJson(List<HomeAlbumsEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeAlbumsEntity {
  String? albumTitle;
  List<PhotosEntity>? photos;

  HomeAlbumsEntity({
    this.albumTitle,
    this.photos,
  });

  factory HomeAlbumsEntity.fromJson(Map<String, dynamic> json) {
    return HomeAlbumsEntity(
      albumTitle: json["albumTitle"],
      photos: List<PhotosEntity>.from(json["photos"].map((x) => PhotosEntity.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "albumTitle": albumTitle,
        "photos": List<dynamic>.from(photos?.map((x) => x.toJson()) ?? []),
      };
}
