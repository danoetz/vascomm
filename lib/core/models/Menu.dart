import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  Menu({
    this.id,
    this.value,
  });

  int id;
  String value;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"] == null ? null : json["id"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "value": value == null ? null : value,
      };
}
