// To parse this JSON data, do
//
//     final itemCardModel = itemCardModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ItemCardModel itemCardModelFromJson(String str) => ItemCardModel.fromJson(json.decode(str));

String itemCardModelToJson(ItemCardModel data) => json.encode(data.toJson());

class ItemCardModel {
    ItemCardModel({
        required this.products,
    });

    List<Product> products;

    factory ItemCardModel.fromJson(Map<String, dynamic> json) => ItemCardModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        required this.name,
        required this.price,
        required this.imageUrl,
        required this.desc,
    });

    String name;
    String price;
    String imageUrl;
    String desc;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "imageUrl": imageUrl,
        "desc": desc,
    };
}
