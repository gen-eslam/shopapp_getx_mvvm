import 'dart:ui';

import '../core/utils/extention.dart';

class ProductModel {
  final String name, description, sized, image, price;
  final Color color ;

  ProductModel({
    required this.name,
    required this.description,
    required this.image,
    required this.color,
    required this.price,
    required this.sized,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) => ProductModel(
      name: map['name'],
      description: map['description'],
      image: map['image'],
      color:HexColor.fromHex(map['color']),
      price: map['price'],
      sized: map['sized']);

  toJson() {
    return {
      "name": name,
      "description": description,
      "image": image,
      "color": color,
      "price": price,
      "sized": sized,
    };
  }
}
