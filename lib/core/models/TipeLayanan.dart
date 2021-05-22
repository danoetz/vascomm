import 'dart:convert';

TipeLayanan tipeLayananFromJson(String str) => TipeLayanan.fromJson(json.decode(str));

String tipeLayananToJson(TipeLayanan data) => json.encode(data.toJson());

class TipeLayanan {
  TipeLayanan({
    this.id,
    this.name,
    this.photo,
    this.price,
    this.result,
    this.building,
    this.address,
  });

  int id;
  String name;
  String photo;
  String price;
  String result;
  String building;
  String address;

  factory TipeLayanan.fromJson(Map<String, dynamic> json) => TipeLayanan(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"] == null ? null : json["photo"],
        price: json["price"] == null ? null : json["price"],
        result: json["result"] == null ? null : json["result"],
        building: json["building"] == null ? null : json["building"],
        address: json["address"] == null ? null : json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "photo": photo == null ? null : photo,
        "price": price == null ? null : price,
        "result": result == null ? null : result,
        "building": building == null ? null : building,
        "address": address == null ? null : address,
      };
}
