import 'package:flutter/foundation.dart';

class Product {
  int id;
  String name;
  double price;
  String image;
  String desciption;
  String category;
  int stock;
  Specs specs;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.desciption,
    required this.category,
    required this.stock,
    required this.specs,
  });
  // Covert json to object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      desciption: json['description'],
      category: json['category'],
      stock: json['stock'],
      specs: Specs.fromJson(json['specs']),
    );
  }
}

class Specs {
  String cpu;
  String ram;
  String storage;
  String gpu;
  String display;
  Specs({
    required this.cpu,
    required this.ram,
    required this.storage,
    required this.gpu,
    required this.display,
  });
  factory Specs.fromJson(Map<String, dynamic> json) {
    return Specs(
      cpu: json['cpu'],
      ram: json['ram'],
      storage: json['storage'],
      gpu: json['gpu'],
      display: json['display'],
    );
  }
}
