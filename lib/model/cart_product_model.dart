
import 'package:shop_app_mvvm_getx_besia/core/utils/constance.dart';


class CartProductModel {
  final String name, image, price;
  final int quantity;

  CartProductModel({
    required this.name,
    required this.quantity,
    required this.image,
    required this.price,
  });

  factory CartProductModel.fromJson(Map<dynamic, dynamic> map) =>
      CartProductModel(
        name: map[columnName],
        image: map[columnImage],
        price: map[columnPrice],
        quantity: map[columnQuantity],
      );

  toJson() {
    return {'name': name, 'image': image, 'price': price, 'quantity': quantity};
  }




}
