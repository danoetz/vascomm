import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.name,
    this.photo,
    this.price,
    this.qty,
    this.rating,
  });

  int id;
  String name;
  String photo;
  String price;
  int qty;
  int rating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"] == null ? null : json["photo"],
        price: json["price"] == null ? null : json["price"],
        qty: json["qty"] == null ? null : json["qty"],
        rating: json["rating"] == null ? null : json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "photo": photo == null ? null : photo,
        "price": price == null ? null : price,
        "qty": qty == null ? null : qty,
        "rating": rating == null ? null : rating,
      };
}
